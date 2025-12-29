require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- nvim-lspconfig
  use 'neovim/nvim-lspconfig'

  -- none-ls.nvim, a formatter
  use {
    "nvimtools/none-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    run = ':TSUpdate'
  }

  -- nvim-tree, a file-tree extension
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  -- Catppuccin, a theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  -- snippet
  use 'L3MON4D3/LuaSnip'
end)
