FROM alpine:3.6

MAINTAINER Gavin Lam <me@gavin.hk>

ENV \
  REFRESHED_AT=2017-10-01 \
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

ADD . ${VILA}

RUN \
  # Create user and home directory
  mkdir -p ${HOME} && \
  addgroup \
    -S \
    -g ${GID} \
    ${GNAME} && \
  adduser \
    -S \
    -G ${GNAME} \
    -u ${UID} \
    -h ${HOME} \
    -s ${SHELL} \
    ${UNAME} && \
  # Add edge repos tagged so that we can selectively install edge packages
  echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
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
    openssh \
    make \
    neovim \
    python \
    python-dev \
    python2 \
    python2-dev \
    py-pip \
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
  # Install python packages
  pip install -U \
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
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  # Setup vila
  .$VILA/setup && \
  # Apply ownership for home folders properly
  chown -R ${UID}:${GID} ${HOME} && \
  # Cleanup
  rm -rf /var/cache/apk/*

WORKDIR ${HOME}
USER ${UNAME}

CMD ["tail", "-f", "/dev/null"]
