#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Keyboard layout switcher
#run setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

# Clipboard manager
run parcellite

# Automount
udiskie_processes=$(ps aux | grep udiskie | wc -l)
if [[ $udiskie_processes -lt 2 ]]; then 
	run udiskie -n -a
fi

# Auto lock screen
LOCK_AFTER=10
exec xautolock -detectsleep -time $LOCK_AFTER -locker "~/.config/awesome/locker.sh"

