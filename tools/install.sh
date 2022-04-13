############################
# Fetch repo and run setup script
############################

# Don't overwrite existing dotfiles directory
if [ -d ~/.dotfiles ]
then
  echo "You already have ~/.dotfiles directory. Please move or remove it in order to continue"
  exit
fi

# Clone repository
hash git >/dev/null && /usr/bin/env git clone https://github.com/sergeylukin/dotfiles.git ~/.dotfiles || {
  echo "Please install Git.\n"
  exit
}

# install dependencies
. ~/.dotfiles/tools/install-deps.sh

# Run setup script
. ~/.dotfiles/tools/setup.sh
