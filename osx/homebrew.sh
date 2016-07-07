#!/bin/sh

if [ ! -d /usr/local/Cellar ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew doctor
fi

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      brew upgrade "$@"
    fi
  else
    brew install "$@"
  fi
}

brew_is_installed() {
  local name
  name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name
  name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/.*\//, ""); gsub(/:/, ""); print $1}'
}

cask_install_or_upgrade() {
}

# Core tools
brew_install_or_upgrade 'grc'
brew_install_or_upgrade 'coreutils'
brew_install_or_upgrade 'dos2unix'
brew_install_or_upgrade 'wget'
brew_install_or_upgrade 'pstree'
brew_install_or_upgrade 'docker'
brew_install_or_upgrade 'dlite'
brew_install_or_upgrade 'netcat'
brew_install_or_upgrade 'argon/mas/mas'

# Github tools
brew_install_or_upgrade 'hub'

# Imaging tools
brew_install_or_upgrade 'pngcrush'

# Python tools
brew_install_or_upgrade 'python'
brew_install_or_upgrade 'numpy'

# Ruby tools
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'
brew_install_or_upgrade 'phantomjs'

# Java tools
brew_install_or_upgrade 'gradle'
brew_install_or_upgrade 'maven'

# Node tools
brew_install_or_upgrade 'node'

# Heroku tools
brew_install_or_upgrade 'heroku-toolbelt'

# Electron windows installer builder tools
brew_install_or_upgrade 'wine'
brew_install_or_upgrade 'mono'
brew_install_or_upgrade 'makensis'

# Databases
brew_install_or_upgrade 'postgres'
brew_install_or_upgrade 'postgis'
brew_install_or_upgrade 'redis'

# Casks
brew tap caskroom/versions

brew cask install --appdir="/Applications" '1password'
brew cask install --appdir="/Applications" 'airfoil'
brew cask install --appdir="/Applications" 'airmail-beta'
brew cask install --appdir="/Applications" 'arduino'
brew cask install --appdir="/Applications" 'cloak'
brew cask install --appdir="/Applications" 'dropbox'
brew cask install --appdir="/Applications" 'firefox'
brew cask install --appdir="/Applications" 'imagealpha'
brew cask install --appdir="/Applications" 'java'
brew cask install --appdir="/Applications" 'mou'
brew cask install --appdir="/Applications" 'paw'
brew cask install --appdir="/Applications" 'rescuetime'
brew cask install --appdir="/Applications" 'skype'
brew cask install --appdir="/Applications" 'slate'
brew cask install --appdir="/Applications" 'spotify'
brew cask install --appdir="/Applications" 'tunnelblick'
brew cask install --appdir="/Applications" 'vlc'
brew cask install --appdir="/Applications" 'zeplin'

# Mac App Store apps
mas install 406056744 # Evernote
mas install 425424353 # The Unarchiver
mas install 635758264 # Calca
mas install 497799835 # Xcode
mas install 880001334 # Reeder
mas install 435003921 # Fantastical
mas install 412056820 # Trillian
mas install 803453959 # Slack
mas install 420212497 # Byword
mas install 504544917 # Clear
mas install 448003584 # Simplify
mas install 458034879 # Dash
