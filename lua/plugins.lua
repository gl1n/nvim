-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt=true}
  
  use 'neovim/nvim-lspconfig'

  use 'vim-airline/vim-airline'

  use 'kyazdani42/nvim-web-devicons'

  use 'kyazdani42/nvim-tree.lua'

  use 'neoclide/coc.nvim' 

  use 'preservim/tagbar'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'voldikss/vim-floaterm'

  use 'folke/tokyonight.nvim'

  use 'mhinz/vim-startify'

  use {'fatih/vim-go', run = ':GoUpdateBinaries' }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

end)
