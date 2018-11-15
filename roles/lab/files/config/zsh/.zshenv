# Apply default applications
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export TERMINAL=/usr/bin/st

# Start xorg if running from tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
  startx
  exit 0
fi
