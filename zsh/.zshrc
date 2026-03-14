[[ -f ~/.zshrc_local_before ]] && source ~/.zshrc_local_before

export WORDCHARS='_'
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PNPM_HOME="$HOME/Library/pnpm"
export SPACESHIP_CONFIG="$HOME/.zsh/spaceship.zsh"

typeset -U path
path=(
  /usr/local/sbin
  $HOME/go/bin
  $HOME/.composer/vendor/bin
  $HOME/.bun/bin
  $PNPM_HOME
  $ANDROID_HOME/tools
  $ANDROID_HOME/tools/bin
  $ANDROID_HOME/platform-tools
  $path
)
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

setopt autocd
setopt no_case_glob
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

autoload -Uz compinit

zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

if [[ -s "$zcompdump" && -n "$(find "$zcompdump" -mmm -1440 2>/dev/null)" ]]; then
  compinit -u -C
else
  compinit -u
fi

if [[ -s "$zcompdump" && (! -f "$zcompdump.zwc" || "$zcompdump" -nt "$zcompdump.zwc") ]]; then
  zcompile "$zcompdump"
fi

eval "$(sheldon source)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(fixit init --name tf zsh)"
source <(fzf --zsh)

source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/plugins_after.zsh

[[ -f ~/.zshrc_local_after ]] && source ~/.zshrc_local_after
