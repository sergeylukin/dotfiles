#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

if [ ! -n "${DF_FLAGS_COLLECTED+1}" ]; then
  source ${BASEDIR}/collect-flags.sh
fi

# https://github.com/rupa/z
mkdir -p ~/code/z
curl https://raw.github.com/rupa/z/master/z.sh > ~/code/z/z.sh
chmod +x ~/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to
# rebuild :)

if [[ $DF_PLATFORM == "osx" ]]; then

  # Make sure OS X development bundle is in place
  xcode-select --install

  # install iterm2 shell integration
  if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    echo "Running in iTerm2 - installing shell integration\n"
    curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
  fi


  git clone https://github.com/Homebrew/brew ~/homebrew
  export PATH=~/homebrew/bin/:$PATH
  eval "$(~/homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
  brew install fzf ripgrep cowsay tmux htop tree wget

  # Github CLI
  brew install gh

  # JSON viewer
  brew install jq

  # FTP & friends
  brew install inetutils

  # better diff
  # https://github.com/ymattw/ydiff
  brew install ydiff
   
  # better cat
  # https://github.com/sharkdp/bat
  brew install bat

  # better ls
  # https://the.exa.website/
  brew install exa

  # todo tasks management
  brew install task

  # RUby
  brew install gnupg
  gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash
  rvm install 3.1.2
  rvm alias create default

  # Fonts
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code font-Fira-Code-nerd-font

  # Starship shell
  # https://starship.rs/guide/#%F0%9F%9A%80-installation
  brew install starship

  brew install --cask brave-browser google-chrome iterm2
  if [ "$DF_HOME_MODE" = true ]; then
    brew install --cask karabiner-elements
  fi
  brew install --cask visual-studio-code
  /usr/local/opt/fzf/install

  if [ "$DF_HOME_MODE" = true ]; then
    # install torrent client
    brew install --cask deluge
    [ -d ~/torrents ] || mkdir ~/torrents
    [ -d ~/torrents_downloaded ] || mkdir ~/torrents_downloaded
  fi

  # insatll Volta - favorite Node versions Managercurl
  curl https://get.volta.sh | bash
  volta install node

  npm install -g rayli

  # ncurses to fix keyboard behavior
  # https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
  curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
  /usr/bin/tic -xe tmux-256color terminfo.src
  rm -f terminfo.src

  # Install GNU utilities with "g" prefix
  # For example, if you find a great StackOverflow answer containing
  # GNU awk or sed solution then you could test it by running `gawk` and `gsed`
  # respectively
  #
  # More details:
  # https://apple.stackexchange.com/a/69332
  brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep zsh-completions


  # all the stuff I definitely don't need at work
  if [ "$DF_HOME_MODE" = true ]; then
    brew install mysql
    brew install golang
    brew install opencv tesseract

    brew tap ethereum/ethereum
    brew install solidity

    # https://cbrgm.net/post/2021-05-5-setup-macos/
    brew install koekeishiya/formulae/yabai
    brew services start yabai

    brew install koekeishiya/formulae/skhd
    brew services start skhd
  fi

  brew install brevdev/homebrew-brev/brev

  brew install jesseduffield/lazydocker/lazydocker

  brew install neovim

  brew install jesseduffield/lazydocker/lazydocker

  # QT for this cool term:
  # https://github.com/sergeylukin/cool-retro-term
  brew install qt

  # install cheat (enhancement to man command) command
  go install github.com/cheat/cheat/cmd/cheat@latest
fi

# Install Cowsay lolcat and fortune
if ! command -v cowsay > /dev/null 2>&1
then
  if [[ "$DF_PLATFORM" == "osx" ]]; then
    brew install fortune cowsay lolcat
  elif [[ "$DF_PLATFORM" == "linux" ]]; then
    sudo apt install cowsay cowsay lolcat -y
  fi
fi

# Install Rust
if ! command -v rustc > /dev/null 2>&1
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


if ! command -v pnpm > /dev/null 2>&1
then
  # Install pnpm
  curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

if ! command -v nvm > /dev/null 2>&1
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

# install vim plugins
vim +PlugInstall +qall
