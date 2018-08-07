#!/bin/bash

# Apply QGtkStyle for Qt5
export QT_QPA_PLATFORMTHEME=gtk2

# Auto lock when idle and after suspend
xset s 60 60
xss-lock -- physlock -ms &

# Auto hide cursor, should migrate to hideaway later
unclutter &

# Set wallpaper
feh --bg-fill ~/wallpaper.jpg

# Start i3 windows manager
exec i3
