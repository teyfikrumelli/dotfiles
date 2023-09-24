sd() {cd ~/Desktop/workspace && cd $(find * -type d | fzf-tmux) && nvim \;}
sdt() {cd ~/Desktop/workspace && cd $(find * -type d | fzf-tmux) && $(tmux new -s $1 -n $1 \; new-session) || $(tmux attach -t $1:$1 \;)}
