#!/usr/bin/env sh

revert() {
  xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 5 5 5
i3lock -n -c 535d6c
revert
