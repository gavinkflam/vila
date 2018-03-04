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
  apk --update --no-cache add \
    # Bash shell for executing shell scripts
    bash \
    # Download the latest ca certificates
    ca-certificates \
    # cURL and Wget
    curl \
    curl-doc \
    wget \
    wget-doc \
    # Docker client
    docker \
    docker-doc \
    # Build essentials
    g++ \
    make \
    # Git, Neovim, Ag, tmux, ZSH
    git \
    git-doc \
    neovim \
    neovim-doc \
    the_silver_searcher \
    the_silver_searcher-doc \
    tmux \
    tmux-doc \
    zsh \
    zsh-doc \
    zsh-vcs \
    # GNU tools
    gnupg \
    gnupg-doc \
    less \
    less-doc \
    # inotify interface for filesystem events
    inotify-tools \
    # ping, tracetoute, etc.
    iputils \
    # man, mdocml and core man pages
    man \
    man-pages \
    mdocml-apropos \
    # OpenSSH client and server
    openssh \
    openssh-doc \
    # Python 2 and 3
    python2 \
    python2-dev \
    python3 \
    python3-dev \
    py-yaml \
    py2-pip \
    # sudo for runtime everyday use only, do not use in build time
    sudo \
    sudo-doc \
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
  # Create symlinks for configuration files
  ${VILA}/scripts/setup-config-symlinks && \
  # Download neovim plugins via vim plug
  ${VILA}/scripts/install-neovim-plugins && \
  # Download zsh plugins via zgen
  ${VILA}/scripts/install-zsh-plugins && \
  # Apply ownership for home folders properly
  chown -R ${UID}:${GID} ${HOME}

WORKDIR ${HOME}
USER ${UNAME}

EXPOSE 22
ENTRYPOINT [".vila/scripts/initialize-container"]
CMD ["sudo", "/usr/sbin/sshd", "-D"]
