# Install configurations
LinkFile '.tmux.conf'
LinkFile '.tmux_theme'

# tpm
tpm_path="$HOME/.tmux/plugins/tpm"

if [[ -d "$tpm_path" ]]; then
  UserCfgLog 'tmux' 'tpm is present, pulling updates'
  cd "$tpm_path" && git pull

  UserCfgLog 'tmux' 'Updating tmux plugins'
  "$tpm_path/bin/update_plugins" all
else
  UserCfgLog 'tmux' 'Clone tpm'
  mkdir -p "$(dirname "$tpm_path")" && \
    git clone https://github.com/tmux-plugins/tpm "$tpm_path"

  UserCfgLog 'tmux' 'Installing tmux plugins'
  "$tpm_path/bin/install_plugins"
fi
