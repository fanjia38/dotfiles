#!/bin/sh

# copy settings file
cd ~/Library/Application\ Support/Code/User/
rm settings.json
ln -s ~/dotfiles/vscode/settings.json ./settings.json

# extensions
cat ~/dotfiles/vscode//extensions | while read line
do
  code --install-extension $line
done
