#!/bin/bash

bgp_router_ip='xx.xx.xx.xx'

if [ "$1" = 'start' ]; then
    iptables -A INPUT -s $bgp_router_ip -p tcp --dport 179 -j ACCEPT
fi
