export EDITOR=vim
if [[ ${TERM} != *"256color"* ]];then
    export TERM=xterm-256color
fi
export GRAILS_HOME=~/bin/grails-2.2.1
export PATH=/usr/local/sbin:/usr/local/heroku/bin:./node_modules/.bin:~/bin:~/bin.local:$GRAILS_HOME/bin:$PATH

# Use GNU SED instead of BSD SED installed on OS X by default
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export MANPATH=/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH

# Include composer packages in the PATH to use command line utilities like
# `phpunit`, `phinx`, `phpcs` to name a few
# For more details read this awesome blog post by Jordan Eldredge:
# http://jordaneldredge.com/blog/globally-install-php-comand-line-tools-with-composer
export PATH=~/.dotfiles/composer-packages/vendor/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH


# Add git-subrepo to $PATH
# More details: https://github.com/ingydotnet/git-subrepo
export PATH=~/bin/git-subrepo/lib:$PATH
export MANPATH=~/bin/git-subrepo/man:$MANPATH
# Enable git subrepo auto-completion
fpath=('~/bin/git-subrepo/share/zsh-completion' $fpath)

# Vim gpg encryption
GPG_TTY=`tty`
export GPG_TTY

# Rbenv - RUBY environment Manager
if command -v rbenv > /dev/null 2>&1
then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# PhpBrew - PHP environment Manager
[[ -s "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

# homebrew
eval "$(~/homebrew/bin/brew shellenv)"

# Disable XON/XOFF flow control
# By default Ctrl-s disables the flow control
# which results in frozen terminal and it can
# be unfrozen with Ctrl-q
# However, we better disable this and use Ctrl-s
# for more useful task like shell history forward
# search, read more here: http://stackoverflow.com/a/791800/1832729
stty -ixon

# Autoload files with functions as described here:
# http://zsh.sourceforge.net/Doc/Release/Functions.html
fpath=(~/.dotfiles/zsh/autoload $fpath)

# Enable git command auto-completion
zstyle ':completion:*:*:git:*' script ~/.completion/git/git-completion.bash

# Setup fasd (https://github.com/clvv/fasd)
eval "$(fasd --init auto)"



# Android studio PATHs on Mac
if [ -d ~/Library/Android/sdk ]; then
  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=${PATH}:${ANDROID_HOME}/tools
fi

# Make sure GO is runnable on OS X if installed
# More details: https://golang.org/doc/install
export PATH=$PATH:/usr/local/go/bin
# Create and configure GO lang workspace
# More details: https://golang.org/doc/code.html#Workspaces
if [ ! -d ~/code/GO ]; then
  mkdir -p ~/code/GO
fi
export GOPATH=$HOME/code/GO
# add the workspace's bin subdirectory to PATH
export PATH=$PATH:$GOPATH/bin

# add Composer global binaries to the PATH
export PATH=$PATH:$HOME/.config/composer/vendor/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Calling nvm use automatically in a directory with a .nvmrc file
# or in upper level (place this after nvm initialization!)
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH" [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
