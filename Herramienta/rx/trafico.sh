#!/bin/bash

rtpport=$1
ip_src=$2
ip_dst=$3
rtcpport=$((rtpport+1))

echo $rtpport
echo $ip_src
echo $ip_dst
echo $rtcpport


sleep 1
tcpdump port $rtpport and udp and src $ip_src and dst $ip_dst -w trafico_rx_total.pcap -i wlx00c0ca98634b &
tcpdump port $rtcpport and src $ip_dst -w trafico_rx.pcap -i wlx00c0ca98634b

#tcpdump port $rtpport and udp and src $ip_src and dst $ip_dst -w trafico_rx_total.pcap -i tun0 &
#tcpdump port $rtcpport and src $ip_dst -w trafico_rx.pcap -i tun0

#tcpdump port 1234 and udp and src 127.0.0.1 and dst 127.0.0.1 -w trafico_rx_total.pcap -i lo &
#tcpdump port 1235 and src 127.0.0.1 -w trafico_rx.pcap -i lo 
#sleep 15
#killall tcpdump 
