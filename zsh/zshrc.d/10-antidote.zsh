zstyle ':antidote:bundle' path-style short 
zstyle ':antidote:bundle' file ${ZDOTDIR:-~}/zplugins
zstyle ':antidote:static' file ${ZDOTDIR:-~}/.zplugins.zsh
zstyle ':antidote:plugin:*' defer-options '-p'

antidote_dir="${XDG_CACHE_HOME:-$HOME/.cache}/mattmc3/antidote"
[[ -d "${antidote_dir}" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
source "$antidote_dir/antidote.zsh"
antidote load
