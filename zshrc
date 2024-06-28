if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

setopt autocd
WORDCHARS=${WORDCHARS/\/}

export SPACESHIP_CONFIG="$HOME/.dotfiles/zsh/spaceship.zsh"
eval "$(sheldon source)"

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

eval "$(fnm env --use-on-cd)"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/plugins_after.zsh

if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
