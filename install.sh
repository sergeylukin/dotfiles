#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/bin/dotfiles                    # dotfiles directory
olddir=~/bin/dotfiles_old             # old dotfiles backup directory

##########

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# INSTALL ZSH DOTFILES
echo "Backing up old ZSH files"
mv ~/.zshrc $olddir/
echo "...done"
echo "Creating symlink to new ZSH files"
ln -s $dir/zsh/zshrc ~/.zshrc
echo "...done"

# INSTALL OH-MY-ZSH
echo "Backing up old OH-MY-ZSH files"
cp -pR ~/.oh-my-zsh $olddir/
echo "...done"
echo "Overwriting old OH-MY-ZSH files with new files"
cp -pr $dir/oh-my-zsh/ ~/.oh-my-zsh/
echo "...done"

# INSTALL VIM DOTFILES
echo "Backing up VIM files"
mv ~/.vim $olddir/
mv ~/.vimrc $olddir/
echo "...done"
echo "Creating symlink to new VIM files"
ln -s $dir/vim ~/.vim
ln -s $dir/vim/vimrc ~/.vimrc
echo "...done"

# INSTALL GIT DOTFILES
echo "Backing up GIT --global config file"
mv ~/.gitconfig $olddir/
echo "...done"
echo "Creating symlink to new GIT --global config file"
ln -s $dir/gitconfig ~/.gitconfig
echo "...done"

# INSTALL ROXTERM DOTFILES
echo "Backing up ROXTERM files"
mv ~/.config/roxterm.sourceforge.net $olddir/
echo "...done"
echo "Creating symlink to new ROXTERM files"
ln -s $dir/roxterm ~/.config/roxterm.sourceforge.net
echo "...done"
