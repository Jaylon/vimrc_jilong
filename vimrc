""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run this .vimrc script first time you should do: 
" .vimrc file for personal use
"
" Support:
" 1. Gtags - Global
" 2. Ctags + Cscope
" 3. bundle
" 4. airline, tools bar scheme
" 5. gruvbox, vim color scheme
" 6. NERD Tree
" 7. Tag List
" 8. Vim syntax highlighting for c, bison, flex
" 9. C Syntax Highlighting Extension for Vim
" 
"---------------
" First time to run this .vimrc script should do: 
" 1. Backup original vim files. 
" $ mv ~/.vim ~/vim_bk && mv ~/.vimrc vimrc_bk
" 
" 2. Create new folder
" $ mkdir -p ~/.vim/plugin && mkdir -p ~/.vim/bundle
" 
" 3. close this file to local.
" $ git clone https://github.com/Jaylon/vimrc_jilong.git
" 
" 4. Change name
" $ mv vimrc_2019 ~/.vimrc
" 
" 5. Set up Vundle:  
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 
" 6 Launch vim and run :PluginInstall
" 
" 7 If you want to use global - Gtags
" 
" Method 1 only for Ubuntu:  
" $ sudo apt-get install global
" $ cp /usr/share/vim/addons/plugin/gtags*.vim ~/.vim/plugin
" 
" Method 2:
" $ wget https://ftp.gnu.org/pub/gnu/global/global-6.6.4.tar.gz
" $ uncompress tar ball, cd global-6.6.3, and then see INSTALL
" $ ./configure
" $ sudo make && make install
" $ mkdir ~/.vim/plugin
" $ cp gtags.vim gtags-cscope.vim ~/.vim/plugin 
" 
" 8. Vim syntax highlighting for c, bison, flex
" git clone git@github.com:justinmk/vim-syntax-extra.git
" cp vim-syntax-extra/after ~/.vim/ -rf
" cp vim-syntax-extra/plugin/*.vim  ~/.vim/plugin
" DO NOT RECOMMEND. USE 9th.
"
" 9. C Syntax Highlighting Extension for Vim
" git clone git@github.com:agfline/c-syntax.vim.git
" Simply put the c.vim file in ~/.vim/after/syntax/, and make sure you have syntax on in your ~/.vimrc file.
" This 9th is better than above 8th. Recommend.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置vi兼容性，设置为不兼容以避免vi限制
set nocompatible

" 默认显示行号
set nu

" 使用空格代替tab
" 设置（软）制表符宽度为4, 即空格数为4
" 设置（自动）缩进的空格数为4
"set expandtab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set encoding=utf-8

" for kernel community
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set encoding=utf-8

" 设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent

" 设置 使用 C/C++ 语言的自动缩进方式：
set cindent

" 智能缩进
set smartindent

" 语法高亮
syntax enable
syntax on
" vim皮肤

" 配色方案调整, 颜色编码参见:Xter_256color
function s:SetCursorLine()
	set cursorline
	" 高亮当前行, 设置ctermbg-当前行背景色
	hi cursorline cterm=none ctermbg=236 ctermfg=NONE
	" 高亮被搜索或匹配的字符
	hi Search cterm=none ctermbg=172 ctermfg=233
	" 设置行号颜色
	hi LineNr ctermfg=241
	" 设置当前行行号颜色
	hi CursorLineNr ctermfg=214 ctermbg=NONE
	" 设置注释字符的颜色
	hi Comment ctermfg=6
	hi Normal ctermfg=253
endfunction
autocmd VimEnter * call s:SetCursorLine()

"map Q gq
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  "set autoindent		" always set autoindenting on

endif " has("autocmd")

"在状态栏显示正在输入的命令
set showcmd

"用<F2>开启/关闭行号显示:
"nnoremap <F2> :set nonumber!<CR>

" 为了方便复制, 将paste模式开关指定为<F3>
set pastetoggle=<F3>

" 用<F5>开启/关闭拼写检查
"nnoremap <F5> :set spell!<CR>

" :set foldcolumn=0<CR>

" 在终端下打开256色
set t_Co=256

" 搜索的时候实时显示结果
set incsearch

" 高亮搜索结果
set hlsearch

" 设置搜索时忽略大小写  
set ignorecase  

" 当搜索的时候尝试smart  
"set smartcase  

 " 使用Backspace直接删除tab  
 set smarttab  

 " 设置打开文件的编码格式  
 set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  

 set helplang=cn 


 " use UNIX as the standard file type
 set ffs=unix,dos,mac
 " Set the file formant as unix
 set fileformat=unix

" 禁止循环查找
"set nowrapscan

"  设置匹配模式，显示匹配的括号
set showmatch

" 文件类型自动识别, Vundle要求必须为off
" filetype on
filetype plugin on
filetype plugin indent on

" 智能补全
"set completeopt=longest,menu

" 设置历史记录为50条
set history=50

" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
" set laststatus=2

" 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
set ruler

