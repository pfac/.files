source "${HOME}/.zshrc"
source "${HOME}/.profile"

# Tab completion
autoload -U compinit
compinit

# Prompt
autoload -U colors && colors
autoload -U promptinit && promptinit

export PS1="
%{$fg_bold[white]%}%n@%M:%{$reset_color%}%F{blue}%~%f %{$fg_bold[black]%}(%l)%{$reset_color%}
%(?,%F{green}✓ %#%f,%F{red}✗ %#%f) "
