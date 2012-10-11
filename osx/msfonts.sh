#!/bin/sh
# Downloads and installs MS fonts like Cambria, Consolas, etc

brew install cabextract

TMPDIR=`mktemp -d /tmp/msfonts.XXXXXX`
cd ${TMPDIR}

curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
cabextract PowerPointViewer.exe
cabextract ppviewer.cab

mkdir -p ${HOME}/Library/Fonts/
cp *.TTF ${HOME}/Library/Fonts/

rm -rf ${TMPDIR}
brew uninstall cabextract
