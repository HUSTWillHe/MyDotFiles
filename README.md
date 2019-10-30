# My Dot Files
## Purpose  
To back my dot files to simply PC switching.  
When use pushToHome.sh, it will install oh-my-zsh ans spf13-vim automatically.  

## Main Lists  
- .vimrc  
- .vimrc.local  
- .zshrc  
- neovim  
## Main Plugins  
- ydict  
- autojump  
- oh-my-zsh  
- the fuck  
- zsh-syntax-hightlighting  
- spf13-vim  
- tmux  
## Color Scheme  
- zsh theme is robbyrussell
- iTerm2's color presets is Tango Dark.  
- I change vim's color in vim.rc.local  
## Usage  
- run pullFromHome.sh to update dot files to this repo.  
- run pushToHome.sh to apply dot files to a new mac.  
```
# neovim配置的后续操作
# 让 neovim 成为默认的 vim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
 
# 刷新插件
nvim -c UpdateRemotePlugins
在neovim中使用`:PlugUpdate`来更新插件
# 在.tmux.conf中添加这句
set -sg escape-time 10
该 vim 对 python 程序能自动补全、提示函数参数，在普通模式下按 \g (先按\，再按g) 即可跳转到定义， \u 即可查找函数被调用的地点等。

由于使用来较大的文件，需要引入git lfs
https://git-lfs.github.com/
```
# TODO:  
- add tmux support.
- when apple the preference, backup the old one.
- update plugins for neo vim.
