if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

setopt autocd
setopt no_case_glob
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

WORDCHARS='_'

autoload -Uz compinit
compinit -u

export SPACESHIP_CONFIG="$HOME/.zsh/spaceship.zsh"
source <(fzf --zsh)
eval "$(sheldon source)"
eval "$(zoxide init zsh)"

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
. "$HOME/.cargo/env"

eval "$(fnm env --use-on-cd)"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/plugins_after.zsh

if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
