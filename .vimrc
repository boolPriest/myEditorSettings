"-----------------------------------------------------------------------------------------
" Jabez Athota's vimrc.
" Description: settings for gvim and behaviours of the plugins.
" last edited : 24-05-2019
"-----------------------------------------------------------------------------------------

" ---------------------------- This is for Vundle Settings ---------------------------------
set nocompatible
" Set the default file encoding to UTF-8:
set encoding=utf-8
filetype off

" {{{ Vundle Functions and settings
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle')

" ----------- All Plugin List --------------------
" Plugins that needs to be installed
Plugin 'VundleVim/Vundle.vim'

" Cpp->h and h->cpp
Plugin 'vim-scripts/a.vim'
" {{{ a.vim: for switching b/w header files and source files
map ,h :AT<CR>
map ,g :IHT<CR>
"}}}


" Bottom status line of Vim
Plugin 'vim-airline/vim-airline'
" {{{ Vim-Airline settings
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
"}}}


" Align the code
Plugin 'junegunn/vim-easy-align'

" Auto closing 
Plugin 'jiangmiao/auto-pairs'
"{{{ AutoPairs
let g:AutoPairsFlyMode            = 1
let g:AutoPairsShortcutToggle     = 'ð' " '<M-p>' (Alt + p)
let g:AutoPairsShortcutFastWrap   = 'å' " '<M-e>' (Alt + e)
let g:AutoPairsShortcutJump       = 'î' " '<M-n>' (Alt + n)
let g:AutoPairsShortcutBackInsert = 'â' " '<M-b>' (Alt + b)
" New AutoPairs
"let g:AutoPairs['<']='>'
"}}}

"Plugin 'cohama/lexima.vim'

" File searching
Plugin 'ctrlpvim/ctrlp.vim'
"{{{ Ctrl-P settings
let g:ctrlp_cmd                 = 'CtrlPMixed'
let g:ctrlp_root_markers        = ['.JB_PROJ_ROOT']
let g:ctrlp_by_filename         = 1 " Search by File name
let g:ctrlp_switch_buffer       = 'Et' " Jump to the tab if already open
let g:ctrlp_match_window        = 'bottom,order:tbb,min:1,max:20,results:20'
let g:ctrlp_show_hidden         = 1
let g:ctrlp_open_new_file       = 't' " open new file in a tab
let g:ctrlp_tabpage_position    = 'ac'  " open the tab after current tab
let g:ctrlp_open_multiple_files = 'tj' " open in new tabs and jump to first tab
" let g:ctrlp_user_command      = 'dir %s /-n /b /s /a-d'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"let g:ctrlp_working_path_mode  = 'c'
" below setting is ignored as we are using custom listing
" let g:ctrlp_custom_ignore     = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Use AG over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
"}}}


" Get the diff of Directories
Plugin 'will133/vim-dirdiff'

" colours
"Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
"{{{ Gruvbox plugin settings
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italicize_strings='1'

function ToggleBGColor()  
    if &background=="dark"
        set background=light
        " Color of the cursor
        highlight Cursor guifg=Red guibg=White
        highlight iCursor guifg=White guibg=Red
    else
        set background=dark
        " Color of the cursor
        highlight Cursor guifg=Red guibg=White
        highlight iCursor guifg=White guibg=Red
    endif
endfunction
"}}}


" Gundo - For undoing
Plugin 'sjl/gundo.vim'
"{{{ gUndo settings 
" nnoremap <C-F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
"}}}

" Indent guides enable
Plugin 'nathanaelkane/vim-indent-guides'
"{{{ Indent-Guides
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
"}}}


" Commenting in source files
Plugin 'scrooloose/nerdcommenter'
"{{{ NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}


" Tab completion of words when searching
Plugin 'vim-scripts/SearchComplete'

