cd $VILA

# Pull latest update
git pull --rebase --stat origin master

# Merge files to home directory
cp -rf $VILA/home/. $HOME
