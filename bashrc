#
# ~/.bashrc
#

alias research='cd ~/Projects/kindschi-project-2025-2026'
alias gv-wifi='nmcli device wifi connect "GV-Student" --ask'
alias open="xdg-open $1"
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diskspace="du -S | sort -n -r | more"
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias activenv='source ./venv/bin/activate'
alias vpn='sudo openconnect-pulse-gui vpn.student.gvsu.edu'

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

if [ -n "$SSH_CONNECTION" ]; then
    export TERM=xterm-256color
fi

archey3
eval "$(starship init bash)"
