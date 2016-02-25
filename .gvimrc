"-----------------------------------------------------------------------------------------
" Jabez Athota's gvimrc.
" Description: settings for gvim and behaviours of the plugins.
" last edited : 09 February, 2016.
"-----------------------------------------------------------------------------------------

" {{{ All misc settings 
set bs=2                " set back space
set autowrite           " write to buffer when exiting
au FileType * setl fo-=cro      " for disabling auto comments
set cursorline          " highlight Current line
set autochdir           " always switch to the current file directory.
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

"{{{ Folding of the code
"set foldenable
"set foldlevelstart=10
set foldmethod=manual    " folding Stuffs
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

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
syntax on
endif

" set the colorscheme 
syntax enable
set background=dark " change background to light for light BG
colorscheme solarized

" No buffers and swap files
"set nobackup
"set noswapfile

" Set the backup and swap directory
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Show the matching brace
set showmatch
set matchtime=1

" Ignore case when searching
" Smartcasing when capital letters are involved
set ignorecase
set smartcase
"set incsearch

" To load and recognize the plugins
filetype on
filetype plugin on


" Color of the cursor
highlight Cursor guifg=Black  guibg=White
highlight iCursor guifg=white guibg=steelblue

" History options
set history=100
set undolevels=200

" This is for opening Vim in Maximized mode.
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 
  set columns=999
endif

" Create Blank Newlines and stay in Normal mode 
nnoremap <silent> zj o<Esc> 
nnoremap <silent> zk O<Esc> 

" Edit vimrc \ev 
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR> 

" Edit gvimrc \gv 
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Search mappings: These will make it so that going to the next one in a 
" Search will center on the line it's found in.  
map N Nzz 
map n nzz

" {{{ Set the tab width (indent width) for the files - IndentWidth = 4 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}}}

" For indenting the files
au BufNewFile,BufRead *.py,*.cpp,*.h,*.c set autoindent 
au BufNewFile,BufRead *.py,*.cpp,*.h,*.c set smartindent  

" set tab settings for other files
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2 
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2 

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h,*.cpp set fileformat=unix

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Set the default file encoding to UTF-8:
set encoding=utf-8

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
"autocmd BufRead *.txt set wrap
"autocmd BufRead *.log set wrap
autocmd BufRead *.xml set nowrap
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
autocmd FileType c,cpp,h,xml,py autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"}}}

"----------------------------------- ALL PLUGIN SETTINGS ---------------------------------
" {{{ a.vim: for switching b/w header files and source files 
map ,h :AT<CR>
map ,g :A<CR>
"}}}

"{{{ NERD_tree.vim: NerdTree settings 
let NERDChristmasTree = 1 
let NERDTreeShowBookmarks = 1 
let NERDTreeShowLineNumbers = 1 
let NERDTreeWinPos = "left" 
let NERDTreeQuitOnOpen = 1 
"}}} 

" {{{ Vim-Airline settings
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
"}}}

"{{{ Ctrl-P settings
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"}}}

"{{{ Save Sessions settings 
set sessionoptions-=help
let g:session_default_name = 'myDefaultSession'
let g:session_default_overwrite = 1
let g:session_extension = '.session'
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
"}}}

"{{{ gUndo settings 
nnoremap <C-F5> :GundoToggle<CR>
"}}}

"{{{ Signature settings (For managing marks)
nnoremap <silent> <Leader>m :SignatureToggle<CR>
"}}}

