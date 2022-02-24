#!/bin/bash
PEER_V=$1
PEER_IP=$2
CAPS_V="media=(string)video,clock-rate=(int)90000,encoding-name=(string)H264,payload=(int)103" 
gst-launch-1.0 \
    rtpsession name=r sdes="application/x-rtp-source-sdes,cname=(string)\"user\@example.com\"" \
    udpsrc port=$PEER_V \
    ! "application/x-rtp,$CAPS_V" \
    ! r.recv_rtp_sink r.recv_rtp_src \
    ! rtph264depay \
    ! h264parse \
    ! avdec_h264 \
    ! autovideosink udpsrc port=$((PEER_V+1)) \
    ! r.recv_rtcp_sink r.send_rtcp_src \
    ! udpsink host=$PEER_IP port=$((PEER_V+1)) sync=false async=false
