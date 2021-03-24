FROM archlinux:base-devel-20210321.0.17674

ARG DOCKER_VERSION=20.10.5

ARG UNAME=dev
ARG UID=1000
ARG GID=1000
ARG USER_HOME=/home/$UNAME
ARG DOCKER_GID=977

COPY config/etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist
COPY config/etc/ssh/sshd_config /etc/ssh/sshd_config

RUN \
  # Create Docker group
  groupadd --gid $DOCKER_GID docker && \
  # Install packages
  pacman -Sy --noconfirm \
    # CLI tools
    man-db man-pages wget git p7zip unrar unzip zip \
    # SSH
    openssh \
    # tmux, zsh, neovim
    tmux zsh neovim python-pynvim the_silver_searcher \
    # Clojure
    rlwrap \
    # asdf-java
    jq && \
  # Install Docker client
  curl https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
    tar -xz -C /tmp docker/docker && \
  mv /tmp/docker/docker /usr/bin/docker && \
  rm -rf /tmp/docker && \
  # Clear pacman caches
  pacman -Scc --noconfirm && \
  # Create user
  groupadd --gid $GID $UNAME && \
  useradd --create-home --home-dir $USER_HOME --shell /usr/bin/zsh \
    --uid $UID --no-user-group --gid $GID $UNAME && \
  # Grant docker group
  usermod -aG docker $UNAME

USER $UNAME
COPY --chown=$UNAME:$UNAME home/. $USER_HOME/.

RUN \
  # SSH configs
  chmod 700 $USER_HOME/.ssh && \
  # Install zgen
  git clone https://github.com/tarjoilija/zgen.git $USER_HOME/.zgen && \
  # Install zsh plugins
  /bin/zsh -c "ZGEN_AUTOLOAD_COMPINIT=0; . $USER_HOME/.zsh_plugins" && \
  # Install tpm
  git clone https://github.com/tmux-plugins/tpm $USER_HOME/.tmux/plugins/tpm && \
  # Install tpm plugins
  $USER_HOME/.tmux/plugins/tpm/bin/install_plugins && \
  # Download vim-plug
  mkdir -p $USER_HOME/.local/share/nvim/site/autoload && \
  wget -O $USER_HOME/.local/share/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  # Install neovim plugins
  nvim \
    -u $USER_HOME/.config/nvim/plugins_only.vim \
    -c ':PlugInstall' \
    -c ':UpdateRemotePlugins' \
    -c 'qa!' && \
  # Install asdf and plugins
  git clone https://github.com/asdf-vm/asdf.git $USER_HOME/.asdf --branch v0.8.0 && \
  $USER_HOME/.asdf/bin/asdf plugin-add java && \
  $USER_HOME/.asdf/bin/asdf plugin-add clojure https://github.com/asdf-community/asdf-clojure.git && \
  $USER_HOME/.asdf/bin/asdf plugin-add nodejs && \
  # Create empty directories for volumes
  mkdir -p $USER_HOME/.asdf/installs && \
  mkdir -p $USER_HOME/.m2/repository

USER root
COPY entrypoint.sh /opt/styx/entrypoint.sh
ENTRYPOINT /opt/styx/entrypoint.sh
