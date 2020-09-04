typeset -U path
path=(~/.poetry/bin $path)

export JAVA_HOME=/usr/lib/jvm/java-openjdk

# local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
