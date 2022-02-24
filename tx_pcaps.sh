#!/bin/bash

ip=$1

nc -w 2 $ip 9899 < Herramienta/rx/csv/trafico_rx.csv
sleep 1
nc -w 2 $ip 9998 < Herramienta/rx/csv_total/trafico_rx_total.csv
sleep 1
nc -w 2 $ip 9989 < Herramienta/rx/throughput/thro.csv

echo "---- Envio de CSV finalizada ------"