" 括号引号补全
"inoremap ( ()<ESC>i
inoremap { {<CR>}<ESC>O
"inoremap [ []<ESC>i

" 折叠设置
set foldmethod=syntax " 用语法高亮来定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码
" set foldcolumn=5 " 设置折叠栏宽度

" 映射ctrl+j为向下滚动一行, ctrl+k为向上滚动一行
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

" 映射ctrl+n为取消高亮
nnoremap <C-N> :nohl<CR>

" 映射m为移动到当前行的中部
" nnoremap m :call cursor(0, len(getline('.'))/2)<CR>

" 映射m为移动到当前光标与行尾的中部, 行内二分跳转
 nnoremap m :call cursor(0 , col('.')+(len(getline('.'))- col('.'))/2)<CR>

" vim中复制到系统剪切板, 需要apt-get install vim-gnome
" place yanked text into the global clipboard, and paste from the global clipboard
set clipboard=unnamedplus

" High light trailing whitespace 高亮多余的尾空格
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufWritePre * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufWritePre * if &ft == 'help' | match none /\s\+$/ | endif
" 删除行尾多余空格 (trailing white space)
nnoremap tw :%s/\s\+$//e<CR>

" makeprg设置
autocmd FileType c set makeprg=gcc\ -Wall\ -o\ %<\ %
autocmd FileType cpp set makeprg=g++\ -Wall\ -o\ %<\ %

" 每行80字符提示线
" VIM 7.3+ has support for highlighting a specified column.
if exists('+colorcolumn')
"    let &colorcolumn='72,80'
"    let &colorcolumn='80'
"    set colorcolumn=72
else
    " Emulate
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
" 80字符提示线颜色, 需要在colorscheme后面方可生效
"hi ColorColumn ctermbg=black guibg=NONE

" 将ejs文件高亮当做html来处理
" au BufNewFile,BufRead *.ejs set filetype=html
"au BufNewFile,BufRead *.json set filetype=javascript
"set list
"set listchars=tab:<-,trail:-
"syntax match ErrorMsg /\%>80v.\+/

"-------------------------plugin setting-------------------------------------
" leader键
"let mapleader=","
"let g:mapleader=","

" Vundle设置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'vim-scripts/winmanager'
" Plugin 'vim-scripts/a.vim'
" ctrlp: Find files under current folder. 
"Plugin 'kien/ctrlp.vim'
" Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'rdnetto/YCM-Generator'
"Plugin 'scrooloose/syntastic'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 设置VIM 颜色主题
" VIM Color Scheme as "Solarized"
let g:solarized_termcolors=256
let g:solarized_termtrans = 0
let g:solarized_degrade = 1 
let g:solarized_bold = 0 
let   g:solarized_underline = 0 
let g:solarized_italic = 0 
let g:solarized_contrast = "high"
let g:solarized_visibility= "low"
"set background=dark
"colorscheme solarized

" VIM Color Scheme as "Gruvbox"
let g:gruvbox_bold = 0
let g:gruvbox_italic = 0
let g:gruvbox_underline = 0
let g:gruvbox_undercurl = 0
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"
set background=dark
colorscheme gruvbox
"autocmd BufRead,BufNewFile * nested colorscheme gruvbox

" WinManager设置
" NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
"nmap <silent> <F4> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
"nnoremap wm :WMToggle<CR>
" 窗口布局
let g:winManagerWindowLayout='NERDTree|TagList'
"let g:winManagerWindowLayout='TagList'
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=25
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0
" Open winmanager auto
let g:AutoOpenWinManager=1

" NERDtree设置
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
 let NERDTreeMouseMode=2
" 是否默认显示书签列表
 let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
" let NERDTreeShowHidden=1
" 是否默认显示行号
" let NERDTreeShowLineNumbers=1
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='right'
" 窗口宽
let NERDTreeWinSize=20

"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.o$', '\.a$', '\.so$', '\.d$', '\.pm$', '\.map$',]  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
"Making it prettier
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
nnoremap nerd :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"当NERDTree为剩下的唯一窗口时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeToggle") && b:NERDTree.isTabTree()) | q | endif

" taglist设置
let Tlist_Show_One_File=1 " 0为同时显示多个文件函数列表,1则只显示当前文件函数列表
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口，则退出vim
let Tlist_Auto_Update=1            "Automatically update the taglist to include newly edited files.
"把taglist窗口放在屏幕的右侧，缺省在左侧
"let Tlist_Use_Right_Window=1
"显示taglist菜单
let Tlist_Show_Menu=1
"启动vim自动打开taglist
let Tlist_Auto_Open=1
map <F1> :TlistToggle<CR>


" ctags
" ctags, 指定tags文件的位置,让vim自动在当前或者上层文件夹中寻找tags文件
" 添加系统调用路径

" Cscope 设置
"set tags=$PWD/tags
"cs add $PWD/cscope.out
"if filereadable("cscope.out")
"	cs add cscope.out
"endif

" 手动刷新tags(含cscope)
nnoremap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR>
" 设置快捷键<F4>, 添加当前目录下的cscope.out文件
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"对:cs find c等Cscope查找命令进行映射
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" 设定是否使用 quickfix 窗口来显示 cscope 结果
"set cscopequickfix=s-,c-,d-,i-,t-,e-
" QuickFix open and close
"nnoremap <F11> :copen<CR>
nnoremap <F12> :cclose<CR>

" QucikFix next and prev
nnoremap <F9> :cn<CR>
nnoremap <F10> :cp<CR>

" gtags configuration: Add global - gtags plugin support
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

"gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let Gtags_Auto_Map = 1



" airline设置
set laststatus=2
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

"设置主题
let g:airline_theme='luna'
"let g:airline_theme='sol'
" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 0
" the separator used on the left side
" let g:airline_left_sep='>'
let g:airline_left_sep=''
" the separator used on the right side
" let g:airline_right_sep='<'
let g:airline_right_sep=''
" enable spell detection
let g:airline_detect_spell=1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前高亮buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>

" Bbye设置
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>

" ctrlp 设置
let g:ctrlp_open_multiple_files = 'ijr'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|bmp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_files=0

" syntastic 设置
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '►'
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'


" You Complete Me
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>ja :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap ce :YcmDiags<CR>
" 
" YCM-Generator
" nnoremap yg :YcmGenerateConfig<CR>

" Add full file path to your existing statusline
set laststatus=2
set statusline+=%f


