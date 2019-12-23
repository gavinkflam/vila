# Install configurations
LinkFile '.zprofile'
LinkFile '.zsh_plugins'
LinkFile '.zsh_theme'
LinkFile '.zshenv'
LinkFile '.zshrc'

# zgen
if [[ -d "$HOME/.zgen" ]]; then
  UserCfgLog 'zsh' 'zgen is present, pulling updates'
  cd "$HOME/.zgen" && git pull
else
  UserCfgLog 'zsh' 'Clone zgen'
  git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"
fi

UserCfgLog 'zsh' 'Install ZSH plugins'
rm "$HOME/.zgen/init.zsh"
/bin/zsh -c "ZGEN_AUTOLOAD_COMPINIT=0; . $HOME/.zsh_plugins"

# Change shell
username="$(whoami)"
current_shell="$(getent passwd "$username" | awk -F: '{print $NF}')"

if [[ "$current_shell" == '/bin/zsh' ]]; then
  UserCfgLog 'zsh' "Shell for $username is already ZSH, skipping"
else
  UserCfgLog 'zsh' "Change shell to ZSH for $username"
  sudo usermod --shell /bin/zsh "$username"
fi
