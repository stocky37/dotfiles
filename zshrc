export LANG=en_US.UTF-8
export EDITOR=vim

# set to a 256 colour terminal if not in a tmux session
if [ "$TMUX" = '' ]; then
  export TERM="xterm-256color"
fi

source ~/.antigenrc

# forget what this is, probably alt+backspace delete word
bindkey "^[[3;3~" kill-word

bindkey '^[[3;5~' kill-word                           # [Ctrl-Backspace] - delete word backward
bindkey '^H' backward-kill-word                       # [Ctrl-Delete] - delete word forward

# Ctrl+space shortcut for autocomplete
bindkey '^ ' autosuggest-accept

# local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

return 0
