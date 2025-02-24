alias python="python3"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# cd
alias cd="z"

# ls
alias k="eza -l --icons --group-directories-first"

# cat
alias cat="bat"

# Git
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo develop
  return 1
}
alias gaa="git add --all"
alias gb="git branch"
alias gcd="git checkout $(git_develop_branch)"
alias gcam="git commit --all --message"
alias gd="git diff"
alias gl="git pull"
alias gst="git status"
alias gpo="git push origin $(git branch --show current)"
