[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

function command_exists {
    command -v $1 &> /dev/null
}

function ssh {
    if command -v tmux &> /dev/null && [ "$TMUX" != "" ]; then
        current_win_name=`tmux display-message -p '#W'`
        tmux rename-window "$*"
        command ssh "$@"
        tmux rename-window $current_win_name
    else
        command ssh "$@"
    fi
}

function append_to_path_if_missing {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH=$PATH:$1
    fi
}

function prepend_to_path_if_missing {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH=$1:$PATH
    fi
}

function first_available {
    while [ "$#" != "0" ]; do
        if [ "$1" != "" ]; then
            if command -v $1 &> /dev/null; then
                echo $1
                return 0
            fi
        fi
        shift
    done
    return 1
}

# Add color to man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GROFF_NO_SGR=1

export LS_COLORS=$LS_COLORS:'di=0;35:'
LS_OPTIONS="--color=auto"

prepend_to_path_if_missing ~/.local/bin
#append_to_path_if_missing /sbin
#append_to_path_if_missing /opt/nvim-linux64/bin

if command_exists eza || command_exists exa; then
    EXA_OPTIONS="--git --header --icons $LS_OPTIONS"
    EZA_OPTIONS="--git --header --icons --color-scale-mode=fixed $LS_OPTIONS"
    EZA_COLORS="ur=32:uw=33:ux=31:ue=31:gr=32:gw=33:gx=31:tr=32:tw=33:tx=31:sn=1:uu=1;32:gu=1;32"

    if command_exists eza; then
        export EZA_COLORS
        LS="eza $EZA_OPTIONS"
    else
        export EXA_COLORS
        LS="exa $EXA_OPTIONS"
    fi

    alias ls="$LS"
    alias ll="$LS -lg"
    alias lrt="$LS -lg -snew"
else
    alias ls="ls $LS_OPTIONS"
    alias ll="ls -l $LS_OPTIONS"
    alias lrt="ls -lrt $LS_OPTIONS"
fi

if command_exists nvim; then
    alias vim=nvim
fi

if command_exists bat; then
    alias cat='bat -pp'
fi

export EDITOR="ex"
export VISUAL="$(first_available emacs vim vi)"
export SUDO_EDITOR="$(first_available vim emacs vi)"
export KUBE_EDITOR=$SUDO_EDITOR

alias sudoemacs="SUDO_EDITOR=emacs sudoedit"
alias sudovim="SUDO_EDITOR=vim sudoedit"

