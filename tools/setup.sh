############################
# This script creates symlinks/copies dotfiles for
# ZSH, OH-MY-ZSH, VIM, GIT etc. and only if they are installed and have their configuration files present.
# Old configuration files are backed up in ~/.dotfiles_old
#
# In addition it installs software if OS is recognized and installation method is available
############################

########## Variables

if [ ! -n "${DF_FLAGS_COLLECTED+1}" ]; then
  source ./collect-flags.sh
fi

timestamp=`date +%s`               # use timestamp in backup dir names to keep
# track of backups
backup_dir=$DF_MY_DOTFILES_DIR/backup/$timestamp  # old dotfiles backup directory
##########


if ! command -v rg > /dev/null 2>&1; then
  if [[ $platform == "osx" ]]; then
    read -p "We need to install 'rg' Are you OK with that? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      brew install rg
    else
      echo "Please install 'rg' and retry";
      exit 1;
    fi
  fi
fi

# Create Backup dir
mkdir -p $backup_dir

# Backup directory with binaries
if [ -d ~/bin ]
then
  echo "Backing up old ~/bin directory"
  mv ~/bin $backup_dir/ > /dev/null 2>&1
fi

echo "Creating symlink to BIN directory"
ln -Fs $DF_MY_DOTFILES_DIR/bin ~

# Create directory for local binaries which shouldn't be part of Repository
if [ ! -d ~/bin.local ]
then
  mkdir ~/bin.local
fi

# INSTALL ZSH DOTFILES
if command -v zsh > /dev/null 2>&1
then
  echo "Backing up old ZSH files"
  mv ~/.zshrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new ZSH files"
  touch ~/.zshrc
  echo ". $DF_MY_DOTFILES_DIR/zsh/zshrc" >> ~/.zshrc
  echo "...done"
fi

# INSTALL AUTO-COMPLETION FILES
echo "Backing up auto-completion files"
mv ~/.completion $backup_dir/ > /dev/null 2>&1
echo "...done"
echo "Creating symlink to new auto-completion files"
ln -s $DF_MY_DOTFILES_DIR/completion ~/.completion
echo "...done"

# INSTALL OH-MY-ZSH
if command -v zsh > /dev/null 2>&1
then
  if [ -d ~/.oh-my-zsh ]; then
    echo "Backing up old OH-MY-ZSH files"
    mv ~/.oh-my-zsh $backup_dir/
    echo "...done"
  fi

  rm -fr ~/.oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

  echo "Overwriting old OH-MY-ZSH files with new files"
  rm -fr ~/.oh-my-zsh/custom
  ln -s $DF_MY_DOTFILES_DIR/oh-my-zsh ~/.oh-my-zsh/custom
  echo "...done"
  echo "Adding OH-MY-ZSH configuration file link to ~/.zshrc"
  # because we don't want to change anything like that in repo
  # we do it in ~/.zshrc
  # $DF_MY_DOTFILES_DIR/zsh/zshrc is still in active use and all changes in it will take place
  echo ". $DF_MY_DOTFILES_DIR/zsh/includes/oh-my-zsh" >> ~/.zshrc
  echo "...done"

  if [ ! -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    echo "Notice! Your current shell is NOT ZSH, let's try to autofix it:"
    if [[ $platform == "osx" ]]; then
      chsh -s /bin/zsh
    elif [[ $platform == "linux" ]]; then
      sudo usermod -s /usr/bin/zsh $(whoami)
    fi
  fi
fi

# Local ZSH settings
if command -v zsh > /dev/null 2>&1
then
  if [ ! -f ~/.zshrc.local ]
  then
    touch ~/.zshrc.local
  fi
  echo "Adding local ZSH settings link to ~/.zshrc"
  echo ". ~/.zshrc.local" >> ~/.zshrc
  echo "# Remove duplicates in Paths" >> ~/.zshrc
  echo "declare -U path" >> ~/.zshrc
  echo "...done"
fi

# Hammerspoon
if [ ! -d ~/.hammerspoon ]; then
  mkdir ~/.hammerspoon
fi
echo "Adding hammerspoon scripts"
rm -f ~/.hammerspoon/init.lua
ln -s $DF_MY_DOTFILES_DIR/hammerspoon/init.lua ~/.hammerspoon/init.lua
echo "...done"

# INSTALL VIM DOTFILES
if command -v vim > /dev/null 2>&1
then
  echo "Backing up VIM files"
  mv ~/.vim $backup_dir/ > /dev/null 2>&1
  mv ~/.vimrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new VIM files"
  ln -s $DF_MY_DOTFILES_DIR/vim ~/.vim
  ln -s $DF_MY_DOTFILES_DIR/vim/vimrc ~/.vimrc
  echo "...done"
fi

# INSTALL GIT DOTFILES
if command -v git > /dev/null 2>&1
then
  echo "Backing up GIT --global config file"
  # we are copying and not moving because we want to keep personal credentials
  # if they exist
  if [ ! -f ~/.gitconfig ]
  then
    touch ~/.gitconfig
  else
    cp ~/.gitconfig $backup_dir/
  fi
  echo "...done"

  if [ -f ~/.gitignore_global ]
  then
    echo "Backing up GIT --global .gitignore file"
    mv ~/.gitignore_global $backup_dir/
    echo "...done"
  fi

  echo "Creating symlink to new --global .gitignore file"
  rm -f ~/.gitignore_global
  ln -s $DF_MY_DOTFILES_DIR/git/gitignore_global ~/.gitignore_global
  echo "...done"

  echo "Creating new GIT --global config file"
  # set current global credentials (usually set in
  # ~/.gitconfig) or ask for them if not found
  GIT_NAME=`git config --global user.name`
  GIT_EMAIL=`git config --global user.email`

  if [ -z "$GIT_NAME" ]; then
    echo -n "Enter your Name to use in GIT and press [ENTER]: "
    read GIT_NAME
  fi
  if [ -z "$GIT_EMAIL" ]; then
    echo -n "Enter your Email to use in GIT and press [ENTER]: "
    read GIT_EMAIL
  fi

  sed "s|VAR_NAME|\"$GIT_NAME\"|;s|VAR_EMAIL|$GIT_EMAIL|;s|VAR_USERNAME|`whoami`|" < $DF_MY_DOTFILES_DIR/git/gitconfig > ~/.gitconfig
  echo "...done"
fi

# INSTALL TMUX DOTFILES
if command -v tmux > /dev/null 2>&1
then
  echo "Backing up TMUX files"
  mv ~/.tmux.conf $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new TMUX files"
  ln -s $DF_MY_DOTFILES_DIR/tmux/tmuxrc ~/.tmux.conf
  mv ~/.tmux $backup_dir/ > /dev/null 2>&1
  ln -s $DF_MY_DOTFILES_DIR/tmux ~/.tmux
  echo "...done"
fi

# INSTALL SCREEN DOTFILES
if command -v screen > /dev/null 2>&1
then
  echo "Backing up SCREEN files"
  mv ~/.screenrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new SCREEN files"
  ln -s $DF_MY_DOTFILES_DIR/screen/screenrc ~/.screenrc
  echo "...done"
fi

echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _  |/ _ \|  _ \ / _ \ |"
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo "                          "

