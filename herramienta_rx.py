# -*- coding: utf-8 -*-
"""
Created on Wed Dec  8 17:17:49 2021

@author: Christian Quinde
"""

import sys, math
#import numpy as np
#from pylab import *
#import matplotlib.pyplot as plt
from PyQt5 import uic
from PyQt5.QtWidgets import QApplication, QMainWindow
import subprocess
import os
import time


pwd=os.getcwd()
pwd=str(pwd)
print(pwd)

#Creamos una clase para poder Ejecutar nuestra Aplicacion "QMainWindow"
class Gui_Interfaz(QMainWindow):

    #Creamos nuestro constructor
    def __init__(self):
        super().__init__()
        uic.loadUi("herramienta.ui",self)
        self.Btn_cargar.clicked.connect(self.cargar)
        self.Btn_Tx.clicked.connect(self.stream)
        self.Btn_stop.clicked.connect(self.stop)
        self.Btn_Rx.clicked.connect(self.pcaps)
        self.bt_borrar.clicked.connect(self.borrar)
    
    def cargar(self):
        global ip, port, ext ,ipdes

        ip = self.ip_dst.text()
        port = self.port_dst.text()
        ext = self.exten.currentItem().text()
        ipdes=self.ip_dst_2.text()
        
        os.chdir(pwd+'/Herramienta/rx')
        self.tx_label.setText('Recibiendo Video ...')
        
    
    def stream(self):
        subprocess.run(['./trafico_rx.sh',str(ip),str(port),str(ext),str(ipdes)])
        
    
    def stop(self):
        subprocess.run('./kill.sh')
        

    def pcaps(self):
        os.chdir(pwd+'/Herramienta/rx')
        subprocess.run('./throughput.sh')
        time.sleep(1)
        os.chdir(pwd)
        subprocess.run(['./tx_pcaps.sh',str(ip)])


    def borrar(self):
        os.getcwd()
        os.chdir(pwd+'/Herramienta/rx')
        subprocess.run('./borrar.sh')


#Se ejecuta cuando iniciamos el Script
if __name__ == '__main__':
    #Inicia la aplicacion para abrirla y cerrarla
    app = QApplication(sys.argv)
    GUI = Gui_Interfaz()
    #Muestra nuestra aplicacion
    GUI.show()
    #Cierra nuestra aplicacion cuando le damos a cerrar
    sys.exit(app.exec_())
