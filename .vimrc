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




"""

" Цветовая схема
color desert
" включить подсветку синтаксиса
syntax enable
" показывать номера строк
set number
" установить tab равным 4 пробелам
set ts=4
" отступ при переходе на следующую строку при написании кода
set autoindent
" преобразование tab-ов в пробелы
set expandtab
" при использовании команд >> или << сдвигать строки на 4 пробела
set shiftwidth=4
" выделять строку, на которой находится курсор
"set cursorline
"hi CursorLine ctermbg=235
" показывать парную скобку для [] {} и ()
set showmatch
" включить подсветку синтаксиса Python
let python_highlight_all = 1
