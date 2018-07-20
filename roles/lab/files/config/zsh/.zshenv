# Start sway if running from tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
  sway
  exit 0
fi
