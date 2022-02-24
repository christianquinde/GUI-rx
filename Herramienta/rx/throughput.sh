#!/bin/bash
intervalo=0.1

tcpstat -r pcaps_total/trafico_rx_total.pcap $intervalo > throughput/thro.csv
