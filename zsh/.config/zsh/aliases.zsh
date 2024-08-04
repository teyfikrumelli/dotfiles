alias ls="eza --icons"
alias ll="eza -l -g --icons"
alias llt="eza -1 --icons --tree"

alias cat="bat"
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
