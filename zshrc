# uncomment for profiling zsh startup
#zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######################
# zgen                #
#######################
ZGEN_RESET_ON_CHANGE=(
  "$ZDOTDIR/.zshrc"
  "$ZDOTDIR/.zshrc.local"
  "$ZSHDIR/plugins.txt"
)

[[ ! -f "$ZGENOM_DIR/zgenom.zsh" ]] && git clone https://github.com/jandamm/zgenom.git "$ZGENOM_DIR"
source "$ZGENOM_DIR/zgenom.zsh"
if ! zgen saved; then
  zgen ohmyzsh
  [[ -f "$ZSHDIR/plugins.txt" ]] && zgen loadall < "$ZSHDIR/plugins.txt"
  zgen save
fi

#######################
# plugin config       #
#######################

# autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=242
bindkey '^ ' autosuggest-accept # [Ctrl-Space]

# powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################
# key bindings        #
#######################
bindkey '^[[3;5~' kill-word         # [Ctrl-Delete] - delete word forward
bindkey "^[[3;3~" kill-word         # [Alt-Delete] - delete word forward
bindkey '^H' backward-kill-word     # [Ctrl-Backspace] - delete word backward
bindkey '^q' push-line-or-edit      # [Ctrl-q] - kill command, paste in on next prompt



#######################
# misc                #
#######################

# undo the 'rm -i' alias from omz
unalias rm

#######################
# includes            #
#######################
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.aliases ]] && source ~/.aliases

# uncomment for profiling zsh startup
#zprof

return 0

