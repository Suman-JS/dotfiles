export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

plugins=(git docker sudo  zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/sumanjs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/sumanjs/.bun/_bun" ] && source "/home/sumanjs/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
fpath=($fpath "/home/sumanjs/.zfunctions")

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

alias ls="eza --icons=always"
alias cls="clear"
alias src="source ~/.zshrc"
export PATH="$PATH:/opt/nvim-linux64/bin"
. "$HOME/.cargo/env"
alias kitten="~/.local/kitty.app/bin/kitten"
alias cat="batcat"

export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/share/man:$MANPATH

export CPLUS_INCLUDE_PATH=/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11
export LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/11
