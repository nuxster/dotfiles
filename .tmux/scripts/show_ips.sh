#!/usr/bin/env sh

RED_COLOR='colour124'
GREEN_COLOR='colour70'
DEFAULT_COLOR='default'

print_ip () {

	if [ ${#1} -ge 7 ]; then
		printf " $2 #[fg=$GREEN_COLOR]$1#[fg=$DEFAULT_COLOR] "
	else
		printf " $2 #[fg=$RED_COLOR]✘#[fg=$DEFAULT_COLOR]  "
	fi
}


get_ip () {

	LAN_IP=$(hostname -I | awk '{print $1}')
	WAN_IP=$(curl -s -4 ifconfig.co 2>/dev/null)
	
	if [ $LAN_IP = $WAN_IP ]; then
		print_ip $LAN_IP "ip:"
	else
		print_ip $LAN_IP "lan:"
		print_ip $WAN_IP "wan:"
	fi
}	

get_ip
