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
map <F5> :NERDTreeToggle<CR>
"""
" Plugin for work with git
Plugin 'tpope/vim-fugitive'


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

" color scheme
color desert
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
" enable Python syntax highlighting 
let python_highlight_all = 1
