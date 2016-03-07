#!/bin/bash

PATH=/usr/sbin:/sbin:/bin:/usr/bin

INNET="172.17.0.0/16"
EXTIF="eth1"
INIF="eth0"

function clear_all_rule(){
    iptables -F
    iptables -t nat -F
    iptables -t mangle -F
    iptables -X
    echo 0 > /proc/sys/net/ipv4/ip_forward
}

function add_NAT_rule(){
    iptables -A INPUT -i $INIF -j ACCEPT
    iptables -t nat -A POSTROUTING -s $INNET -o $EXTIF -j MASQUERADE
    echo 1 > /proc/sys/net/ipv4/ip_forward
}


case $1 in
    "add")
        echo "add NAT rules";
        clear_all_rule;
        add_NAT_rule;
    ;;
    "del")
        clear_all_rule;
        echo "remove NAT rules "
    ;;
    *)
        echo "Usage: ./NAT.sh [add|del]"
        exit 0
    ;;

esac

