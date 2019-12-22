# Applications
AddPackage arandr
AddPackage brightnessctl
AddPackage chromium
IgnorePackage --foreign chromium-widevine
AddPackage flameshot
AddPackage network-manager-applet
AddPackage notepadqq
AddPackage pcmanfm
AddPackage qpdfview
AddPackage stalonetray
AddPackage vlc

# Fonts
AddPackage noto-fonts-cjk
AddPackage noto-fonts-emoji
AddPackage noto-fonts-extra
AddPackage ttf-hack
AddPackage ttf-liberation
AddPackage ttf-roboto
CopyFile /etc/fonts/local.conf

# Theming
AddPackage arc-solid-gtk-theme
AddPackage breeze-icons
AddPackage qt5-styleplugins
IgnorePackage --foreign xcursor-breeze

# Windows Manager and Tools
IgnorePackage --foreign dmenu-git
IgnorePackage --foreign dwm
AddPackage feh
AddPackage physlock
IgnorePackage --foreign slstatus-git
IgnorePackage --foreign st
AddPackage udiskie
AddPackage unclutter
AddPackage xss-lock

# X.Org
AddPackage xorg-server
AddPackage xorg-xinit
AddPackage xorg-xrandr
