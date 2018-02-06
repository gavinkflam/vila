#################################################
# Add vila bin to PATH if not already
if [[ ! "$PATH" = *"$VILA/bin:"* ]]; then
  export PATH="$VILA/bin:$PATH"
fi
