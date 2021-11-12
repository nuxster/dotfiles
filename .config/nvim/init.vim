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
Plugin 'miyakogi/conoline.vim.git'
let g:conoline_auto_enable = 1

"""
" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides.git'
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

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
" List, select and switch between buffers.
"
" <Leader>b (typically: \b) to open a window listing all buffers
"   <ENTER> to edit the selected buffer in the previous window
"   <C-V> to edit the selected buffer in a new vertical split
"   <C-S> to edit the selected buffer in a new horizontal split
"   <C-T> to edit the selected buffer in a new tab page
" gb (or <M-b>) and gB (or <M-S-b>) to flip through the most-recently used buffer stack without opening the buffer listing "drawer"
" <Leader><LEFT>, <Leader><UP>, <Leader><RIGHT>, <Leader><DOWN> to split a new window left, up, right, or down
Plugin 'jeetsukumaran/vim-buffergator'

"""
" Scrollbar
Plugin 'dstein64/nvim-scrollview.git'

"""
" Plugin for work with git
Plugin 'tpope/vim-fugitive'

"""
" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

"""
" Plugin lets you deal with pairs of things surrounding things.
" in visualmode - vS'
" surround one word - ysiw'
" surround line - yss'
" delete surrounds - ds'
" delete surround tags - dstdst
" change surrounds - cs'*
" change surrounds tags - cst<tag>
Plugin 'tpope/vim-surround'


"""
" Code folding
"Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1

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
"
"select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
"create cursors vertically with Ctrl-Down/Ctrl-Up
"select one character at a time with Shift-Arrows
"press n/N to get next/previous occurrence
"press [/] to select next/previous cursor
"press q to skip current and get next occurrence
"press Q to remove current cursor/selection
"start insert mode with i,a,I,A
Plugin 'mg979/vim-visual-multi'

"""
" Color scheme
Plugin 'morhetz/gruvbox'
Plugin 'tomasiser/vim-code-dark'
Plugin 'mangeshrex/uwu.vim'

" cp -R ~/.vim/bundle/gruvbox/colors/ ~/.vim/
color gruvbox
" color codedark
" color uwu

"Plugin 'dracula/vim', { 'name': 'dracula' }
"colorscheme dracula


set background=dark
"""
" Start screen
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
