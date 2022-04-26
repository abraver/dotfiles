#!/bin/sh
set -o errexit -o nounset

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPOS_DIR="$(mktemp -d -t macos_setup_repos)"

trap 'rm -rf "$REPOS_DIR"' EXIT
(
    echo "Installing PAM Touch ID..."
    cd "$REPOS_DIR"
    set -x
    git clone https://github.com/Reflejo/pam-touchID.git
    cd pam-touchID
    sudo make install
    set +x

    cd -
    echo "Installing PAM Watch ID..."
    set -x
    git clone https://github.com/biscuitehh/pam-watchid.git
    cd pam-watchid
    sudo make install
    set +x
)

echo "Updating Dock..."

set -x
dockutil --remove all --no-restart
dockutil --add /System/Applications/Utilities/Terminal.app --no-restart
dockutil --add /Applications/Safari.app --no-restart
dockutil --add /Applications/Superhuman.app --no-restart
dockutil --add /Applications/Cron.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /Applications/Notion.app --no-restart
dockutil --add /Applications/Reeder.app --no-restart
dockutil --add /Applications/Spotify.app --no-restart
dockutil --add /System/Applications/Messages.app --no-restart
dockutil --add ~/Downloads --display stack # Implicitly restarts the Dock.
set +x

(
    cd "$SCRIPT_DIR/../lib"

    echo "Adding Terminal theme..."
    if ! defaults read com.apple.Terminal "Window Settings" | grep -Fw Sasquatchian >/dev/null; then
        open -a Terminal assets/Sasquatchian.terminal
    fi
)

echo "Resetting QuickLook."
set -x
qlmanage -r
qlmanage -r cache
killall Finder
set +x
