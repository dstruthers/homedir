source $HOME/.profile

color_terms=(xterm-color xterm-256color screen screen-256color)
for i in "${color_terms[@]}"; do
    if [ "$TERM" == "$i" ]; then
        PS1='[\[\033[01;37m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]$ '
    fi
done

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi
