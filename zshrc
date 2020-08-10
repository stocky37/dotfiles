# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export EDITOR=vim

# uncomment for profiling zsh startup
# zmodload zsh/zprof

# set to a 256 colour terminal if not in a tmux session
if [ "$TMUX" = '' ]; then
  export TERM="xterm-256color"
fi

#[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh

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
