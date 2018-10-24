" auto load all plugins in vim bundle
" 关闭兼容模式
set nocompatible

" 开启文件类型侦测
" filetype on
filetype off                   " required! 

syntax on
filetype plugin indent on     " required!
" 根据侦测到的不同类型加载对应的插件
" filetype plugin on

"  加载插件
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
Bundle 'taglist.vim' 


" 高亮当前行，以及列
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 定义快捷键到行首(0)和行尾($)
"nmap LB 0
"nmap LE $

"""""""""""""""""""""""""""""""""""""""""""""""""
" 快速退出操作
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>

" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

"****************************************
"窗口移动操作
" 依次遍历子窗口
nnoremap nw <C-W><C-W>

" 跳转至右方的窗口
nnoremap <Leader>ll <C-W>l

" 跳转至左方的窗口
nnoremap <Leader>rr <C-W>h

" 跳转至上方的子窗口
nnoremap <Leader>uu <C-W>k

" 跳转至下方的子窗口
nnoremap <Leader>dd <C-W>j

" 
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 修改一个文件后，自动进行备份，备份的文件名为原文件名加“~“后缀
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file (restore to previous version)
"  set undofile          " keep an undo file (undo changes after closing)
endif

"""""""""""""""added by zhwh""""""""""""""
augroup vimrcEx
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    "   " Don't do it for commit messages, when the position is invalid, or
    "   when
    "     " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  " Cucumber navigation commands
    autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
    autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
  " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile Appraisals set filetype=ruby
    autocmd BufRead,BufNewFile *.md set filetype=markdown
  
    " Enable spellchecking for Markdown
    autocmd FileType markdown setlocal spell
  
    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=160
augroup END

""""""""""""""lood plugin"""""""""""""""""""
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
"""""""""""""""""""""""""""""""""""""""""

"":colorscheme putty from yuanrui
:colorscheme elflord
"""""""""""added by zwh"""""""""""""""""""
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0


" Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
"
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
""""""""""""""""""""""""""""""""""""""""""

"""""显示行"""""""""""""""""""""
set nu

filetype on
syntax enable
set history=1000 
set background=dark
set autoindent
set smartindent
" 设置编辑时制表符占用空格数
set tabstop=4
" 将制表符扩展为空格
set expandtab
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=marker
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set hlsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""
"added by zwh
" 总是显示状态栏
set laststatus=2
set fileencodings=utf-8,gb18030,gbk,big5
set termencoding=utf-8
set encoding=utf8
set confirm
set statusline+=%{fugitive#statusline()}

set cindent
set shiftround
" set textwidth=80
set colorcolumn=+1
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick high light 
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy move
nmap s <Plug>(easymotion-s)



"set tags+=/ws-weihozha/sourcecode/insdiag/diag/tags
"set tags+=/ws-weihozha/insdiag-tmp/diag/tags
let Tlist_Ctags_Cmd='~/local/ctags/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1

" winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:persistentBehaviour=0
"let g:bufExplorerMaxHeight=30
nmap wf :FirstExplorerWindow<cr>
nmap wb :BottomExplorerWindow<cr>
nmap wm :WMToggle<cr>

" 显示/隐藏 MiniBufExplorer 窗口
" MiniBufferExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne=1
map <Leader>mb :MBEToggle<cr>
map mb :MBEToggle<cr>
" buffer 切换快捷键
" forward
map <Leader>ff :MBEbn<cr>
map ff :MBEbn<cr>
" backward
map bb :MBEbp<cr>
map <Leader>bb :MBEbp<cr>


" SelectBuf
nmap <unique> <silent> qq <Plug>SelectBuf

" BufExplorer
nmap tt :BufExplorer<cr>
nmap bs :BufExplorerHorizontalSplit<cr>
let g:bufExplorerDefaultHelp=0
let g:bufExplorerSortBy='mru'
let g:bufExplorerShowRelativePath=0
let g:bufExplorerSplitBelow=0
let g:bufExplorerSplitHorzSize=5

" cscope
":cs add /ws-ruyuan/insdiag/cscope.out /ws-ruyuan/insdiag
"nmap cs :cs add /ws-weihozha/sourcecode/insdiag/diag/cscope.out /ws-weihozha/insdiag/diag<cr>
"nmap cs :cs add /ws-weihozha/insdiag-tmp/diag/cscope.out /ws-weihozha/insdiag-tmp/diag<cr>
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR>

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""added by zhwh""""""""""""""""
" " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
let NERDChristmasTree=0
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>



let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状???
let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Ctags_Cmd='~/local/ctags/bin/ctags'

let g:tagbar_width=25
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
nmap <F4> :TlistToggle<CR>

" if has('mouse')
"    set mouse-=a
"endif

set mouse=a


map <F11> :call Do_CsTag()<CR>

set tags+=./tags

function Do_CsTag()

    if filereadable("tags")
        echo "delete tags"
        let tagsdeleted=delete("tags")
        if(tagsdeleted!=0)
           echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
           return
        endif
    endif
    
    if(executable('/home/weihozha/local/ctags/bin/ctags'))
        echo "Ctags -->"
        execute "!//home/weihozha/local/ctags/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
        ""!/home/weihozha/local/ctags/bin/ctags -R --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf * .<CR><CR>:TlistUpdate<CR>
        ""  nmap -hl :nohlsearch<CR>
    endif
    if has("cscope")
        echo "cscope"
        execute "cs kill -1"
    endif
    
    if filereadable("cscope.files")
        echo "cscope file"
        let csfilesdeleted=delete("./"."cscope.files")
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    
    if filereadable("cscope.out")
        let csoutdeleted=delete("./"."cscope.out")
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    
   if(executable('cscope') && has("cscope") )
        !find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.java" -o -name "*.cs" > cscope.files
        !cscope -b
        execute "normal :"
        if filereadable("cscope.out")
           exe "cs add cscope.out"
       endif
   endif

   return
   if(executable('cscope') && has("cscope") )
        echo "asdasdasdasdasdas"
        silent! execute "!find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.java" -o -name "*.cs" > cscope.files"
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
           execute "cs add cscope.out"
       endif
   endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""
