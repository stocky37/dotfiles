export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim

# set to a 256 colour terminal if not in a tmux session
if [ "$TMUX" = '' ]; then
  export TERM="xterm-256color"
fi

plugins=(
  ansible
  common-aliases
  docker
  git-auto-fetch
  git
  gitfast
  gitignore
  history
  kubectl
  magic-enter
  mvn
  oc
  npm
  sudo
  tmux
  yum
  zsh-autosuggestions
)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

# forget what this is, probably alt+backspace delete word
bindkey "^[[3;3~" kill-word

# Ctrl+space shortcut for autocomplete
bindkey '^ ' autosuggest-accept

# todo: test virtualenvwrapper here like the below

# local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# oh my zsh
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
