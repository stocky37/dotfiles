# .zshrc - Run on interactive Zsh session.
autoload -Uz compinit && compinit

# zstyles
[[ -r $ZDOTDIR/.zstyles ]] && . $ZDOTDIR/.zstyles

# use antidote for plugin management
export ANTIDOTE_HOME=${XDG_CACHE_HOME:=~/.cache}/repos
[[ -d $ANTIDOTE_HOME/mattmc3/antidote ]] || git clone --depth 1 -q https://github.com/mattmc3/antidote $ANTIDOTE_HOME/mattmc3/antidote
source $ANTIDOTE_HOME/mattmc3/antidote/antidote.zsh
antidote load

# prompt
source "${ZDOTDIR:-~}/.p10k.zsh"

# keybindings
bindkey '^ ' autosuggest-accept     # [Ctrl-Space]
bindkey '^[[3;5~' kill-word         # [Ctrl-Delete] - delete word forward
bindkey "^[[3;3~" kill-word         # [Alt-Delete] - delete word forward
bindkey '^H' backward-kill-word     # [Ctrl-Backspace] - delete word backward
bindkey '^q' push-line-or-edit      # [Ctrl-q] - kill command, paste in on next prompt

# misc.
unset CASE_SENSITIVE HYPHEN_INSENSITIVE
unalias rm
unalias cp

# includes
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f "${ZDOTDIR:-~}/.zshrc.private" ]] && source "${ZDOTDIR:-~}/.zshrc.private"
[[ -f "${ZDOTDIR:-~}/.zshrc.local" ]] && source "${ZDOTDIR:-~}/.zshrc.local"

# setup starship prompt
eval "$(starship init zsh)"

true
