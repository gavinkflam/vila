# Bash
LinkFile '.bash_logout'
LinkFile '.bash_profile'
LinkFile '.bashrc'

# Docker
LinkFile '.docker/config.json'

# Git
LinkFile '.gitconfig'

# GnuPG
LinkFile '.gnupg/gpg-agent.conf'
LinkFile '.gnupg/sshcontrol'

find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;

# Scripts
LinkFile 'bin/nmgui'
LinkFile 'bin/osc52'

# SSH
LinkFile '.ssh/config'
