syntax enable
set nocompatible                         "去掉vi一致性模式，避免以前版本的一些bug和局限 
syntax on                                " 语法高亮
"au GUIEnter * simalt ~x                  " 启动后最大化
"winpos 250 100                           " 设定窗口位置
"set lines=35 columns=100                 " 设定窗口大小 
set shortmess=atI                        " 不显示那个援助乌干达儿童的提示
set nu                                   " 设置行号
"set guioptions-=T                        " 隐藏工具栏
"set guioptions-=m                        " 隐藏菜单栏
set ruler                                " 打开状态栏标尺
set cursorline                           " 突出显示当前行
set cursorcolumn                         " 高亮显示光标所在列
set nobackup                             " 从不备份
set noswapfile                           " 不生成交换文件
set ignorecase                           " 搜索忽略大小写
set hlsearch                             " 高亮显示搜索匹配到的字符串
set incsearch                            " 输入字符串就显示匹配点
set history=1000                         " 历史记录数
set guifont=Courier_New:h10:cANSI        " 设置字体
set showcmd                              " 输入的命令显示出来
set cmdheight=1                          " 命令行（在状态行下）的高度，设置为1 
set autoindent                           " 设置自动对齐(缩进)：即每行的缩进值与上一行相等
set autowrite                            " 自动把内容写回文件
set smartindent                          " 智能对齐方式
set tabstop=4                            " 设置制表符(tab键)的宽度
set softtabstop=4                        " 设置软制表符的宽度
set shiftwidth=4                         " (自动) 缩进使用的4个空格
set cindent                              " 使用 C/C++ 语言的自动缩进方式
set scrolloff=3                          " 光标移动到buffer的顶部和底部时保持3行距离
set autoread                             " 设置当文件被改动时自动载入
set ruler                                " 打开状态栏标尺
set matchtime=1                          " 匹配括号高亮的时间（单位是十分之一秒）
set showmatch                            " 高亮显示匹配的括号
set backspace=2                          " 使回格键（backspace）正常处理indent, eol, start等
set expandtab                            " 将新增的tab转换为空格。不会对已有的tab进行转换
set bsdir=buffer                         " 设定文件浏览器目录为当前目录
set hidden                               " 允许在有未保存的修改时切换缓冲区
set ambiwidth=double                     " 防止特殊字符号无法显示
"autocmd! bufwritepost _vimrc source %    " .vimrc修改之后自动加载(Windows)
autocmd! bufwritepost .vimrc source %   " .vimrc修改之后自动加载(Linux)
colorscheme onedark                       "配置主题，默认安装不包括graywh主题，大家可以使用desert主题
set foldenable                           " 允许折叠
set foldmethod=manual                    " 手动折叠
set iskeyword+=_,$,@,%,#,-               " 带有如下符号的单词不要被换行分割
set autochdir                            " 自动切换当前目录为当前文件所在的目录
set tags=tags;                           " 注意: set tags=tags;这一句的最后有一个分号, 这个分号是不能省略

nmap w :w!<CR>                           " 使用前导键加w来实现加速文件保存，来代替:w!加回车
nmap cS :%s/\s\+$//g<CR>:noh<CR>         " 常规模式下输入 cS 清除行尾空格 
nmap cM :%s/\r$//g<CR>:noh<CR>           " 常规模式下输入 cM 清除行尾 ^M 符号

"cscope相关的快捷键映射
nmap ff <c-]>
"s:查找即查找C语言符号出现的地方
nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
"g:查找函数、宏、枚举等定义的位置
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
"c:查找光标下的函数被调用的地方
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: 查找指定的字符串出现的地方
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
"e:egrep模式查找,相当于egrep功能
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: 查找文件名,相当于lookupfile
nmap fn :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: 查找当前文件名出现过的地方
nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
"d: 查找本当前函数调用的函数
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>

" -----------------------------------------------------------------------------  
"  < 编码配置 >  
" -----------------------------------------------------------------------------  
" 必须设置成utf-8，否则airline箭头会显示乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cuijiantao/change-colorscheme'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

let mapleader=','

" -----------------------------------------------------------------------------  
"  < ctrlp >
" -----------------------------------------------------------------------------  
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" -----------------------------------------------------------------------------  
"  < change-colorscheme >
" -----------------------------------------------------------------------------  
map <F10> :NextColorScheme<CR>
imap <F10> <ESC> :NextColorScheme<CR>
map <F9> :PreviousColorScheme<CR>
imap <F9> <ESC> :PreviousColorScheme<CR>

" -----------------------------------------------------------------------------  
"  < Airline settings  >  
" -----------------------------------------------------------------------------  
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置顶部tabline栏符号显示"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"

"设置切换Buffer快捷键"
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>

set laststatus=2

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
set guifont=Consolas\ for\ Powerline\ FixedD:h11

""设置状态栏符号显示，下面编码用双引号"
"let g:Powerline_symbols="fancy"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = "\u2b80"
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"
"==========================================

" -----------------------------------------------------------------------------  
"  < The-NERD-tree 插件配置 >  
" -----------------------------------------------------------------------------  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>

" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width=30                           "设置窗口宽度
" let g:tagbar_left=1                           "在左侧窗口中显示
map <F4> :TagbarToggle<CR>
imap <F4> <ESC> :TagbarToggle<CR>

" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >
" -----------------------------------------------------------------------------
" .h -> .cpp or .cpp -> .h
nnoremap <silent> <F2> :A<CR>

" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" -----------------------------------------------------------------------------
"  < YouCompleteMe 插件配置 >
" ----------------------------------------------------------------------------- 
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
" 自动补全配置,让Vim的补全菜单行为与一般IDE一致(参考VimTip1228) 
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息  
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0 
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" 开启 YCM 基于标签引擎 
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全  
let g:ycm_seed_identifiers_with_syntax=1
" 手动调用补全,(默认是 <C-Space>)
let g:ycm_key_invoke_completion = '<C-a>'
nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>o :YcmCompleter GoToInclude<CR>
" 在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
" 在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  
" 注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  

