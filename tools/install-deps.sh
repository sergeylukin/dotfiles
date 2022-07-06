#!/usr/bin/env sh

# https://github.com/rupa/z
mkdir -p ~/code/z
curl https://raw.github.com/rupa/z/master/z.sh > ~/code/z/z.sh
chmod +x ~/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to
# rebuild :)

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

if [[ "$OSTYPE" == "darwin"* ]]; then
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

  # Fonts
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code font-Fira-Code-nerd-font

  # Starship shell
  # https://starship.rs/guide/#%F0%9F%9A%80-installation
  brew install starship

  brew install --cask brave-browser google-chrome iterm2
  brew install --cask karabiner-elements
  brew install --cask visual-studio-code
  /usr/local/opt/fzf/install

  # install torrent client
  brew install --cask deluge
  [ -d ~/torrents ] || mkdir ~/torrents
  [ -d ~/torrents_downloaded ] || mkdir ~/torrents_downloaded

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


  # MySQL client
  brew install mysql

  brew install brevdev/homebrew-brev/brev

  brew install jesseduffield/lazydocker/lazydocker

  brew install neovim

  brew install jesseduffield/lazydocker/lazydocker

  # install GO
  brew install golang

  # QT for this cool term:
  # https://github.com/sergeylukin/cool-retro-term
  brew install qt

  # install cheat (enhancement to man command) command
  go install github.com/cheat/cheat/cmd/cheat@latest
fi

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install vim plugins
vim +PlugInstall +qall
