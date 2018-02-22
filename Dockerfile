FROM alpine:3.7

MAINTAINER Gavin Lam <me@gavin.hk>

ENV \
  REFRESHED_AT=2018-01-31 \
  # User and preferences
  UNAME=gavin \
  UID=1000 \
  GNAME=gavin \
  GID=1000 \
  HOME=/home/gavin \
  VILA=/home/gavin/.vila \
  SHELL=/bin/zsh \
  # System variables
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8 \
  TZ=Asia/Hong_Kong \
  # Set this so that CTRL+G works properly
  TERM=xterm

RUN \
  # Create home directory for the user
  mkdir -p ${HOME} && \
  # Create group
  addgroup \
    -S \
    -g ${GID} \
    ${GNAME} && \
  # Create user and configure the home directory and default shell
  adduser \
    -S \
    -G ${GNAME} \
    -u ${UID} \
    -h ${HOME} \
    -s ${SHELL} \
    ${UNAME} && \
  # Unlock the newly created user
  passwd \
    -u ${UNAME}

RUN \
  # Install packages
  apk --update add \
    # Bash shell for executing shell scripts
    bash \
    # Download the latest ca certificates
    ca-certificates \
    # cURL and Wget
    curl \
    wget \
    # Docker client
    docker \
    # Build essentials
    g++ \
    make \
    # Git, Neovim, Ag, tmux, ZSH
    git \
    neovim \
    neovim-doc \
    the_silver_searcher \
    tmux \
    zsh \
    zsh-vcs \
    # GNU tools
    gnupg \
    less \
    # inotify interface for filesystem events
    inotify-tools \
    # ping, tracetoute, etc.
    iputils \
    # OpenSSH client and server
    openssh \
    # Python 2 and 3
    python2 \
    python2-dev \
    python3 \
    python3-dev \
    py-yaml \
    py2-pip \
    # sudo for runtime everyday use only, do not use in build time
    sudo \
    # Timezone database
    tzdata && \
  # Update ca certificates
  update-ca-certificates --fresh && \
  # Cleanup
  rm -rf /var/cache/apk/*

RUN \
  # Add user to sudoer in order to sudo without entering password
  echo "${UNAME} ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
  # Install python packages
  pip3 install -U \
    docker-compose \
    neovim && \
  pip2 install -U \
    neovim && \
  # Install tpm
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && \
  # Install vim-plug
  curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  # Install zgen
  git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen

ADD . ${VILA}

RUN \
  # Merge vila files to home directory
  cp -rf ${VILA}/home/. ${HOME} && \
  # Download zsh plugins via zgen
  zsh \
    -c "ZGEN_AUTOLOAD_COMPINIT=0; . ${VILA}/config/zsh/_plugins" && \
  # Override sshd_config
  cp ${VILA}/config/sshd/sshd_config /etc/ssh/sshd_config && \
  # Override message of the day
  cp ${VILA}/config/sshd/motd /etc/motd && \
  # Copy over sshd banner
  cp ${VILA}/config/sshd/sshd_banner /etc/ssh/sshd_banner && \
  # Install plugins for neovim
  nvim \
    -u ${VILA}/config/nvim/plugins_only.vim \
    -c ':PlugInstall' \
    -c ':UpdateRemotePlugins' \
    -c 'qa!' \
    > /dev/null && \
  # Apply ownership for home folders properly
  chown -R ${UID}:${GID} ${HOME}

WORKDIR ${HOME}
USER ${UNAME}

EXPOSE 22
ENTRYPOINT [".vila/scripts/initialize-container"]
CMD ["sudo", "/usr/sbin/sshd", "-D"]
