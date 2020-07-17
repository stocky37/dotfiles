typeset -U path
path=(~/.poetry/bin $path)

# local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
