"-----------------------------------------------------------------------------------------
" Jabez Athota's gvimrc.
" Description: settings for gvim and behaviours of the plugins.
" last edited : 24-05-2019
"-----------------------------------------------------------------------------------------

" {{{ All misc settings 
" set nocompatible
set bs=2                " set back space
set autowrite           " write to buffer when exiting
au FileType * setl fo-=cro      " for disabling auto comments
set cursorline          " highlight Current line
"set autochdir           " always switch to the current file directory.
autocmd BufEnter * silent! lcd %:p:h
set autoread            " set to auto read when a file is changed from outside.
set nolazyredraw        " set no lazyredraw
set number              " show number of the line when opening gvim
set showtabline=2       " always show tab line
set laststatus=2        " always show the status line
set report=1            " tell us when anything is changed using :....
set shortmess=aOstT     " shortens messages to avoid 'press a key' prompt
set showcmd             " show the command being typed
set wildmenu            " better command line completion

"set ch=1		        " Make command line one lines high
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"set showmode            " show the current mode
"set ruler               " set to show the row and coloumn in bottom of vim
"colorscheme ir_black    " set the color scheme to load by default
"set lazyredraw         " for faster efficiency when macros are using
"}}}

" To load and recognize the plugins
filetype on
filetype plugin on

"{{{ Folding of the code
" filetype plugin indent on
set nofoldenable
set foldlevelstart=10
" set foldmethod=marker  " folding Stuffs

autocmd FileType c set foldmethod=syntax
autocmd FileType cpp set foldmethod=syntax
autocmd FileType python set foldmethod=indent
autocmd FileType sh set foldmethod=marker
autocmd FileType java set foldmethod=marker
autocmd FileType javascript set foldmethod=marker
"autocmd FileType html set foldmethod=indent
"autocmd FileType ruby set foldmethod=syntax
"autocmd FileType actionscript set foldmethod=marker
"autocmd FileType cs set foldmethod=syntax
"autocmd FileType css set foldmethod=marker
"autocmd FileType go set foldmethod=marker
"autocmd FileType objc set foldmethod=marker
"autocmd FileType objcpp set foldmethod=marker
"autocmd FileType php set foldmethod=indent
"autocmd FileType thrift set foldmethod=marker
"autocmd FileType tex set foldmarker={{{,}}} foldmethod=marker

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"}}}

"{{{ Tab navigation like firefox 
nmap <F2> :tabprevious<cr>
nmap <F3> :tabnext<cr>
map <F2> :tabprevious<cr>
map <F3> :tabnext<cr>
imap <F2> <ESC>:tabprevious<cr>i
imap <F3> <ESC>:tabnext<cr>i
nmap ,t :tabnew<cr>
"}}}

"{{{ Window navigation between split windows
nmap <F1> :wincmd w<cr>
map <F1> :wincmd w<cr>
imap <F1> <ESC>:wincmd w<cr>i
"}}} 

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
syntax on
endif

" set the colorscheme 
"-----------------------------------
"{{{
syntax enable
colorscheme gruvbox
set background=dark

" Color of the cursor
highlight Cursor guifg=Red guibg=White
highlight iCursor guifg=White guibg=Red

" map <F5> :call ToggleThisBG()<CR>
"}}}

" No buffers and swap files
"set nobackup
"set noswapfile

" Set the backup and swap directory
set undodir=~/.vim/_undo//
set backupdir=~/.vim/_backup//
set directory=~/.vim/_swp//

" Show the matching brace
set showmatch
set matchtime=1

" Ignore case when searching
" Smartcasing when capital letters are involved
set ignorecase
set smartcase
"set incsearch

" History options
set history=100
set undolevels=200

" This is for opening Vim in Maximized mode.
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set guifont=Inconsolata\ 16
  set lines=1024
  set columns=1024
endif

" Create Blank Newlines and stay in insert mode 
nnoremap <silent> zj o<ESC>
nnoremap <silent> zk O<ESC>

" Edit vimrc \ev 
nnoremap <silent> <Leader>fv :tabnew<CR>:e ~/.vimrc<CR> 

" Edit gvimrc \gv 
nnoremap <silent> <Leader>fg :tabnew<CR>:e ~/.gvimrc<CR>

" Open the help file \hv
nnoremap <silent> <Leader>fh :tabnew<CR>:e ~/.vim/_commands.txt<CR>

" Search mappings: These will make it so that going to the next one in a 
" Search will center on the line it's found in.  
map N Nzz
map n nzz

" {{{ Set the tab width (indent width) for the files - IndentWidth = 2 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"}}}

" For indenting the files
au BufNewFile,BufRead *.py,*.cpp,*.h,*.c set autoindent 
au BufNewFile,BufRead *.py,*.cpp,*.h,*.c set smartindent  

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=Grey

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp set textwidth=80
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp highlight ColorColumn ctermbg=black
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp set colorcolumn=80

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h,*.cpp set fileformat=unix

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Set the default file encoding to UTF-8:
" set encoding=utf-8

" {{{ For search highlighting 
set hlsearch
function ToggleHLSearch()
       if &hlsearch
            set nohlsearch
       else
            set hlsearch
       endif
endfunction
map <silent><S-h> :call ToggleHLSearch()<CR>
"}}}

" {{{ Turn off toolbar, menubar and righthand scrollbar 
" CTRL+F11 to toggle the menu bar 
set guioptions-=T
set guioptions-=m
set guioptions-=r

nnoremap <C-F11> :if &go=~#'m'<Bar>set go-=mT<Bar>else<Bar>set go+=mT<Bar>endif<CR>
"}}}

" {{{ Set Line Break & wrap setting for different file types 
set linebreak 
set wrap

"Dont wrap the text for programming files.
autocmd BufRead *.txt set nowrap
autocmd BufRead *.log set nowrap
autocmd BufRead *.xml set nowrap

" Toggle wrap 
function ToggleWrap()
 if (&wrap == 1)
    set nowrap
 else
   set wrap
 endif
endfunction

map ,w :call ToggleWrap()<CR>
"}}}

" {{{ For no sounds and blinking. No annoying error noises 
set noerrorbells
set visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"}}}

" {{{ Map for capital letters when pressed mistakenly 
map :W :w
map :WQ :wq
map :wQ :wq
map :Q :q
"}}}

" Close quick fix or location list window
noremap ,q :ccl <bar> lcl<CR>

" {{{ cut and copy options
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
"}}}

" {{{ Remove all spaces from end in each line
fun! <SID>StripTrailingWhitespaces()
    let _s=@/
    let line = line(".")
    let column = col(".")
    %s/\s\+$//e
    call cursor(line, column)
    let @/=_s
endfun

"Bind RemoveSpaces to autocommand
autocmd FileType c,cpp,h,xml,py,log autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"}}}

" {{{ Set tags to work with vim.
" set tags+=~/vimfiles/tags/cpp_tags
" set tags+=~/vimfiles/tags/gl_tags
" set tags+=~/vimfiles/tags/vulkan_tags

" build tags of your own project with Ctrl-F12
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+liaSmt --extra=+q -I _GLIBCXX_NOEXCEPT .<CR>
"}}}

"----------------------------------- ALL PLUGIN SETTINGS ---------------------------------
" Refer to .vimrc
