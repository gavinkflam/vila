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
  SHELL=/bin/zsh \
  # System variables
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US:en \
  LC_ALL=en_US.UTF-8 \
  TZ=Asia/Hong_Kong \
  # Set this so that CTRL+G works properly
  TERM=xterm

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
  chown -R ${UID}:${GID} ${HOME} && \
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
  # Cleanup
  rm -rf /var/cache/apk/*

WORKDIR ${HOME}
USER ${UNAME}

CMD ["tail", "-f", "/dev/null"]
