#!/bin/bash

#printf "VPN: " && (nmcli -p | awk '/PIA/{ print $3 " " $4 }' | cut -d '.' -f 1 && echo "No Connection") | head -n 1
{ 
    $(ip route | grep -q "tun") && 
    printf "+ VPN"
} || {
    echo -n "- VPN"
}
