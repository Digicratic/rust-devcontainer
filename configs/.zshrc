# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( vcs_info )

zstyle ':vcs_info:git:*' formats '(%b) '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Enable debug for Starship timings
# env STARSHIP_LOG="trace starship timings"

# Custom aliases
source $HOME/.zsh_aliases

# Custom functions
eview () {
    emacs -nw "$1" --eval '(setq buffer-read-only t)'
}

enw () {
    emacs -nw "$@"
}