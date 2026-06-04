# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/peteg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Enable debug for Starship timings
# env STARSHIP_LOG="trace starship timings"

# Custom aliases
source .zsh_aliases

# Custom functions
eview () {
    emacs -nw "$1" --eval '(setq buffer-read-only t)'
}

enw () {
    emacs -nw "$@"
}