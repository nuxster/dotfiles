""" Plugins
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""
" This plugin highlights the line of the cursor, only in the current window. The colors change according to the mode (normal/insert)
Plugin 'miyakogi/conoline.vim.git'
let g:conoline_auto_enable = 1
"""
" Status and tab modern bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
"""
" File manager
Plugin 'preservim/nerdtree'
map <F12> :NERDTreeToggle<CR>
Plugin 'ryanoasis/vim-devicons'
"""
" Plugin for work with git
Plugin 'tpope/vim-fugitive'
"""
" Code folding
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
"""
" Code auto-complete
"
" cd ~/.vim/bundle/YouCompleteMe
" apt install build-essential cmake python3-dev
" python3 install.py --clang-completer --js-completer
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""
" Check syntax
Plugin 'vim-syntastic/syntastic'
"""
" Check PEP8
Plugin 'nvie/vim-flake8'
"""
" Code comments
"
" gcc - comment line
" gc in visual mode - comment select block
Plugin 'tomtom/tcomment_vim'
"""
" Multiple cursors
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'mg979/vim-visual-multi'
"""
" Color scheme
Plugin 'morhetz/gruvbox'
" cp -R ~/.vim/bundle/gruvbox/colors/ ~/.vim/
set background=dark
color gruvbox


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


""" Other options

" enable mouse use in all modes
set mouse=a
" syntax highlighting
syntax enable
" show line numbers 
set number
" Set tab to 4 spaces
set ts=4
" indent on line break while writing code
set autoindent
" converting tabs to spaces 
set expandtab
" when using the >> or << commands, shift lines by 4 spaces 
set shiftwidth=4
" highlight the line the cursor is on 
"set cursorline
"hi CursorLine ctermbg=235
" show paired parenthesis for [] {} and () 
set showmatch
" line ending format
set fileformat=unix
" file encoding
set encoding=utf-8
" enable Python syntax highlighting 
let python_highlight_all = 1


""" My HotKeys

" 

