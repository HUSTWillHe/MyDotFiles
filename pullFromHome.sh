#! /bin/bash -e
cd $(dirname $0)
cp ~/.vimrc.local ./DotFiles
cp ~/.zshrc ./DotFiles
pushd ~
source .zshrc
source .vimrc
source .vimrc.local
