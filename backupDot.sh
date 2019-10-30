#! /bin/bash -e
cd $(dirname $0)
cp ~/.vimrc ./DotFiles/
cp ~/.vimrc.local ./DotFiles/
cp ~/.zshrc ./DotFiles
rm ./DotFiles/nvim.tar.gz
pushd ~/.config
tar zcvf nvim.tar.gz nvim
popd
mv ~/.config/nvim.tar.gz ./DotFiles/
