#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew のパスを追加
export PATH="$PATH:/opt/homebrew/bin/" # m1 mac
# export PATH="$PATH:/usr/local/bin" # intel mac

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade


formulas=(
    bat
    deno
    docker-compose
    git
    node
    node-build
    nodenv
    tig
    tree
    yarn
    zsh
)

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts

echo "brew install formula"
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# install gui up
casks=(
    alfred
    deepl
    docker
    firefox
    fork
    google-backup-and-sync
    google-chrome
    iterm2
    line
    slack
    spotify
    visual-studio-code
    xcode
    zoom
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done


stores=(
    497799835
    539883307
    937984704
    975890633
    1144071713
    1295203466
    1423210932
    1429033973
    1450950860
    1483764819
)


echo "app stores"
for store in "${stores[@]}"; do
    mas install $store
done


brew cleanup

echo "brew installed"
