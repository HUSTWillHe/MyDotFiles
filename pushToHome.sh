#! /bin/bash -e
cd $(dirname $0)
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./DotFiles/.vimrc.local ~
cp ./DotFiles/.zshrc ~
cd ~/.oh-my-zsh/plugins/ 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.vimrc
source ~/.vimrc.local
source ~/.zshrc
