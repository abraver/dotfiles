#!/bin/sh

# Run AFTER dropbox sync and after zero.sh is all done

# Symlink Sublime preferences from Dropbox
ln -s /Users/abraver/Library/CloudStorage/Dropbox/SublimeText/User /Users/abraver/Library/Application\ Support/Sublime\ Text\ 3/Packages/

# Symlink important Apache config prefs
ln -s /Users/abraver/.dotfiles/apache/httpd.conf /opt/homebrew/etc/httpd/
ln -s /Users/abraver/.dotfiles/apache/extra/httpd-vhosts.conf /opt/homebrew/etc/httpd/extra/


# Show the ~/Library folder
chflags nohidden ~/Library


# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Trackpad: enable tap to click for this user and for the login screen
# These first two commented ones are taken care of in defaults.yaml
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on
