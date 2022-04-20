#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Blank screen off
run xset dpms 0 0 0 && \
  xset s off && \
  xset s noblank

# Automount
udiskie_processes=$(ps aux | grep udiskie | wc -l)
if [[ $udiskie_processes -lt 2 ]]; then 
	run udiskie -n -a
fi

run ~/.screenlayout/home.sh

# # Language layputs
# run setxkbmap -option "grp:alt_shift_toggle" -layout "us,ru"
# # Network applet
# run nm-applet
# # Bluetooth applet
# run blueman-applet
# # Clipboard manager
# run parcellite
# # Gnome keyring daemon
# run /usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh
# # Compositor
# run compton -b -c --backend xrender --vsync none

# Auto lock screen
# LOCK_AFTER=10
# exec xautolock -detectsleep \
#   -time $LOCK_AFTER 
#   -locker "~/.config/awesome/locker.sh"
