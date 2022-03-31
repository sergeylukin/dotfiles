# List directory each time directory is changed (run `ls -la` after each `cd`)
function chpwd() {
    ls -lF
}

# Cute git push alternative:) Execute: "nasa launch rocket" and git push will be called
nasa() { if [[ $@ == "launch rocket" ]]; then command git push; else command echo "common launch it"; fi; }

# Processes
alias tu='top -o cpu' # cpu
alias tm='top -o size' # memory

# Tmux
alias sc='tmux -2'

# Apache
alias restartApache="sudo apachectl restart"

# Navigation
alias ..='cd ..' # Go Up
alias ...='cd ../../' # Go Up 2 levels
alias -- -="cd -" # Go Back
alias desk='cd ~/Desktop' # Shortcut to code dir
alias codes='cd ~/code' # Shortcut to code dir
alias sites='cd ~/Sites' # Shortcut to Sites dir
alias dotfiles='cd ~/.dotfiles' # Shortcut to CLI dotfiles dir
alias guifiles='cd ~/.dotfiles-xfce' # Shortcut to GUI dotfiles dir

# List files/dirs
alias ls='ls -G'
alias l='ls -lF'
alias la='ls -lAGh'
# list only unhidden directories
alias ld='ls -lF | grep "^d"'
# list all directories
alias lad='ls -la | grep "^d"'
alias tree='tree -C'

# `cat` with beautiful colors. requires Pygments installed
# inspired by [Paul Irish](https://github.com/paulirish/dotfiles)
alias v='pygmentize -O style=default -f console256 -g'

# Editing
alias brel='source ~/.zshrc'
alias ea='vim ~/.dotfiles/zsh/includes/aliases && brel'
alias vi='vim'
alias ev='vim ~/.vimrc' # Auto-recompiling is set in .vimrc itself

alias h='history'

# Use VIM as pager instead of LESS/MORE
alias vmore="vim -u ~/.vimrc.more -"

# Git shortcuts
alias git=hub # use ~/bin/hub as wrapper for git
alias gitsh='gitsh --git $(which hub)'
alias grcd='cd $(git root)'
alias s='git status --short --branch '
alias ss='git status '
alias a='git add '
alias b="git for-each-ref --count=10 --sort=-committerdate --color=auto --format='%(refname:short)' refs/heads/ | less"
alias bb='git branch '
alias c='git commit '
alias dw='git diff --color-words'
alias t='git tag -n1'
alias di='git diff'
alias m='git merge --no-ff' # Non-Fast-Forward merge
alias mf='git merge --ff-only' # Fast-Forward merge
alias pull='git pull '
alias push='git push '
# Subtree Pull in
function spull() { git subtree pull --prefix=$1 $1 master }
# Subtree Push upstream
function spush() { git subtree push --prefix=$1 $1 master }
# Subtree Add new one
function sadd() { git subtree add --prefix=$1 $1 master }
# Undo a `git push`
alias undopush="git push -f origin HEAD~:master"
alias lg='git log -p'
alias lol='git log --graph --decorate --abbrev-commit --date=relative --pretty=format:"%C(yellow)%h%C(reset) %C(black)%ad%C(reset) %C(blue)%an%C(reset)%C(red)%d%C(reset) %s"'
alias lola='lol --all'
# Show files ignored by git
alias ign='git ls-files -o -i --exclude-standard'
# Show useful info about any remote (pass remote name as argument)
alias inf='git remote show '
# Export current commit changes against ref to patch file
alias gfp='git format-patch --stdout > patch'

# Additional binaries

# Todo App (todotxt.org)
alias t='~/bin/todo.txt_cli-2.9/todo.sh'

# IRSSI draw fix - http://www.mindfuzz.net/?p=393
alias irssi='TERM=screen-256color irssi'

# Betty - Friendly English-like interface for CLI
# More details: https://github.com/pickhardt/betty
alias betty="~/.dotfiles/betty/main.rb"

# Fire up simple server and open it's root page in the browser
alias server="open http://localhost:8000 && python -m SimpleHTTPServer"

# Send OS X notification
alias notify='terminal-notifier -message "Done" -activate com.googlecode.iterm2'

# c++11 installation
# More info: http://sourabhbajaj.com/mac-setup/Cpp/README.html
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Visual Studio Code shortcut
# Taken from https://stackoverflow.com/a/33303456
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
