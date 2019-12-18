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
