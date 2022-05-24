## edit startup 
# autoload -Uz zsh-newuser-install && zsh-newuser-install -f

## autocompletion
fpath=(~/.config/zsh-completions/src $fpath)
## autosuggestion
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines were added by compinstall

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# Lines configured by zsh-newuser-install

setopt autocd nomatch notify
unsetopt beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
 
### my Prompt

PROMPT='%(?.%F{green}0.%F{red}?%?)%f %B%F{240}%2~%f%b %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst correct appendhistory autocd beep extendedglob nomatch notify
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

eval "$(/opt/homebrew/bin/brew shellenv)"

## my aliase
source .config/zsh/aliases
