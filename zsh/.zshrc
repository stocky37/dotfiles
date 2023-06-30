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

# misc.
bindkey '^ ' autosuggest-accept # [Ctrl-Space]
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# includes
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f "${ZDOTDIR:-~}/.zshrc.private" ]] && source "${ZDOTDIR:-~}/.zshrc.private"
[[ -f "${ZDOTDIR:-~}/.zshrc.local" ]] && source "${ZDOTDIR:-~}/.zshrc.local"


true





# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#
#
#
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#autoload -Uz compinit && compinit
#autoload -Uz promptinit && promptinit
#prompt p10k pure
#
## load antidote
#if [[ ! -f ${ZDOTDIR:-~}/.antidote/antidote.zsh ]]; then
#  command git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
#fi
#source "${ZDOTDIR:-~}/.antidote/antidote.zsh"
#zstyle ':antidote:bundle' use-friendly-names 'yes'
#antidote load
#
#
########################
## plugin config       #
########################
#
## autosuggest
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4"
#
#
## powerlevel10k
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
########################
## key bindings        #
########################
#bindkey '^[[3;5~' kill-word         # [Ctrl-Delete] - delete word forward
#bindkey "^[[3;3~" kill-word         # [Alt-Delete] - delete word forward
#bindkey '^H' backward-kill-word     # [Ctrl-Backspace] - delete word backward
#bindkey '^q' push-line-or-edit      # [Ctrl-q] - kill command, paste in on next prompt
#
########################
## misc                #
########################
#
## undo the 'rm -i' alias from omz
#unalias rm
#unalias cp
#
## directory navigation
#setopt auto_cd
#setopt autopushd
#
########################
## includes            #
########################

#
## uncomment for profiling zsh startup
##zprof
#
#return 0
