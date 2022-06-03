## edit startup 
# autoload -Uz zsh-newuser-install && zsh-newuser-install -f

## brew important!
[ -d /opt/homebrew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

## autosuggestion
[ -d ~/.config/zsh-autosuggestions ] || ( \
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-autosuggestions \
  && rm -rf ~/.config/zsh-autosuggestions/.git )
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

## autocompletion
#[ -d ~/.config/zsh-autocomplete ] || ( \
#  git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.config/zsh-autocomplete \
#  && rm -rf ~/.config/zsh-autocomplete/.git )
#source ~/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh


# The following lines were added by compinstall

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# Lines configured by zsh-newuser-install

setopt autocd nomatch notify prompt_subst correct appendhistory autocd nomatch
unsetopt beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
 
### my Prompt

PROMPT='%(?.%F{green}0.%F{red}?%?)%f %m %B%F{yellow}%2~%f%b %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

## my aliase
source .config/zsh/aliases
