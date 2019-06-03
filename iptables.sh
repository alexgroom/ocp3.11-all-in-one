#!/bin/bash
iptables -t nat -A PREROUTING -p tcp -d 5.199.182.31 --dport 2379 -j DNAT --to-destination 192.168.0.60:2379
iptables -t nat -A OUTPUT -p tcp -d 5.199.182.31 --dport 2379 -j DNAT --to-destination 192.168.0.60:237

