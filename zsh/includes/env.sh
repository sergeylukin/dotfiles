export EDITOR=vim
export TERM=xterm-256color
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

# Add git-subrepo to $PATH
# More details: https://github.com/ingydotnet/git-subrepo
export PATH=~/bin/git-subrepo/lib:$PATH
export MANPATH=~/bin/git-subrepo/man:$MANPATH
# Enable git subrepo auto-completion
fpath=('~/bin/git-subrepo/share/zsh-completion' $fpath)

# Vim gpg encryption
GPG_TTY=`tty`
export GPG_TTY

# PhpBrew - PHP envirionment Manager
[[ -s "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

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
