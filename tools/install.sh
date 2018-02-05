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
  echo "You seriously expect me to do this without git? Fix that shit.\n"
  exit
}

# Run setup script
. ~/.dotfiles/tools/setup.sh
