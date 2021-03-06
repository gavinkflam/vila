# Boot Manager - GRUB
AddPackage efibootmgr
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
AddPackage linux-lts
AddPackage linux-firmware
AddPackage linux-lts-headers

# Network
AddPackage dhcpcd
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
