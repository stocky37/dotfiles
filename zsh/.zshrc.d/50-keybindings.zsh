bindkey '^ ' autosuggest-accept     # [Ctrl-Space]
bindkey '^[[3;5~' kill-word         # [Ctrl-Delete] - delete word forward
bindkey "^[[3;3~" kill-word         # [Alt-Delete] - delete word forward
bindkey '^H' backward-kill-word     # [Ctrl-Backspace] - delete word backward
bindkey '^q' push-line-or-edit      # [Ctrl-q] - kill command, paste in on next prompt
