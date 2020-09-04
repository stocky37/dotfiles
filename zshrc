# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# uncomment for profiling zsh startup
#zmodload zsh/zprof

#######################
# env                 #
#######################
export LANG=en_US.UTF-8
export EDITOR=vim


#######################
# tmux                #
#######################
# set to a 256 colour terminal if not in a tmux session
if [ "$TMUX" = '' ]; then
  export TERM="xterm-256color"
fi

#######################
# zgen                #
#######################
ZGEN_RESET_ON_CHANGE=(
  "${ZDOTDIR:-$HOME}/.zshrc"
  "${ZDOTDIR:-$HOME}/.zshrc.local"
  "${ZDOTDIR:-$HOME}/.zsh_plugins"
)

export ZGEN_DIR="${ZDOTDIR:-$HOME}/.zgen"
source "$ZGEN_DIR/zgen.zsh"
if ! zgen saved; then
  # clone omz without source the root script
  # zgen clone robbyrussell/oh-my-zsh
  zgen oh-my-zsh
  [[ -f "${ZDOTDIR:-$HOME}/.zsh_plugins" ]] && zgen loadall < "${ZDOTDIR:-$HOME}/.zsh_plugins"
  zgen save
fi


#######################
# plugins             #
#######################
# autosuggest
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept # [Ctrl-Space]

# powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################
# key bindings        #
#######################
bindkey '^[[3;5~' kill-word         # [Ctrl-Delete] - delete word forward
bindkey "^[[3;3~" kill-word         # [Alt-Delete] - delete word forward
bindkey '^H' backward-kill-word     # [Ctrl-Backspace] - delete word backward


#######################
# misc                #
#######################
[[ -f $(which virtualenvwrapper.sh) ]] && source $(which virtualenvwrapper.sh)

#######################
# includes            #
#######################
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.aliases ]] && source ~/.aliases

# uncomment for profiling zsh startup
#zprof

return 0

