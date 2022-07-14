" -----------------------基础设置-----------------------
" 显示行号
set number
" 显示相对行号
set relativenumber

" 显示光标所在行
set cursorline
" 显示光标所在位置的行号和列号
set ruler

" 上下翻动时，预留3行显示
set scrolloff=3

" 用空格替换tab
set expandtab
" 默认缩进4个空格
set shiftwidth=2
" 制表符占4个空格
set tabstop=2

" 换行时根据代码智能地添加缩进
set smartindent

" 搜索时同时匹配多个
set incsearch

" 高亮搜索(使用:noh取消高亮)
set hlsearch

" 键位映射
inoremap jk <ESC>

" 可以使用鼠标
:set mouse=a


" -----------------------插件安装-----------------------
call plug#begin()

Plug 'vim-airline/vim-airline'

" 文件树
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 文档解析
Plug 'preservim/tagbar'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'voldikss/vim-floaterm'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'mhinz/vim-startify'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


" -----------------------插件配置-----------------------

lua << EOF
require("nvim-tree").setup()
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "cpp" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


" -----------------------插件配置2-----------------------
" 主题颜色
" Example config in VimScript
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
" Load the colorscheme
colorscheme tokyonight

" coc automatically install plugs
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright']


" -----------------------快捷键设置-----------------------
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap <C-s> <cmd>:w<cr>


" For nvim-tree
nnoremap <leader>pc <cmd>NvimTreeCollapse<cr>
nnoremap <leader>pt <cmd>NvimTreeToggle<cr>


nmap <F6> :TagbarToggle<CR>


" For telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" For Floaterm
tnoremap <silent> <F4> <C-\><C-n>:FloatermToggle<cr>
nnoremap <silent> <F4> :FloatermToggle<cr>
" F4 键退出terminal模式
" tnoremap <silent> <F4> <C-\><C-n>


" For vim-go
" Autocompletion
inoremap <C-k> <C-x><C-o>


" Use tab/shift-tab to select completion item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" -----------------------END-----------------------
