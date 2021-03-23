#!/bin/bash
set -Eeuo pipefail

# Generate SSH host keys
echo -e "Generating host keys"
ssh-keygen -A

# Start SSHD
/usr/sbin/sshd -D -e
