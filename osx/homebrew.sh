#!/bin/sh

if [ ! -d /usr/local/Cellar ]; then
    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
    brew doctor
fi

brew install \
    grc \
    coreutils \
    dos2unix \
    wget \
    rbenv \
    pstree
