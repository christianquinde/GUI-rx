#!/bin/bash

buffer=10000
ip_dst=$4

PEER_IP=$1
port_rx=$2
codec=$3

gnome-terminal --title "Captura_Rx" -- ./trafico.sh  $port_rx $PEER_IP $ip_dst 
echo "Recibiendo video ......" 


if [[ $codec == h264 ]]; then
    ext="mp4"
    echo $codec
    gnome-terminal --title "Reproducciòn $codec" -- ./rx_gst_h264.sh $port_rx $PEER_IP 
elif [[ $codec == h265 ]]; then
    ext="mp4"
    echo $codec
    gnome-terminal --title "Reproducciòn $codec" -- ./rx_gst_h265.sh $port_rx $PEER_IP 
elif [[ $codec == VP8 ]]; then
    ext="webm"
    echo $codec
    gnome-terminal --title "Reproducciòn $codec" -- ./rx_gst_VP8.sh $port_rx $PEER_IP 
else
    ext="webm"
    echo $codec
    gnome-terminal --title "Reproducciòn $codec" -- ./rx_gst_VP9.sh $port_rx $PEER_IP
fi
 


echo "-------------------------------- Cerrar la ventana de video para Continuar-------------------------------------"
