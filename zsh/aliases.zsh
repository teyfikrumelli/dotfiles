alias ls="exa --icons"
alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"

alias cat="batcat"
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
