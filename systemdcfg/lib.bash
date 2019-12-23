function SystemdCfgLog() {
  echo -e "====> SystedCfg: $1"
}

function EnableService() {
  if ! systemctl is-enabled --quiet "$1"; then
    SystemdCfgLog "Enabling $1"
    sudo systemctl enable "$1"
  else
    SystemdCfgLog "$1 is enabled, skipping"
  fi
}

function DisableService() {
  if systemctl is-enabled --quiet "$1"; then
    SystemdCfgLog "Disablig $1"
    sudo systemctl disable "$1"
  else
    SystemdCfgLog "$1 is disabled, skipping"
  fi
}
