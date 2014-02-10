#!/bin/sh

if [ ! -d /usr/local/Cellar ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew doctor
fi

brew install \
    grc \
    coreutils \
    dos2unix \
    wget \
    rbenv \
    pstree
