# Install configurations
LinkFile '.config/nvim/_color_scheme.vim'
LinkFile '.config/nvim/_commands.vim'
LinkFile '.config/nvim/_core.vim'
LinkFile '.config/nvim/_key_mappings.vim'
LinkFile '.config/nvim/_plugins.vim'
LinkFile '.config/nvim/_plugins_conf.vim'
LinkFile '.config/nvim/init.vim'
LinkFile '.config/nvim/plugins_only.vim'

# vim-plug
plug_path="$HOME/.config/nvim/autoload/plug.vim"
plug_url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ ! -f "$plug_path" ]]; then
  UserCfgLog 'Neovim' 'Download vim-plug'
  mkdir -p "$(dirname $plug_path)" && \
    wget -O $plug_path $plug_url

  UserCfgLog 'Neovim' 'Install vim plugins'
  nvim \
    -u $HOME/.config/nvim/plugins_only.vim \
    -c ':PlugInstall' \
    -c ':UpdateRemotePlugins' \
    -c 'qa!'
else
  UserCfgLog 'Neovim' 'Update vim-plug and vim plugins'
  nvim \
    -u $HOME/.config/nvim/plugins_only.vim \
    -c ':PlugUpgrade' \
    -c ':PlugUpdate' \
    -c ':UpdateRemotePlugins' \
    -c 'qa!'
fi
