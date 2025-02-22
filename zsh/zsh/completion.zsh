# menu style completion matching
zstyle ':completion:*' menu yes select

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# make colorful
zstyle ':completion:*' list-colors “${(s.:.)LS_COLORS}”