" Saving Sessions
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
"{{{ Save Sessions settings 
let g:session_default_name = 'myDefaultSession'
let g:session_default_overwrite = 1
let g:session_extension = '.session'
let g:session_autoload = 'yes'
let g:session_autosave = 'prompt'
"}}}


" Marks
Plugin 'kshenoy/vim-signature'
"{{{ Signature settings (For managing marks)
" nnoremap <silent> <Leader>m :SignatureToggle<CR>
"}}}


" Snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
" README : Change the setting in maps_keys.vim in ultisnips folder
"{{{ Ultisnips Settings
let g:UltiSnipsExpandTrigger = "<c-j>"
"}}}


" Enhanced highlight for cpp and C
Plugin 'justinmk/vim-syntax-extra'
"Plugin 'octol/vim-cpp-enhanced-highlight'

" Plugin for Tabs
Plugin 'gcmt/taboo.vim'
"{{{ Taboo for tab line
let taboo_tab_format = "%N.%W => %f %m"
let taboo_modified_tab_flag = "[+]"
"}}}


" File navigation
" Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
"{{{ NerdTree settings 
let NERDTreeShowBookmarks = 1
let NERDTreeSortOrder = ['\/$', '\.cpp$', '\.c$', '\.h$', 'Make', '[[-timestamp]]', '*']
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen = 1
" }}}


" For auto completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'davidhalter/jedi-vim'        " For Python
"{{{ YCM settings
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_disable_for_files_larger_than_kb = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_complete_in_comments = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"}}}
 

" For Tags
" Plugin 'universal-ctags/ctags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'

"{{{ Gutentags
" let g:gutentags_define_advanced_commands = 1

let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

let g:gutentags_project_root = ['.JB_PROJ_ROOT']

" tags file extension
let g:gutentags_ctags_tagfile = '.tags'

" set the modules for tags
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" set the dir where tags has to be placed
let s:vim_tags = expand('~/.vim/_tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_exclude = ['*.html', '*.css', '*.js', '*.xml', 'Makefile',
                                \ '*.mk', '*.config', '*.ld', '*.s', '*.in', '*.asm',
                                \ '*.json', '*.m4', '*.am', '*.sh', '*.script', 
                                \ 'configure', 'libtool']

let g:gutentags_ctags_extra_args = ['--fields=+niaz', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+defghlmpstuvxzL']
" let g:gutentags_ctags_extra_args += ['--exclude=*.html, *.css, *.js']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_plus_nomap = 1
let g:gutentags_plus_switch = 1

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"}}}


Plugin 'skywind3000/vim-preview'
"{{{ vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
" see the function signature
noremap <C-F4> :PreviewSignature!<cr>
inoremap <C-F4> <c-\><c-o>:PreviewSignature!<cr>

" see the tag under cursor
noremap <F4> :PreviewTag!<cr>
inoremap <F4> <c-\><c-o>:PreviewTag!<cr>

"scroll the preview window without leaving current window
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
"}}}
" Plugin 'simplyzhao/cscope_maps.vim'

" For Syntax checking
"Plugin 'neomake/neomake'

" For IDE
" Plugin 'wesleyche/SrcExpl'
" {{{ Edit these settings in srcexpl.vim file
"let g:SrcExpl_prevDefKey="<F7>" 
"let g:SrcExpl_nextDefKey="<F8>" 
"}}}

" Plugin 'vim-scripts/taglist.vim'
" Plugin 'wesleyche/Trinity'

" Git support
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'
Plugin 'airblade/vim-gitgutter'
"{{{ git-gutter
" Disable real time gitgutter updates
autocmd! gitgutter CursorHold,CursorHoldI

" Update gitgutter on write
autocmd BufWritePost * GitGutter
"}}}


" ---------------- End of Plugin List ---------------
call vundle#end()
filetype plugin indent on 
"}}}

"----------------------------------- PLUGIN SETTINGS ---------------------------------
"{{{ Clang-complete settings
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang-3.5.so.1'
"}}}
