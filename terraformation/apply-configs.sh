#!/bin/bash
set -Eeuo pipefail

if [[ $(id -u) -ne 0 || $(logname) == 'root' ]]; then
  echo 'Please run as an ordinary user with root priviledge via su / sudo.'
  exit 1
fi

## Utilities

styx_log() {
  if [[ ${1:0:1} != '>' ]]; then
    echo -e '========================================'
    echo -e "[$1] $2"
    echo -e
  else
    echo -e "[$1] $2"
  fi
}

styx_sha256sum() {
  sha256sum $1 | awk '{print $1}'
}

styx_user_home() {
  getent passwd $(logname) | cut -d: -f6
}

styx_array_minus() {
  echo "$1 $2 $2" | tr ' ' '\n' | sort | uniq -u
}

styx_install_config_file() {
  if [[ -f $1 && $(styx_sha256sum "configs$1") == $(styx_sha256sum $1) ]]; then
    styx_log '>Install config' "File $1 up to date, skipping"
  else
    styx_log '>Install config' "Install $1"

    mkdir -p $(dirname $1)
    cat "configs$1" > $1
    chmod 644 $1
  fi
}

styx_install_home_file() {
  local target_path="$(styx_user_home)/$1"
  if [[ -f $target_path && $(styx_sha256sum "home/$1") == $(styx_sha256sum $target_path) ]]; then
    styx_log '>Install home file' "File ~/$1 up to date, skipping"
  else
    styx_log '>Install home file' "Install ~/$1"

    mkdir -p $target_path
    cat "home/$1" > $target_path

    chown -R "$(logname):$(logname)" $target_path
    chmod 644 $target_path
  fi
}

styx_start_service() {
  systemctl start $1
}

styx_enable_service() {
  systemctl enable $1 &&
    styx_start_service $1
}

## Configuration items

styx_configure_network() {
  styx_log 'Configure network' ''

  ## iwd
  styx_install_config_file /etc/iwd/main.conf
  styx_install_config_file /etc/systemd/resolved.conf
  styx_enable_service iwd.service
  
  ## systemd-resolved
  ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
  styx_enable_service systemd-resolved.service
}

styx_verify_network() {
  if ping -c1 -W5 google.com 2>&1 | grep -q '1 received'; then
    styx_log 'Verify network' 'Connected to the internet'
    return 0
  else
    styx_log 'Verify network' 'Internet connection is not established'
    return 1
  fi
}

styx_configure_ntp() {
  styx_log 'Configure NTP' ''

  styx_install_config_file /etc/systemd/timesyncd.conf
  styx_enable_service systemd-timesyncd.service
}

styx_configure_pacman_mirrors() {
  styx_log 'Configure Pacman mirrors' ''

  styx_install_config_file /etc/pacman.d/mirrorlist
}

styx_configure_packages() {
  styx_log 'Configure packages' 'Install packages and perform system upgrade'

  local packages=(
    # Kernel
    linux linux-firmware intel-ucode
    # Boot
    grub efibootmgr lvm2
    # Connectivity
    iwd
    # Other tools
    git man-db vim openssh docker
    # Security
    rkhunter
  )
  pacman -Syu --needed "${packages[@]}"
}

styx_configure_firewall() {
  styx_log 'Configure firewall' ''

  styx_install_config_file /etc/iptables/iptables.rules
  styx_install_config_file /etc/iptables/ip6tables.rules

  styx_enable_service iptables.service
  styx_enable_service ip6tables.service
}

styx_configure_sshd() {
  styx_log 'Configure SSHD' ''

  styx_install_config_file /etc/ssh/sshd_config
  
  if [[ -f /etc/ssh/ssh_host_rsa_key.pub ]]; then
    styx_log '>Generate SSHD host keys' 'SSHD host keys found, skipping'
  else
    styx_log '>Generate SSHD host keys' 'SSHD host keys not found, generating'
    styx_start_service sshdgenkeys.service
  fi

  styx_enable_service sshd.service

  # User configs
  styx_install_home_file .ssh/authorized_keys
  chmod 700 "$(styx_user_home)/.ssh"
}

styx_configure_docker() {
  styx_log 'Configure Docker' ''

  styx_enable_service docker.service

  # Configure user with Docker socket permissions
  usermod -a -G docker $(logname)
}

styx_configure_rkhunter() {
  styx_log 'Configure rkhunter' ''

  styx_install_config_file /etc/rkhunter.conf
  rkhunter --update
  rkhunter --propupd
}

styx_configure_network &&
  styx_verify_network
  styx_configure_ntp &&
  styx_configure_pacman_mirrors &&
  styx_configure_packages &&
  styx_configure_firewall &&
  styx_configure_sshd &&
  styx_configure_docker &&
  styx_configure_rkhunter &&
  styx_log 'Styx' 'Done configuring, enjoy!'
