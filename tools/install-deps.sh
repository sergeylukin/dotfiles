#!/usr/bin/env sh

# https://github.com/rupa/z
mkdir -p ~/code/z
curl https://raw.github.com/rupa/z/master/z.sh > ~/code/z/z.sh
chmod +x ~/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to
# rebuild :)

if [[ "$OSTYPE" == "darwin"* ]]; then
  git clone https://github.com/Homebrew/brew ~/homebrew
  export PATH=~/homebrew/bin/:$PATH
  eval "$(~/homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
  brew tap homebrew/cask-fonts
  brew install fzf ripgrep cowsay tmux
  brew install --cask --force font-fira-code brave-browser google-chrome iterm2
  /usr/local/opt/fzf/install
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install node

fi

