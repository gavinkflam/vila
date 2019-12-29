# Install configurations
LinkFile '.tmux.conf'
LinkFile '.tmux_theme'

# tpm
tpm_path="$HOME/.tmux/plugins/tpm"

if [[ -d "$tpm_path" ]]; then
  UserCfgLog 'tmux' 'tpm is present, pulling updates'
  cd "$tpm_path" && git pull
else
  UserCfgLog 'tmux' 'Clone tpm'
  mkdir -p "$(dirname "$tpm_path")" && \
    git clone https://github.com/tmux-plugins/tpm "$tpm_path"
fi

UserCfgLog 'tmux' 'Installing new tmux plugins'
TMUX_PLUGIN_MANAGER_PATH="$tpm_path" "$tpm_path/bin/install_plugins"

UserCfgLog 'tmux' 'Updating tmux plugins'
TMUX_PLUGIN_MANAGER_PATH="$tpm_path" "$tpm_path/bin/update_plugins" all

UserCfgLog 'tmux' 'Clean up unused tmux plugins'
TMUX_PLUGIN_MANAGER_PATH="$tpm_path" "$tpm_path/bin/clean_plugins"
