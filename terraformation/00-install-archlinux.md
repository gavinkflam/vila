# 0. Install ArchLinux

## BIOS Configuration

- Press F10 to enter BIOS configuration screen, update the boot medium
- Save and restart
- Boot into the live environment

## Live Environment

- Connect to the internet
  - `iwctl`
  - `station wlan0 connect SSID`
  - Ctrl-D, `ping google.com`
- Update system clock
  - `timedatectl set-ntp true`

## Partitioning

```
Number  Start  (sector)    End (sector)  Size        Code  Name
1                2048         1230847   600.0MiB     EF00  EFI System
2             1230848         2459647   600.0MiB     8300  Linux filesystem
3             2459648       249644940   117.9GiB     8E00  Linux LVM
```

- Partition the disk via `gdisk`
- Wipe disk
  - `dd if=/dev/urandom of=/dev/sda1 bs=1M status=progress`
  - `dd if=/dev/urandom of=/dev/sda2 bs=1M status=progress`
  - `dd if=/dev/urandom of=/dev/sda3 bs=1M status=progress`
- Format EFI partition
  - `mkfs.fat -F32 /dev/sda1`
- Create LUKS containers
  - `cryptsetup --type luks1 --key-size 512 --hash sha512 --verify-passphrase luksFormat /dev/sda2`
  - `cryptsetup --type luks2 --key-size 512 --hash sha512 --verify-passphrase luksFormat /dev/sda3`
- Prepare logical volumes
  - `pvcreate /dev/mapper/cryptlvm`
  - `vgcreate FitletVolGroup /dev/mapper/cryptlvm`
  - `lvcreate -L 20G FitletVolGroup -n root`
  - `lvcreate -L 80G FitletVolGroup -n docker`
  - `lvcreate -l 100%FREE FitletVolGroup -n home`
  - `mkfs.ext4 /dev/FitletVolGroup/root`
  - `mkfs.ext4 /dev/FitletVolGroup/docker`
  - `mkfs.ext4 /dev/FitletVolGroup/home`
  - `mount /dev/FitletVolGroup/root /mnt`
  - `mkdir /mnt/home`
  - `mount /dev/FitletVolGroup/home /mnt/home`
  - `mkdir -p /mnt/var/lib/docker`
  - `mount /dev/FitletVolGroup/docker /mnt/var/lib/docker`
- Prepare encrypted boot partition
  - `cryptsetup open /dev/sda2 cryptboot`
  - `mkfs.ext4 /dev/mapper/cryptboot`
  - `mount /dev/cryptboot /mnt/boot`
  - `mkdir /mnt/boot/efi`
  - `mount /dev/sda1 /mnt/boot/efi`

## Prepare Keyfiles

- Create a keyfile for the boot partition, opening and mounting it without typing the passphrase again
  - `dd if=/dev/urandom of=/mnt/cryptboot_keyfile.bin bs=512 count=4`
  - `chmod 000 /mnt/cryptboot_keyfile.bin`
  - `cryptsetup luksAddKey /dev/sda2 /mnt/cryptboot_keyfile.bin`
- Create a keyfile for the LVM partition, embedding it into initramfs and opening the container without typing a passphrase
  - `dd if=/dev/urandom of=/mnt/crypto_keyfile.bin bs=512 count=4`
  - `chmod 000 /mnt/crypto_keyfile.bin`
  - `cryptsetup luksAddKey /dev/sda3 /mnt/crypto_keyfile.bin`

## Installation

- Install essential packages
  - `pacstrap /mnt base linux linux-firmware intel-ucode grub efibootmgr lvm2 dhcpcd iwd base-devel man-db vim`
- Generate fstab entries for the currently mounted partitions
  - `genfstab -U /mnt >> /mnt/etc/fstab`
- Change root into the new system
  - `arch-chroot /mnt`
- Set the time zone
  - `ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime`
- Update hardware clock
  - `hwclock --systohc`
- Generate locales
  - `locale-gen`
- Configure LANG
  - `echo 'LANG=en_US.UTF-8' > /etc/locale.conf`
- Configure hostname
  - `echo 'uft' > /etc/hostname`
- Add below entries to hosts
  - `echo '127.0.0.1	uft' >> /etc/hosts`
  - `echo '::1	uft' >> /etc/hosts`
  - `echo '127.0.1.1	uft.localdomain	uft' >> /etc/hosts`
- Change root password
  - `passwd`

## Bootloader and initramfs

- Configure mkinitcpio.conf
  - `vim /etc/mkinitcpio.conf`
  - update the `HOOKS=` line to be `HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt lvm2 filesystems fsck)`
  - update the `MODULES=` line to be `MODULES=(ext4)`
  - update the `FILES=` line to be `FILES=(/crypto_keyfile.bin)`
- Configure GRUB
  - `blkid | grep '/dev/sda3' >> /etc/default/grub`
  - `blkid | grep 'FitletVolGroup-root' >> /etc/default/grub`
  - `vim /etc/default/grub`
  - Update the `GRUB_TIMEOUT` line to be `GRUB_TIMEOUT=0`
  - Update the `GRUB_CMD_LINE_LINUX=` line to be `GRUB_CMD_LINE_LINUX="cryptdevice=UUID=[UUID-of-sda3]:cryptlvm root=UUID=[UUID-of-root]"`
  - Uncomment the `# GRUB_ENABLE_CRYPTODISK=y` line
- Generate a new initramfs
  - `mkinitcpio -p linux`
- Generate GRUB images
  - `grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck`
  - `grub-mkconfig -o /boot/grub/grub.cfg`

## Post-installation

- Add a crypttab entry for the boot partition, opening and mounting it without typing the passphrase again
  - `blkid | grep '/dev/sda2' >> /etc/crypttab`
  - `vim /etc/crypttab`
  - Add the following line `cryptboot	UUID=[UUID-of-sda2]	/cryptboot_keyfile.bin	luks`
- Exit the chroot environment by Ctrl-D
- Unmount all partitions
  - `umount -R /mnt`
- Reboot into the new environment
  - `reboot`
- Login and run `config.sh` in this directory

## See Also

1. [YubiKey Full Disk Encryption Guide](https://sandrokeil.github.io/yubikey-full-disk-encryption-secure-boot-uefi/guides/)
2. [Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
