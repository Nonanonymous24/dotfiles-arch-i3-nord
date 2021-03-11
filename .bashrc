#
# ~/.bashrc
#

#Run tmux on start
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#	    tmux attach -t default || tmux new -s default
#fi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

### DEFAULT CONFIG ENDS HERE

# Custom aliases
alias cat='bat'
alias ls='exa'
alias colortest='npx colortest'

# For crontab
export VISUAL=vim

# Run fish shell 
exec fish

# For using thefuck in bash
eval "$(thefuck --alias)"

