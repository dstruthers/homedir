source ~/.profile
profile_aliases=`alias -L`

ZFUNC=~/.zfunc
fpath=($ZFUNC $fpath)
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000000
bindkey -e
autoload -Uz compinit
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
antigen bundle zsh-users/zsh-autosuggestions

source ~/.antigen/bin/antigen.zsh
antigen use oh-my-zsh
[[ -n $commands[docker] ]] && antigen bundle docker
[[ -n $commands[docker-compose] ]] && antigen bundle docker-compose

if is-at-least 5.9 $ZSH_VERSION; then
    source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
else
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta'
fi
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Restore aliases that oh-my-zsh clobbered 
eval $profile_aliases

# Use completion provided by certain commands
[[ -n $commands[kubeadm] ]] && source <(kubeadm completion zsh)
[[ -n $commands[kubectl] ]] && source <(kubectl completion zsh)

if [[ -n $commands[podman] ]]; then
    [ -d $ZFUNC ] || mkdir -p $ZFUNC
    podman completion zsh -f $ZFUNC/_podman
    autoload -Uz _podman
fi

color_terms=(xterm-color xterm-256color screen screen-256color)
for i in "${color_terms[@]}"; do
    if [[ "$TERM" == "$i" ]]; then
        PS1='[%F{green}%n%F{white}@%F{blue}%m%F{white}:%~]%(?.%F{green}.%F{red}<$?>)%#%F{reset} '
    fi
done

[[ -n $commands[starship] ]] && eval "$(starship init zsh)"
