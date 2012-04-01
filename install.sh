#!/bin/bash
############################
# install.sh
# This script doesn't do any installations, it only creates symlinks/copies dotfiles for
# ZSH, OH-MY-ZSH, VIM, GIT, ROXTERM and only if they are used and have their configuration files present.
# Old configuration files are backed up in ~/bin/dotfiles_old
############################

########## Variables

dir=~/bin/dotfiles                    # dotfiles directory
olddir=~/bin/dotfiles_old             # old dotfiles backup directory

##########

echo "Creating $olddir for backup of any existing dotfiles in ~"
# First - remove if it exists
if [[ -d $olddir ]]
then
	rm -fr $olddir
fi
# Now - create fresh one
mkdir -p $olddir
echo "...done"

# INSTALL ZSH DOTFILES
if command -v zsh > /dev/null 2>&1
then
	echo "Backing up old ZSH files"
	mv ~/.zshrc $olddir/
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
	cp -pR ~/.oh-my-zsh $olddir/
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

# INSTALL VIM DOTFILES
if command -v vim > /dev/null 2>&1
then
	echo "Backing up VIM files"
	mv ~/.vim $olddir/
	mv ~/.vimrc $olddir/
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
	mv ~/.gitconfig $olddir/
	echo "...done"
	echo "Creating new GIT --global config file"
	# because .gitconfig usually (and this is normal case)
	# contains personal credentials (user.name & user.email)
	# we better copy template to $HOME dir and let user modify it there
	# without affecting the repo itself
	cp $dir/git/gitconfig ~/.gitconfig
	echo "...done"
fi

# INSTALL ROXTERM DOTFILES
if command -v roxterm > /dev/null 2>&1
then
	echo "Backing up ROXTERM files"
	mv ~/.config/roxterm.sourceforge.net $olddir/
	echo "...done"
	echo "Creating symlink to new ROXTERM files"
	ln -s $dir/roxterm ~/.config/roxterm.sourceforge.net
	echo "...done"
fi
