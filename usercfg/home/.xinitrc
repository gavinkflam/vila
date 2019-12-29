#!/bin/bash

# Apply QGtkStyle for Qt5
export QT_QPA_PLATFORMTHEME=gtk2

# Configure pinentry to use the current tty
GPG_TTY=$(tty)
export GPG_TTY
gpg-connect-agent updatestartuptty /bye > /dev/null

# Auto lock when idle and after suspend
xset s 180 90
xss-lock -- physlock -ms &

# Auto hide cursor, should migrate to hideaway later
unclutter &

# Set wallpaper
feh --bg-fill ~/wallpaper.jpg

# Disable microphones
amixer set 'Capture' nocap

# Status monitor for dwm
slstatus &

# Mount devices automatically
udiskie &

# Start dynamic windows manager
dbus-launch --sh-syntax --exit-with-session dwm
