#!/bin/bash
set -Eeuo pipefail

if [[ $(id -u) -ne 0 ]]; then
  echo 'Please run as root.'
  exit 1
fi

styx_run_rkhunter_check() {
  rkhunter --update
  rkhunter --check --skip-keypress
}

styx_run_rkhunter_check
