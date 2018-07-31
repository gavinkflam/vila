# Language environment
export LANG=en_US.UTF-8

# Set nvim as preferred editor
export EDITOR='nvim'

# Use 256 color
if [[ -n ${TMUX} ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

########################################
# Key bindings

# Use Emacs key bindings
bindkey -e

########################################
# History

# Append their history list to the history file rather than replace it
setopt append_history

# Save each command's timestamp and duration
setopt extended_history

# Remove older duplicate command history
setopt hist_ignore_all_dups

# Ignore command starts with space
setopt hist_ignore_space

# Remove superfluous blanks before save
setopt hist_reduce_blanks

# Perform history expansion and reload the line into the editing buffer
setopt hist_verify

# Share your history across sessions
setopt share_history

# Keep ten thousand history
HISTSIZE=10000
SAVEHIST=10000

# Save history in .zsh_history
HISTFILE="$HOME/.zsh_history"

# Ignore common commands and help commands
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

########################################
# Misc

# Parameter expansion, command substitution and arithmetic expansion are
# performed in prompts
setopt prompt_subst

# Don’t push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups

# Do not beep
setopt no_beep

# Initialize new style completion
autoload -Uz compinit
compinit

########################################
# Plugins and theme

# Do not show tmux indicator for lean prompt
PROMPT_LEAN_TMUX=""

# Grayscale customization for lean
PROMPT_LEAN_COLOR1="f7/f7/f7"
PROMPT_LEAN_COLOR2="7c/7c/7c"

# Load zsh plugins via zgen
. "$HOME/.zsh_plugins"

# Use base16-grayscale-dark theme
. "$HOME/.zsh_theme"

# Use cyan for zsh-autosuggestions text
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

########################################
# GnuPG agent

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

########################################
# Per deployment configurations

# Interactive shell configurations per deployment
if [[ -f "$HOME/.rc" ]]; then
  source "$HOME/.rc"
fi
