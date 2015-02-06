export EDITOR=vim
export TERM=xterm-256color
export GRAILS_HOME=~/bin/grails-2.2.1
export PATH=/usr/local/sbin:/usr/local/heroku/bin:./node_modules/.bin:~/bin:~/bin.local:$GRAILS_HOME/bin:$PATH

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

# RVM - Ruby enVironment Manager - launch if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.  

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
