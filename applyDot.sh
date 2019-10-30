#! /bin/bash -e

set -e
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

cd $(dirname $0)

if [[ $(uname) == "Darwin" ]]; then
	echo "${BLUE} The platform is MacOS.${RESET}"
	PLATFORM=MACOS
elif [[ $(uname) == "Linux" ]]; then
	echo "${BLUE} The platform is Linux.${RESET}"
	PLATFORM=LINUX
else
	echo "${RED} Can NOT certify the platform!${RESET}"
	exit -1
fi

VIM_VER=NEO
while [[ $# != 0 ]]
do
	cur_para = $(echo $1 | tr '[A-Z]' '[a-z]')
    if [[ ${cur_para} == spf || ${cur_para} == spf13 || ${cur_para} == spf13vim || ${cur_para} == spf-vim || ${cur_para} == spf13-vim || ${cur_para} == spf13_vim || ${cur_para} == spf_vim ]]; then
		echo "${BLUE} Use spf13-vim.${RESET}"
		VIM_VER=SPF
	fi
	if [[ ${cur_para} == neo || ${cur_para} == neovim || ${cur_para} == neo-vim || ${cur_para} == neo_vim ]];then
		echo "${BLUE} Use spf13-vim.${RESET}"
		VIM_VER=NEO
	fi
done

if [[ ${VIM_VER} == "NEO" ]];then
	if [ !-d ~/.config/nvim/ ]; then
	    echo "${BLUE} neo vim NOT exist!${RESET}"
		echo "${BLUE} neo vim installation begin.${RESET}"
		if [[ ${PLATFORM} == "MACOS" ]]; then
			curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
			tar xzf nvim-macos.tar.gz
			./nvim-osx64/bin/nvim
		else [[ ${PLATFORM} == "LINUX" ]]; then
			curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
			chmod u+x nvim.appimage
			./nvim.appimage
			fi
		echo "${GREEN} neo vim installation finished.${RESET}"
	else
	    echo "${BLUE} neo vim already exists!${RESET}"
	fi
fi

if [[ ${VIM_VER} == "SPF" ]]; then
	if [ !-f ~/spf13-vim.sh ];then
	    echo "${BLUE} spf13-vim.sh NOT exist!${RESET}"
		echo "${BLUE} spf13vim installation begin.${RESET}"
	    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
		echo "${GREEN} spf13vim installation finished.${RESET}"
	else
	    echo "${BLUE} spf13-vim.sh already exists!${RESET}"
	fi
fi

if [ !-d ~/.oh-my-zsh/ ];then
    echo "${BLUE} oh-my-zsh NOT exist!${RESET}"
	echo "${BLUE} oh-my-zsh installation begin.${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "${GREEN} oh-my-zsh installation finished.${RESET}"
else
    echo "${BLUE} oh-my-zsh already exists!${RESET}"
fi

echo "${BLUE} apply personal preferences.${RESET}"
cp ./DotFiles/.vimrc.local ~
cp ./DotFiles/.zshrc ~
cd ~/.oh-my-zsh/plugins/ 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
if [[ ${VIM_VER} == "SPF" ]]; then
	source ~/.vimrc
	source ~/.vimrc.local
fi
if [[ ${VIM_VER} == "NEO" ]]; then
	if [ !-d ~/.config ];then
		mkdir ~/.config/
	fi
	cp ./DotFiles/nvim.tar.gz ~/.config/
	pushd ~/.config/
		tar xf nvim.tar.gz
		rm nvim.tar.gz
		source ./nvim/init.vim
	popd # form ~/.config
fi
source ~/.zshrc
echo "${GREEN} Apply personal preferences finished.${RESET}"


