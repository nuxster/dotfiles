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
" This plugin highlights the line of the cursor, only in the current window.
" The colors change according to the mode (normal/insert)
"
Plugin 'miyakogi/conoline.vim.git'
let g:conoline_auto_enable = 1

"""
" Indent Guides is a plugin for visually displaying indent levels in Vim.
"
Plugin 'nathanaelkane/vim-indent-guides.git'
let g:indent_guides_enable_on_vim_startup = 1

"""
" Status and tab modern bar
"
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
"
Plugin 'preservim/nerdtree'
map <F12> :NERDTreeToggle<CR>
Plugin 'ryanoasis/vim-devicons'

"""
" List, select and switch between buffers.
"
" <Leader>b  - (typically: \b) to open a window listing all buffers
" <C-V>      - to edit the selected buffer in a new vertical split
" <C-S>      - to edit the selected buffer in a new horizontal split
" <C-T>      - to edit the selected buffer in a new tab page
" ]b         - to next buffer
" b[         - to previous bufer
"
Plugin 'jeetsukumaran/vim-buffergator'

"""
" Scrollbar
"
Plugin 'dstein64/nvim-scrollview.git'

"""
" Marks
"
" mx  - Toggle mark 'x' and display it in the leftmost column
" dmx - Remove mark 'x' where x is a-zA-Z
" ]`  - Jump to next mark
" [`  - Jump to prev mark
" m/  - Open location list and display marks from current buffer
"
Plugin 'kshenoy/vim-signature.git'

"""
" Plugin for work with git
"
Plugin 'tpope/vim-fugitive'

"""
" Insert or delete brackets, parens, quotes in pair.
"
Plugin 'jiangmiao/auto-pairs'

"""
" Plugin lets you deal with pairs of things surrounding things.
"
" vS'      - in visualmode
" ysiw'    - surround one word
" yss'     - surround line
" ds'      - delete surrounds
" dstdst   - delete surround tags
" cs'*     - change surrounds
" cst<tag> - change surrounds tags
"
Plugin 'tpope/vim-surround'


"""
" Code folding
"
"Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1

"""
" Code auto-complete
"
" Installation: 
" cd ~/.vim/bundle/YouCompleteMe
" apt install build-essential cmake python3-dev
" python3 install.py --clang-completer --js-completer
"
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""
" Check syntax
"
Plugin 'vim-syntastic/syntastic'

"""
" Check PEP8
"
Plugin 'nvie/vim-flake8'

"""
" Code comments
"
" gcc               - comment line
" gc in visual mode - comment select block
"
Plugin 'tomtom/tcomment_vim'

"""
" Multiple cursors
"
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" n/N - get next/previous occurrence
" [/] - select next/previous cursor
" q   - skip current and get next occurrence
" Q   - remove current cursor/selection
" start insert mode with i,a,I,A
" 
Plugin 'mg979/vim-visual-multi'

"""
" Color scheme
"
" Installation:
" cp -R ~/.vim/bundle/gruvbox/colors/ ~/.vim/
"
Plugin 'morhetz/gruvbox'
color gruvbox
set background=dark

"""
" Start screen
"
Plugin 'mhinz/vim-startify'


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

" system clipboard
set clipboard=unnamedplus
" enable mouse use in all modes
set mouse=a
" syntax highlighting
syntax enable
" show line numbers 
set number
" draws vertical line after 80 chars
set colorcolumn=80
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


""" Hotkeys
" buffers
map <leader>n :bn!<cr>
map <leader>p :bp!<cr>
map <leader>s :w<cr>:bd<cr>
map <leader>q :bd<cr>
map <leader>N :tabnew<cr>
" copy to clipboard
nnoremap  <leader>y  "+y
" past from clipboard
nnoremap <leader>p "+p
