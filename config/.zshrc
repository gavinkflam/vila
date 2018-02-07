# Language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='nvim'

# Use 256 color
if [[ -n ${TMUX} ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

# Use Emacs key bindings
bindkey -e

# Load zsh plugins via zgen
. $VILA/config/.zplugins

# Use base16-grayscale-dark theme
. "$VILA/themes/base16-grayscale-dark.sh"

# Use cyan for zsh-autosuggestions text
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Interactive shell configuration per deployment
if [[ -f "$HOME/.rc" ]]; then
  source "$HOME/.rc"
fi
