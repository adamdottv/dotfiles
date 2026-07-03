export GPG_TTY=$(tty)
export PNPM_HOME="/Users/adam/Library/pnpm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk
export ANDROID_AVD_HOME=${HOME}/.Android/avd
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=$PNPM_HOME:$PATH
export PATH=/Users/adam/.sst/bin:$PATH
export PATH=/Users/adam/.bun/bin:$PATH
export PATH=$HOME/bin/.local/scripts:$PATH

source ~/.env

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

eval "$(direnv hook bash)"
[ -s "/Users/adam/.bun/_bun" ] && source "/Users/adam/.bun/_bun"

c() {
  emulate -L zsh
  setopt NO_GLOB
  local query="$*"
  local prompt="Here is what the user asked: ${query}."
  local cmd
  cmd=$(OPENCODE_EXPERIMENTAL_NO_BOOTSTRAP=1 opencode run --model opencode/claude-haiku-4-5 --agent shell "$prompt" 2>/dev/null)
  print -z -- "$cmd"
}

alias c='noglob c'
alias oc='opencode'
alias ocl='opencode_local'
alias ocd='OPENCODE_EXPERIMENTAL_WATCHER=1 OPENCODE_ENABLE_EXPERIMENTAL_MODELS=1 bun run dev . serve --port 4096'
alias ocp='OPENCODE_EXPERIMENTAL_WATCHER=1 OPENCODE_ENABLE_EXPERIMENTAL_MODELS=1 bunx --force opencode-ai@dev serve --port 4096'

alias fc='framecap'

alias ☕='ssh terminal.shop'

alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias ga='git add'
alias gaa='git add -A'
alias gp='git push'
alias gcl='git clean -df'
alias gwipe='git checkout . && git clean -df'
alias sync='git stash && git pull && git stash pop'
alias syncdev='git stash && git fetch && git pull && git rebase origin/dev && git stash pop'

alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gda='git diff --all'
alias gre='git rebase --interactive'
alias grc='git rebase --continue'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias grs='git restore --staged .'
alias gdev='git reset --hard dev'
alias grdev='git rebase dev'
alias gdevo='git fetch && git reset --hard origin/dev'
alias grdevo='git fetch && git rebase origin/dev'

absorb() {
    local target="${1:-dev}"
    local current="$(git branch --show-current)"

    # 1. Rebase
    git rebase "$target" || return 1

    # 2. Find Worktree Path
    local wt_path
    wt_path=$(git worktree list | grep " \[$target\]" | awk '{print $1}')

    if [[ -z "$wt_path" ]]; then
        echo "Error: '$target' is not checked out in any worktree."
        return 1
    fi

    # 3. Merge in that path
    git -C "$wt_path" merge --ff-only "$current" && echo "Successfully absorbed $current into $target"
}


source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export NODE_EXTRA_CA_CERTS="/Users/$USER/.mitmproxy/mitmproxy-ca-cert.pem"
export NODE_TLS_REJECT_UNAUTHORIZED=0

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/adam/.lmstudio/bin"
# End of LM Studio CLI section


export PATH="$HOME/.local/bin:$PATH"


# opencode
export PATH=/Users/adam/.opencode/bin:$PATH

source /Users/adam/.daytona.completion_script.zsh
