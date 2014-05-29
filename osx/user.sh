#!/bin/sh

# Set user picture
AVATAR_PATH="${HOME}/Pictures/.avatar.png"

cp avatar.png ${AVATAR_PATH}
dscl . delete /Users/brad Picture 
dscl . create /Users/brad Picture ${AVATAR_PATH}

cp ../gradle/gradle.properties ~/.gradle/

# Set zsh as default shell
chsh -s /bin/zsh brad
