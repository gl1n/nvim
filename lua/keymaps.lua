-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.

local keymap = vim.api.nvim_set_keymap
local nore = {noremap = true, silent = true}
local re = {noremap=false, silent = true}

keymap('n', '<SPACE>', '<Nop>', nore) 
vim.g.mapleader = ' '

keymap('i', 'jk', '<ESC>', nore)
keymap('i', '<C-s>', '<cmd>w<cr>', nore)

-- For nvim-tree
keymap('n', '<F5>', '<cmd>NvimTreeToggle<cr>', nore)


-- nmap <F6> :TagbarToggle<CR>
keymap('n', '<F6>', ':TagbarToggle<CR>', nore)

-- For telescope
-- Find files using Telescope command-line sugar.
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', nore)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', nore)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', nore)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', nore)

-- For Floaterm
-- F4 键进入/退出terminal模式
keymap('t', '<F4>', '<C-\\><C-n>:FloatermToggle<cr>', nore)
keymap('n', '<F4>', ':FloatermToggle<cr>', nore)


-- For vim-go
-- autocompletion
keymap('i', '<C-k>', '<C-x><C-o>', nore)

-- For Coc
-- tab completion
vim.cmd([[
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])
-- GoTo code navigation.
keymap('n', 'gd', '<Plug>(coc-definition)', re)
keymap('n', 'gy', '<Plug>(coc-type-definition)', re)
keymap('n', 'gi', '<Plug>(coc-implementation)', re)
keymap('n', 'gr', '<Plug>(coc-references)', re)
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', re)
keymap('n', ']g', '<Plug>(coc-diagnostic-next)', re)
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
-- Symbol renaming.
keymap('n', '<leader>rn', '<Plug>(coc-rename)', re)
-- Apply AutoFix to problem on the current line.
keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', re)

-- switch between source/header files
keymap('n', '<C-h>', ':CocCommand clangd.switchSourceHeader<cr>', nore)
