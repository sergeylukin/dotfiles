#!/usr/bin/env sh

# https://github.com/rupa/z
mkdir -p ~/code/z
curl https://raw.github.com/rupa/z/master/z.sh > ~/code/z/z.sh
chmod +x ~/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to
# rebuild :)

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
  brew install fzf
  /usr/local/opt/fzf/install
fi

