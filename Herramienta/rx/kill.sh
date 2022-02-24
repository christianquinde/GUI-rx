#!/bin/bash
killall tcpdump
rm -r csv
mkdir csv
rm -r csv_total
mkdir csv_total
rm -r pcaps
mkdir pcaps
rm -r pcaps_total
mkdir pcaps_total
rm -r video
mkdir video
echo "Conviertiendo a .csv ......."
sleep 4
./csv_convert.sh
mv trafico_rx.pcap pcaps
mv trafico_rx_total.pcap pcaps_total
mv trafico_rx.csv csv
mv trafico_rx_total.csv csv_total
echo "Conversion Finalizada ......."	
