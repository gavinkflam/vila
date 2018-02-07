export SHELL=/bin/zsh

#################################################
# Add vila bin to PATH if not already
#
# Arch Linux will source /etc/profile after sourcing .zshenv, thus PATH will
# have to be configured in .zprofile
if [[ ! "$PATH" = *"$VILA/bin:"* ]]; then
  export PATH="$VILA/bin:$PATH"
fi
