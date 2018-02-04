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
  # Upgrade Alpine and base packages
  apk --no-cache upgrade && \
  # Install packages
  apk --no-cache --update add \
    bash \
    ca-certificates \
    curl \
    docker \
    g++ \
    git \
    gnupg \
    inotify-tools \
    less \
    openssh \
    make \
    neovim \
    python2 \
    python2-dev \
    python3 \
    python3-dev \
    py-yaml \
    py2-pip \
    sudo \
    the_silver_searcher \
    tmux \
    tzdata \
    wget \
    zsh && \
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
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  # Install vim-plug
  curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  # Install tpm
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

ADD . ${VILA}

RUN \
  # Merge vila files to home directory
  cp -rf ${VILA}/home/. ${HOME} && \
  # Override sshd_config
  cp ${VILA}/config/sshd_config /etc/ssh/sshd_config && \
  # Install custom plugins for oh-my-zsh
  ${VILA}/config/.oh-my-zsh/custom/plugins/install && \
  # Install plugins for neovim
  nvim \
    -u ${VILA}/config/.config/nvim/plugins_only.vim \
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
