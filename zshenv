typeset -U path

path=(~/.poetry/bin $path)

export LANG=en_US.UTF-8
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/java-openjdk
export ZDOTDIR="$HOME"
export ZSHDIR="$ZDOTDIR/.zsh"
export ZGEN_DIR="${ZGEN_DIR:-$ZDOTDIR/.zgenom}"
export ZGENOM_DIR="$ZGEN_DIR/zgenom"

# external configs
[[ -f ~/.zshenv.private ]] && source ~/.zshenv.private
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
