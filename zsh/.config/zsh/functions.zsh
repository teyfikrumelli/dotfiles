sd() {cd ~/Desktop/workspace && cd $(find * -type d | fzf-tmux) && nvim \;}
sdt() {cd ~/Desktop/workspace && cd $(find * -type d | fzf-tmux) && $(tmux new -s $1 -n $1 \; new-session) || $(tmux attach -t $1:$1 \;)}

getuuid() {
  uuid=$(uuidgen | tr 'A-Z' 'a-z' | tr -d '\n')
  (osascript -e "display notification with title \"⌘-V to paste\" subtitle \"$uuid\"" &) >/dev/null 2>&1
  echo -n "$uuid" | pbcopy
}

fsearch() {
  fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim
}

search() {
  rg --no-heading --line-number --color=always "$1" \
    | fzf --ansi \
    | awk -F: '{print "+"$2" "$1}' \
    | xargs -r nvim
}
