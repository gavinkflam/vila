# Certificates
IgnoreDir '/etc/ca-certificates'
IgnoreDir '/etc/ssl/certs'

# Docker
IgnoreDir '/var/lib/containerd'
IgnorePath '/etc/cni/net.d'
IgnorePath '/etc/docker/key.json'
IgnorePath '/var/lib/docker'

# Logs and Caches
IgnoreDir '/var/log'
IgnorePath '*.cache'
IgnorePath '*.log'
IgnorePath '/var/lib/logrotate.status'

# Network and Bluetooth
IgnoreDir '/etc/NetworkManager/system-connections'
IgnoreDir '/var/lib/ebtables'
IgnoreDir '/var/lib/NetworkManager'
IgnoreDir '/var/lib/bluetooth'
IgnoreDir '/var/lib/dhcpcd'
IgnoreDir '/var/lib/rpcbind'
IgnorePath '/etc/hostname'
IgnorePath '/etc/hosts'
IgnorePath '/etc/resolv.conf'
IgnorePath '/var/lib/misc/dnsmasq.leases'

# Pacman
IgnoreDir '/var/lib/pacman/local'
IgnoreDir '/var/lib/pacman/sync'
IgnorePath '*.pacnew'
IgnorePath '*.pacsave'
IgnorePath '/etc/pacman.d'
IgnorePath '/etc/pacman.d/mirrorlist'

# SSH
IgnorePath '/etc/ssh/*.pub'
IgnorePath '/etc/ssh/*_key'
IgnorePath '/etc/ssh/host_keys/*.pub'
IgnorePath '/etc/ssh/host_keys/*_key'

# System - Auth
IgnoreDir '/var/yubico'
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/gshadow'
IgnorePath '/etc/gshadow-'
IgnorePath '/etc/passwd'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/shadow'
IgnorePath '/etc/shadow-'
IgnorePath '/etc/shells'
IgnorePath '/etc/pam.d/other'
IgnorePath '/etc/pam.d/system-auth'
IgnorePath '/usr/bin/newgidmap'
IgnorePath '/usr/bin/newuidmap'

# System - Boot and Disks
IgnoreDir '/boot'
IgnoreDir '/etc/lvm'
IgnoreDir '/etc/mkinitcpio.d'
IgnorePath '/crypto_keyfile.bin'
IgnorePath '/etc/crypttab'
IgnorePath '/etc/default/grub'
IgnorePath '/etc/fstab'
IgnorePath '/etc/mkinitcpio.conf'
IgnorePath '/etc/ykfde.conf'

# System - Time
IgnorePath '/etc/adjtime'
IgnorePath '/etc/localtime'
IgnorePath '/var/lib/ntp/ntp.drift'

# System - Misc
IgnoreDir '/etc/security/limits.d'
IgnoreDir '/lost+found'
IgnoreDir '/usr/include'
IgnoreDir '/usr/lib/modules'
IgnoreDir '/usr/local/man/man1'
IgnoreDir '/usr/share/fonts'
IgnoreDir '/usr/share/mime'
IgnoreDir '/var/db'
IgnoreDir '/var/lib/dkms'
IgnoreDir '/usr/lib/ghc-*'
IgnoreDir '/var/tmp'
IgnorePath '/etc/fonts/fonts.conf'
IgnorePath '/etc/os-release'
IgnorePath '/etc/xml/catalog'
IgnorePath '/usr/lib/locale/locale-archive'
IgnorePath '/usr/lib/udev/hwdb.bin'
IgnorePath '/usr/share/glib-2.0/schemas/gschemas.compiled'
IgnorePath '/usr/share/info/dir'
IgnorePath '/var/lib/colord'
IgnorePath '/var/lib/dbus/machine-id'
IgnorePath '/var/lib/machines'
IgnorePath '/var/lib/portables'
IgnorePath '/var/lib/private'

# Systemd
IgnoreDir '/etc/systemd/system/*.target.wants'
IgnoreDir '/etc/systemd/user/*.target.wants'
IgnoreDir '/var/lib/systemd/backlight'
IgnoreDir '/var/lib/systemd/coredump'
IgnoreDir '/var/lib/systemd/home'
IgnoreDir '/var/lib/systemd/linger'
IgnoreDir '/var/lib/systemd/rfkill'
IgnoreDir '/var/lib/systemd/timers'
IgnorePath '/etc/.updated'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/systemd/system/dbus-org.bluez.service'
IgnorePath '/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service'
IgnorePath '/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service'
IgnorePath '/etc/systemd/system/dbus-org.freedesktop.resolve1.service'
IgnorePath '/etc/systemd/pstore'
IgnorePath '/var/.updated'
IgnorePath '/var/lib/systemd/catalog/database'
IgnorePath '/var/lib/systemd/random-seed'

# Virtual Machine
IgnoreDir '/etc/libvirt'
IgnoreDir '/var/lib/libvirt'

# User Software
IgnoreDir '/opt'
IgnorePath '/usr/lib/vlc/plugins/plugins.dat'
