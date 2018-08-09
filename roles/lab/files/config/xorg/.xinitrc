#!/bin/bash

# Apply QGtkStyle for Qt5
export QT_QPA_PLATFORMTHEME=gtk2

# Auto lock when idle and after suspend
xset s 180 90
xss-lock -- physlock -ms &

# Auto hide cursor, should migrate to hideaway later
unclutter &

# Set wallpaper
feh --bg-fill ~/wallpaper.jpg

# Status monitor for dwm
slstatus &

# Start dynamic windows manager
exec dwm
