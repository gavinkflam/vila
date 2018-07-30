# Start sway if running from tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
  startx
  exit 0
fi
