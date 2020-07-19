# Common Languages
AddPackage go
AddPackage python

# Build Utilities
AddPackage cmake

# File Utilities
AddPackage atool
AddPackage git
AddPackage nano
AddPackage p7zip
AddPackage rsync
AddPackage unrar
AddPackage unzip
AddPackage vi
AddPackage zip

# Locale
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

# Man Pages
AddPackage man-db
AddPackage man-pages

# Network Utilities
AddPackage bind
AddPackage inetutils
AddPackage nmap
AddPackage wget

# SSH
AddPackage openssh
CopyFile /etc/ssh/sshd_config

# Sudo
CopyFile /etc/sudoers
