# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/darren/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.profile

source ${ZDOTDIR:-$HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=black,bold"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

if [ command -v starship &> /dev/null ]; then
    eval "$(starship init zsh)"
fi
