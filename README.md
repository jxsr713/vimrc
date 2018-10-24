# vimrc
vim 的陪子文件和插件

插件及插件管理 Vunble
在Home目录创建~/.vim目录和.vimrc文件
Vunble作用：
更新，搜索，移除，vim插件
创建目录环境


git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
在.vimrc配置文件中添加vundle支持

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
也可以在.vimrc文件添加：
if filereadable(expand("~/.vimrc.bundles")) 
  source ~/.vimrc.bundles 
endif
然后创建 .vimrc.bundle 并添加：


filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
vim命令行输入：

:BundleInstall
