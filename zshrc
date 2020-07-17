export LANG=en_US.UTF-8
export EDITOR=vim

# uncomment for profiling zsh startup
# zmodload zsh/zprof

# set to a 256 colour terminal if not in a tmux session
if [ "$TMUX" = '' ]; then
  export TERM="xterm-256color"
fi

#[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh

source ~/.antigenrc

# forget what this is, probably alt+backspace delete word
bindkey "^[[3;3~" kill-word

bindkey '^[[3;5~' kill-word                           # [Ctrl-Backspace] - delete word backward
bindkey '^H' backward-kill-word                       # [Ctrl-Delete] - delete word forward

# Ctrl+space shortcut for autocomplete
bindkey '^ ' autosuggest-accept

[[ -f $(which virtualenvwrapper.sh) ]] && source $(which virtualenvwrapper.sh)

# local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# uncomment for profiling zsh startup
# zprof

return 0
