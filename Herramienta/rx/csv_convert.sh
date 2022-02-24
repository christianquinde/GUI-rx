#!/bin/bash
tshark -r trafico_rx.pcap -T fields -e frame.time > trafico_rx.csv
tshark -r trafico_rx_total.pcap -T fields -e frame.time > trafico_rx_total.csv

