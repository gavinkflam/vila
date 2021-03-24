#!/bin/bash
set -Eeuo pipefail

docker rm -f styx

docker run -d \
  --name styx \
  --hostname styx \
  --restart unless-stopped \
  -p 16822:22 \
  -e TZ=Asia/Hong_Kong \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/dev:/home/dev/dev \
  -v $HOME/.ssh/authorized_keys:/home/dev/.ssh/authorized_keys \
  -v styx-asdf-installs:/home/dev/.asdf/installs \
  -v styx-maven-repository:/home/dev/.m2/repository \
  -v /etc/ssh/ssh_host_dsa_key:/etc/ssh/ssh_host_dsa_key \
  -v /etc/ssh/ssh_host_dsa_key.pub:/etc/ssh/ssh_host_dsa_key.pub \
  -v /etc/ssh/ssh_host_ecdsa_key:/etc/ssh/ssh_host_ecdsa_key \
  -v /etc/ssh/ssh_host_ecdsa_key.pub:/etc/ssh/ssh_host_ecdsa_key.pub \
  -v /etc/ssh/ssh_host_ed25519_key:/etc/ssh/ssh_host_ed25519_key \
  -v /etc/ssh/ssh_host_ed25519_key.pub:/etc/ssh/ssh_host_ed25519_key.pub \
  -v /etc/ssh/ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key \
  -v /etc/ssh/ssh_host_rsa_key.pub:/etc/ssh/ssh_host_rsa_key.pub \
  styx:latest
