#! /bin/bash -e
cd $(dirname $0)
if [ !-f ~/spf13-vim.sh ];then
    echo "spf13-vim.sh NOT exist!"
    echo "Start install spf13-vim."
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
else
    echo "spf13-vim.sh exist"
fi

if [ !-d ~/.oh-my-zsh/ ];then
    echo "oh-my-zsh NOT exist"
    echo "Start install oh-my-zsh."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh exist"
fi

echo "Copy dot files to home"
cp ./DotFiles/.vimrc.local ~
cp ./DotFiles/.zshrc ~
cd ~/.oh-my-zsh/plugins/ 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.vimrc
source ~/.vimrc.local
source ~/.zshrc
