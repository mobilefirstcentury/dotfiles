#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

echo $(date +%Y.%m.%d-%H:%M:%S) ": Loading xinitrc  ..." >> ~/.logs./xlog

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout fr
#exec xscreensaver &
#xcompmgr -c -f -r 28 D 10 &
xrdb -merge ~/.Xresources
exec i3
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
