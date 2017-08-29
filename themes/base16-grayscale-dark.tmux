# Grayscale-dark theme for Tmux
# Modified based on
# https://github.com/connrs/dotfiles/blob/master/tmux/tomorrow-night.tmux

## set status bar
set -g status-bg "#252525"
set -g status-fg "#ababab"

## highlight active window
setw -g window-status-current-bg "#101010"
setw -g window-status-current-fg "#b9b9b9"

## highlight activity in status bar
setw -g window-status-activity-bg "#101010"
setw -g window-status-activity-fg "#b9b9b9"

## pane border and colors
set -g pane-active-border-bg default
set -g pane-active-border-fg "#b9b9b9"
set -g pane-border-bg default
set -g pane-border-fg "#ababab"

set -g clock-mode-colour "#8e8e8e"
set -g clock-mode-style 24

set -g message-bg "#252525"
set -g message-fg "#ababab"

set -g message-command-bg "#252525"
set -g message-command-fg "#ababab"

set -g mode-bg "#252525"
set -g mode-fg "#ababab"
