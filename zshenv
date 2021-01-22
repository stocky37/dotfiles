typeset -U path

path=(~/.poetry/bin $path)

export LANG=en_US.UTF-8
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/java-openjdk

# local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
