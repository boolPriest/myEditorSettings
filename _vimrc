"-----------------------------------------------------------------------------------------
" Jabez Athota's vimrc.
" Description: settings for gvim and behaviours of the plugins.
" last edited : 27-02-2018
"-----------------------------------------------------------------------------------------

" ---------------------------- This is for Vundle Settings ---------------------------------
set nocompatible
" Set the default file encoding to UTF-8:
set encoding=utf-8
filetype off

" {{{ Vundle Functions and settings
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')

" ----------- All Plugin List --------------------
" Plugins that needs to be installed
Plugin 'VundleVim/Vundle.vim'

" Cpp->h and h->cpp
Plugin 'vim-scripts/a.vim'

" Bottom status line of Vim
Plugin 'vim-airline/vim-airline'

" Align the code
Plugin 'vim-scripts/Align'

" Auto closing 
Plugin 'jiangmiao/auto-pairs'
"Plugin 'cohama/lexima.vim'

" File searching
Plugin 'ctrlpvim/ctrlp.vim'

" Get the diff of Directories
Plugin 'will133/vim-dirdiff'

" colours
"Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" Gundo
Plugin 'sjl/gundo.vim'

" Indent guides enable
Plugin 'nathanaelkane/vim-indent-guides'

" Commenting in source files
Plugin 'scrooloose/nerdcommenter'

" Tab completion of words when searching
Plugin 'vim-scripts/SearchComplete'

" Saving Sessions
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" Marks
Plugin 'kshenoy/vim-signature'

" Snippets
Plugin 'honza/vim-snippets'

Plugin 'SirVer/ultisnips'

" Enhanced highlight for cpp and C
Plugin 'justinmk/vim-syntax-extra'
"Plugin 'octol/vim-cpp-enhanced-highlight'

" Plugin for Tabs
Plugin 'gcmt/taboo.vim'

" File navigation
Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree'

" For auto completion
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'        " For Python

" ---------------- End of Plugin List ---------------

call vundle#end()
filetype plugin indent on 
"}}}

"----------------------------------- PLUGIN SETTINGS ---------------------------------
"{{{ Clang-complete settings
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang-3.5.so.1'
"}}}
