export PATH=$HOME/bin/.local/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dracula-pro"
ZSH_CUSTOM=$HOME/.config/zsh/custom

plugins=(
  nvm
  vi-mode
  aws
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.env
 
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# pnpm
export PNPM_HOME="/Users/adam/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export "ANDROID_HOME=$HOME/Library/Android/sdk"
export "ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk"
export "ANDROID_AVD_HOME=${HOME}/.Android/avd"

eval "$(direnv hook bash)"
# source "$(brew --prefix)/opt/asdf/libexec/asdf.sh"

# sst
export PATH=/Users/adam/.sst/bin:$PATH

# hot reload for go servers using air
alias air='~/go/bin/air'

alias ☕='ssh terminal.shop'
