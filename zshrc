if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

setopt autocd
WORDCHARS=${WORDCHARS/\/}

export SPACESHIP_CONFIG="$HOME/.dotfiles/zsh/spaceship.zsh"
eval "$(sheldon source)"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Code/flutters/flutter/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/naidraikzir/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/naidraikzir/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/naidraikzir/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/naidraikzir/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(fnm env --use-on-cd)"

export PNPM_HOME="/Users/naidraikzir/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "/Users/naidraikzir/.bun/_bun" ] && source "/Users/naidraikzir/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source ~/.zsh/keybindings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/plugins_after.zsh

if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
