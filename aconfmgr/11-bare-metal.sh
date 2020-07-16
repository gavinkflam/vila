# Boot Manager
AddPackage grub

# File System Utilities
AddPackage e2fsprogs
AddPackage jfsutils
AddPackage ntfs-3g
AddPackage xfsprogs

# Full Disk Encryption
AddPackage cryptsetup
AddPackage lvm2

# Hardware Inspection
AddPackage dmidecode

# Kernel
AddPackage linux
AddPackage linux-firmware
AddPackage linux-headers

# Network
AddPackage dhcpcd
AddPackage netctl
AddPackage networkmanager

CopyFile /etc/NetworkManager/conf.d/dhcp-client.conf
CopyFile /etc/NetworkManager/conf.d/dns.conf
CopyFile /etc/systemd/resolved.conf

# Pacman
AddPackage pacman-contrib
CopyFile /etc/systemd/system/pacman-mirrors-refresh.service
CopyFile /etc/systemd/system/pacman-mirrors-refresh.timer

# Terminal Lock Screen
CopyFile /etc/systemd/system/setterm.service

# Time Server
AddPackage ntp
CopyFile /etc/ntp.conf
