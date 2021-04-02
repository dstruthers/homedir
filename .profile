[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# Add color to man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GROFF_NO_SGR=1

LS_OPTIONS="--color=auto"

if command -v exa &> /dev/null; then
    export EXA_COLORS="uu=1;32:gu=1;32:sn=0;37:sb=0;37:da=1;30:ex=4;1;32"
    EXA_OPTIONS="--git --header $LS_OPTIONS"
    alias ls="exa $EXA_OPTIONS"
    alias ll="ls -lg $EXA_OPTIONS"
else
    alias ls="ls $LS_OPTIONS"
    alias ll="ls -l $LS_OPTIONS"
fi

export EDITOR="emacs"

ssh () {
    if [ "$TMUX" != "" ]; then
        current_win_name=`tmux display-message -p '#W'`
        tmux rename-window "$*"
        command ssh "$@"
        tmux rename-window $current_win_name
    else
        command ssh "$@"
    fi
}

