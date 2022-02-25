# GUI-rx
Herramienta para la recepción de video

Esta herramienta se diseñó mediante scripts de Linux para cumplir con las distintas funcionalidades y los experimentos se efectuaron en ordenadores con sistema operativo Ubuntu 20.04. Para efectuar los diferentes cálculos también se implementaron scripts en Python 3.7. 

Esta herramienta se ejecuta en paralelo con la herramienta GUI dsiponible en : https://github.com/christianquinde/GUI

En la siguiente Figura se muestra el diagrama secuencial de las herramientas en Tx y Rx.

![gui_func](https://user-images.githubusercontent.com/68077496/155746084-d72953c8-5abe-495d-9334-043c382a87b2.png)

# Funcionamiento

## 1: Cargar
Primero se cargan los datos mediante el botón Cargar. Cabe mencionar que se debe seleccionar el mismo códec y puerto que se usa para transmitir. Y tener claro las IPs de origen y destino.

## 2: Recibir Video
Después de cargar los datos se da clic al botón Recibir Video, para poder admitir flujos de video. Permitiendo realizar una captura con tcpdump.

## 3: STOP
Al finalizar la reproducción de todo el video. Se da clic al botón STOP. Permitiendo convertir las capturas realizadas a CSV.

## 4: Enviar PCAPs
Después que el transmisor abra los puertos, se envía los Pcaps y CSV.

## 5: Borrar
Finalmente, si se desea borrar todos los archivos generados se da clic al botón borrar.
