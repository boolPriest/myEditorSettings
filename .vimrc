"-----------------------------------------------------------------------------------------
" Jabez Athota's vimrc.
" Description: settings for gvim and behaviours of the plugins.
" last edited : 27-02-2018
"-----------------------------------------------------------------------------------------

" ---------------------------- This is for Vundle Settings ---------------------------------
set nocompatible
filetype off

" {{{ Vundle Functions and settings
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ----------- All Plugin List --------------------
" Plugins that needs to be installed
Plugin 'VundleVim/Vundle.vim'

" colours
"Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" File navigation
Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree'

" Commenting in source files
Plugin 'scrooloose/nerdcommenter'

" For auto completion
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'        " For Python

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" File searching
Plugin 'ctrlpvim/ctrlp.vim'

" Cpp->h and h->cpp
Plugin 'vim-scripts/a.vim'

" Align the code
Plugin 'vim-scripts/Align'

" Gundo
Plugin 'sjl/gundo.vim'

" Saving Sessions
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Marks
Plugin 'kshenoy/vim-signature'

" Tab completion of words when searching
Plugin 'vim-scripts/SearchComplete'

" Indent guides enable
Plugin 'nathanaelkane/vim-indent-guides'

" Auto closing 
Plugin 'jiangmiao/auto-pairs'
"Plugin 'cohama/lexima.vim'

" Plugin for Tabs
Plugin 'gcmt/taboo.vim'

" Get the diff of Directories
Plugin 'will133/vim-dirdiff'

" Bottom status line of Vim
Plugin 'vim-airline/vim-airline'

" Enhanced highlight for cpp and C
Plugin 'justinmk/vim-syntax-extra'
"Plugin 'octol/vim-cpp-enhanced-highlight'

" ---------------- End of Plugin List ---------------

call vundle#end()
filetype plugin indent on 
"}}}

"----------------------------------- PLUGIN SETTINGS ---------------------------------
"{{{ Clang-complete settings
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang-3.5.so.1'
"}}}

