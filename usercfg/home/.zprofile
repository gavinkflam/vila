export SHELL=/bin/zsh

# Add ~/.local/bin to PATH
if [[ -d "${HOME}/.local/bin" ]]; then
  export PATH="${HOME}/.local/bin:${PATH}"
fi

# Add ~/bin to PATH
if [[ -d "${HOME}/bin" ]]; then
  export PATH="${HOME}/bin:${PATH}"
fi
