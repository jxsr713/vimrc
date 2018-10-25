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


########ctag
f6功能需要ctag的zhichi
一.安装
sudo apt-get install ctags
二.建立tags索引文件
cd 代码目录：ctags -R *
指令执行完后出现tags文件
三./etc/vim/vimrc文件底部增加：
set tags=..../tags
四.使用方法：
  1.vim -t xxx: 打开定义xxx的文件，命令行模式
  2.“：ts”命令就能列出一个列表供用户选择。
  3.“：tp”为上一个tag标记文件。
  4.“：tn”为下一个tag标记文件。
  5.光标放到变量名函数名上，按下[Ctrl]+]，这样就直接跳到变量函数定义处。
  6.[Ctrl]+o/t 回到原处。
--------------------- 
作者：stn_lcd 
来源：CSDN 
原文：https://blog.csdn.net/stn_lcd/article/details/78107391 
版权声明：本文为博主原创文章，转载请附上博文链接！
