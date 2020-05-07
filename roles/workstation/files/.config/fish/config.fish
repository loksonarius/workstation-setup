# Common Bin Path
set PATH $HOME/.bin $PATH

# chruby-fish Scripts
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# GOPATH Setup
set -x GOPATH $HOME/.go
set PATH $GOPATH/bin $PATH

# Cargo Bin Path
set PATH $HOME/.cargo/bin $PATH

# Krew Bin Path
set PATH $HOME/.krew/bin $PATH

# Starship Prompt
eval (starship init fish)

# Mask Vim with NeoVim
alias vim="nvim"

# Git Aliases
alias g="git"

alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"

alias glo="git log"
alias gt="git tag"
alias gtd="git tag -d"

alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"

alias gl="git pull"
alias gp="git push"

alias gi="git init"
alias gcl="git clone"

# Tmux Helper Func for Making Teamocil Layouts
alias tmux-layout='tmux list-windows -F "#{window_active} #{window_layout}" | grep "^1" | cut -d " " -f 2'

# Create/Attach to main tmux session on startup
if test -z $TMUX
  set session (tmux list-sessions 2> /dev/null | sort | head -n1 | cut -d: -f1)
  if test -z $session
    tmux new -s 0
  else
    tmux attach -t $session
  end
end
