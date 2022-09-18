. /Users/sergey/.dotfiles/zsh/zshrc
. /Users/sergey/.dotfiles/zsh/includes/oh-my-zsh

# eval "$(starship init zsh)"
. ~/.zshrc.local
# Remove duplicates in Paths
declare -U path

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/sergey/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/Users/sergey/.bun/_bun" ] && source "/Users/sergey/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/sergey/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# Load Angular CLI autocompletion.
source <(ng completion script)
. /zsh/zshrc
. /zsh/zshrc
. /zsh/zshrc
