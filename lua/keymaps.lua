-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap('n', '<SPACE>', '<Nop>', opts) 
vim.g.mapleader = ' '

keymap('i', 'jk', '<ESC>', opts)
keymap('i', '<C-s>', '<cmd>:w', opts)


-- For nvim-tree
keymap('n', '<F5>', '<cmd>NvimTreeToggle<cr>', opts)


-- nmap <F6> :TagbarToggle<CR>
keymap('n', '<F6>', ':TagbarToggle<CR>', opts)

-- For telescope
-- Find files using Telescope command-line sugar.
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- For Floaterm
-- F4 键进入/退出terminal模式
keymap('t', '<F4>', '<C-\\><C-n>:FloatermToggle<cr>', opts)
keymap('n', '<F4>', ':FloatermToggle<cr>', opts)


-- For vim-go
-- autocompletion
keymap('i', '<C-k>', '<C-x><C-o>', opts)

-- For Coc
-- tab completion
vim.cmd([[
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])
-- GoTo code navigation.
keymap('n', 'gd', '<Plug>(coc-definition)', opts)
keymap('n', 'gy', '<Plug>(coc-type-definition)', opts)
keymap('n', 'gi', '<Plug>(coc-implementation)', opts)
keymap('n', 'gr', '<Plug>(coc-references)', opts)
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
keymap('n', ']g', '<Plug>(coc-diagnostic-next)', opts)
 --Use K to show documentation in preview window.
vim.cmd([[
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]])
