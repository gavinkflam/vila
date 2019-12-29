# Acpi
AddPackage acpi
CopyFile /etc/systemd/system/disable-acpi-wakeups.service

# Boot
AddPackage intel-ucode

# Keyboard
IgnorePackage --foreign hid-apple-plugboard-git-dkms

# Init
CopyFile /etc/systemd/logind.conf

# Intel Undervolt
IgnorePackage --foreign intel-undervolt
CopyFile /etc/intel-undervolt.conf

# Power Saving
AddPackage ethtool
AddPackage smartmontools
AddPackage tlp
AddPackage x86_energy_perf_policy

CopyFile /etc/default/tlp
CopyFile /etc/modprobe.d/snd_hda_intel.conf

# Sound
AddPackage alsa-utils

# Touchpad
CopyFile /usr/share/X11/xorg.conf.d/30-touchpad.conf

# Wireless
AddPackage bluez
AddPackage bluez-utils
AddPackage broadcom-wl-dkms
