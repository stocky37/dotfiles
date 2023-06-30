# ZSH
export ZDOTDIR=~/.zsh

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/Projects

# Apps
export EDITOR=vim

# Misc.
export LANG=en_US.UTF-8
export JAVA_HOME=/usr/lib/jvm/java-openjdk

# Paths
typeset -gU path fpath cdpath

path=(
  ~/.local/bin
  ~/.poetry/bin
  ~/.jbang/bin
  $path
)

# external configs
[[ -f "${ZDOTDIR:-~}/.zshenv.private" ]] && source "${ZDOTDIR:-~}/.zshenv.private"
[[ -f "${ZDOTDIR:-~}/.zshenv.local" ]] && source "${ZDOTDIR:-~}/.zshenv.local"
