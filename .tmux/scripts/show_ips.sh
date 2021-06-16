#!/usr/bin/env sh


RED_COLOR='colour124'
GREEN_COLOR='colour70'
DEFAULT_COLOR='default'


lan_ip () {
	#LAN_IP=$(ip route get 1.2.3.4 | cut -d ' ' -f 7 2>/dev/null)
	LAN_IP=$(hostname -I | awk '{print $1}')
	if [ ${#LAN_IP} -ge 7 ]; then
		printf " lan: #[fg=$GREEN_COLOR]$LAN_IP#[fg=$DEFAULT_COLOR] "
	#elif [[ $IP == *"unreachable"* ]]; then
	else
		printf " lan: #[fg=$RED_COLOR]✘#[fg=$DEFAULT_COLOR]  "
	fi
}


wan_ip () {
	sleep 0.1
	WAN_IP=$(curl -s -4 ifconfig.co 2>/dev/null)
	if [ ${#LAN_IP} -ge 7 ]; then
		printf " wan: #[fg=$GREEN_COLOR]$WAN_IP#[fg=$DEFAULT_COLOR] "
	else
		printf " wan: #[fg=$RED_COLOR]✘#[fg=$DEFAULT_COLOR]  "
	fi
}


lan_ip 
wan_ip
