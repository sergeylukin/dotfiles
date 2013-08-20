#!/usr/bin/env sh
############################
# This script doesn't do any installations, it only creates symlinks/copies dotfiles for
# ZSH, OH-MY-ZSH, VIM, GIT etc. and only if they are installed and have their configuration files present.
# Old configuration files are backed up in ~/.dotfiles_old
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
timestamp=`date +%s`               # use timestamp in backup dir names to keep
                                   # track of backups
backup_dir=$dir/backup/$timestamp  # old dotfiles backup directory
##########

# Create Backup dir
mkdir -p $backup_dir

# Backup directory with binaries
if [ -d ~/bin ]
then
  echo "Backing up old ~/bin directory"
  mv ~/bin $backup_dir/ > /dev/null 2>&1
fi

echo "Creating symlink to BIN directory"
ln -s $dir/bin ~/bin

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
	echo ". $dir/zsh/zshrc" >> ~/.zshrc
	echo "...done"
fi

# INSTALL OH-MY-ZSH
if command -v zsh > /dev/null 2>&1 && [ -d ~/.oh-my-zsh ] # install oh-my-zsh files only if user already uses it and has ZSH installed
then
	echo "Backing up old OH-MY-ZSH files"
	cp -pR ~/.oh-my-zsh $backup_dir/
	echo "...done"
	echo "Overwriting old OH-MY-ZSH files with new files"
	cp -pr $dir/oh-my-zsh/. ~/.oh-my-zsh
	echo "...done"
	echo "Adding OH-MY-ZSH configuration file link to ~/.zshrc"
	# because we don't want to change anything like that in repo
	# we do it in ~/.zshrc
	# $dir/zsh/zshrc is still in active use and all changes in it will take place
	echo ". $dir/zsh/includes/oh-my-zsh" >> ~/.zshrc
	echo "...done"
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

# INSTALL VIM DOTFILES
if command -v vim > /dev/null 2>&1
then
	echo "Backing up VIM files"
	mv ~/.vim $backup_dir/ > /dev/null 2>&1
	mv ~/.vimrc $backup_dir/ > /dev/null 2>&1
	echo "...done"
	echo "Creating symlink to new VIM files"
	ln -s $dir/vim ~/.vim
	ln -s $dir/vim/vimrc ~/.vimrc
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
	ln -s $dir/git/gitignore_global ~/.gitignore_global
  echo "...done"

  echo "Creating new GIT --global config file"
  # set current global credentials (usually set in
  # ~/.gitconfig) or ask for them if not found
  GIT_NAME=`git config --global user.name`
  GIT_EMAIL=`git config --global user.email`

  if [ "$NAME" = "" ]; then
    echo -n "Enter your Name to use in GIT and press [ENTER]: "
    read GIT_NAME
  fi
  if [ "$EMAIL" = "" ]; then
    echo -n "Enter your Email to use in GIT and press [ENTER]: "
    read GIT_EMAIL
  fi

  sed "s|VAR_NAME|$GIT_NAME|;s|VAR_EMAIL|$GIT_EMAIL|;s|VAR_USERNAME|`whoami`|" < afile 2>&1
	echo "...done"
fi

# INSTALL TMUX DOTFILES
if command -v tmux > /dev/null 2>&1
then
	echo "Backing up TMUX files"
	mv ~/.tmux.conf $backup_dir/ > /dev/null 2>&1
	echo "...done"
	echo "Creating symlink to new TMUX files"
	ln -s $dir/tmux/tmuxrc ~/.tmux.conf
	echo "...done"
fi

# INSTALL SCREEN DOTFILES
if command -v screen > /dev/null 2>&1
then
	echo "Backing up SCREEN files"
	mv ~/.screenrc $backup_dir/ > /dev/null 2>&1
	echo "...done"
	echo "Creating symlink to new SCREEN files"
	ln -s $dir/screen/screenrc ~/.screenrc
  echo "...done"
fi

echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _  |/ _ \|  _ \ / _ \ |"
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo "                          "

