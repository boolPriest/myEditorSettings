set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" Plugins that needs to be installed
Plugin 'VundleVim/Vundle.vim'

" colours
Plugin 'altercation/vim-colors-solarized'

" plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/SearchComplete'
Plugin 'nathanaelkane/vim-indent-guides'

" Need Lua for these below plugins
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

" Not supported in office windows machine
"Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
