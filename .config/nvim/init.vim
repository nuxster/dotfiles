"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General

set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
set autoread
set undofile

" system clipboard
set clipboard=unnamedplus
" enable mouse use in all modes
set mouse=a
" syntax highlighting
syntax enable
" show line numbers 
set number
set relativenumber
" indent on line break while writing code
set autoindent
set smartindent
" highlight line with cursor
set cursorline
" draws vertical line after 80 chars
set colorcolumn=80
" Set tab to 2 spaces
set ts=2
" converting tabs to spaces 
set expandtab
" when using the >> or << commands, shift lines by 4 spaces 
set shiftwidth=2
" show paired parenthesis for [] {} and () 
set showmatch
" line ending format
set fileformat=unix
" file encoding
set encoding=utf-8

" UI
set scrolloff=3
set showmode
set showcmd
set hidden
set previewheight=20

set t_Co=256
set background=dark

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General keys mapping

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
" buffers
map <leader>n :bn!<cr>
map <leader>P :bp!<cr>
map <leader>s :w<cr>:bd!<cr>
map <leader>q :bd!<cr>
map <leader>N :tabnew<cr>
" copy to clipboard
nnoremap  <leader>y  "+y
" past from clipboard
nnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins (vim-plug)

""" Initialize plugin system
call plug#begin()

""" General plugins

" File system explorer
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Buffers
" :Bdelete  - delete buffer
" :Bwipeout - force delete buffer
Plug 'famiu/bufdelete.nvim'

" Terminal
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermNew' }

" Scrollbar
Plug 'dstein64/nvim-scrollview'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" Code comments
" gcc               - comment line
" gc in visual mode - comment select block
Plug 'tomtom/tcomment_vim'

" Multiple cursors
" Ctrl-N       - select words
" Ctrl-Down/Up - create cursors vertically
" q            - skip current and get next occurrence
" Q            - remove current cursor/selection
" i, I, a, A   - start insert mode
Plug 'mg979/vim-visual-multi'     

" Marks
" mx  - Toggle mark 'x' and display it in the leftmost column
" dmx - Remove mark 'x' where x is a-zA-Z
" `x  - Jump to mark 'x'
" ]`  - Jump to next mark
" [`  - Jump to prev mark
" m/  - Open location list and display marks from current buffer
Plug 'kshenoy/vim-signature'

" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'     

" Status and tab modern bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'morhetz/gruvbox'
 
" Start screen
Plug 'mhinz/vim-startify'


""" Plugins for programming

" Markdown
Plug 'ellisonleao/glow.nvim'
" Press enter to follow internal markdown links.
Plug 'jghauser/follow-md-links.nvim'

" LSP

" Python support
" Installation:
" pip install pyright

" A collection of common configurations for Neovim's built-in language server client.
Plug 'neovim/nvim-lspconfig'
" A completion engine plugins.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippets.
Plug 'L3MON4D3/LuaSnip'
" LuaSnip completion.
Plug 'saadparwaiz1/cmp_luasnip'

" JS support
Plug 'yuezk/vim-js'


""" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins configurations

" File system explorer
map <F12> :NERDTreeToggle<CR>
" Disable Highlighting
let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
" Colors
let g:WebDevIconsDefaultFolderSymbolColor = 'F16529'
let g:WebDevIconsDefaultFileSymbolColor = '905532'

" Terminal
nnoremap <silent> <F7> :FloatermNew<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8> :FloatermPrev<CR>
tnoremap <silent> <F8> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9> :FloatermNext<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F10> :FloatermToggle<CR>
tnoremap <silent> <F10> <C-\><C-n>:FloatermToggle<CR>

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Status and tab modern bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Color scheme
colorscheme gruvbox
noremap <leader>m :Glow<CR>

" Markdown
let g:glow_style = "dark"

" LSP

lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

