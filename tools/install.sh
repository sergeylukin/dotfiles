############################
# Fetch repo and run setup script
############################

# Don't overwrite existing dotfiles directory
if [ -d ~/.dotfiles ]
then
  echo "You already have ~/.dotfiles directory. Please move or remove it in order to continue"
  exit
fi

# Close repository
hash git >/dev/null && /usr/bin/env git clone https://github.com/sergeylukin/dotfiles.git ~/.dotfiles || {
  echo "git not installed"
  exit
}

# Run setup script
. ~/.dotfiles/tools/setup.sh
