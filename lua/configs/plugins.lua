local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'    -- Packer can manage itself

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim'     -- Common utilities

  -- LSP support
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'       -- Completion
  use 'hrsh7th/cmp-buffer'     -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'   -- nvim-cmp source for neovim's built-in LSP
  use 'windwp/nvim-autopairs'  -- check for pairs
  use 'windwp/nvim-ts-autotag' -- auto close and auto rename tags
  use 'Shougo/deoplete.nvim'   -- C / C++ autocompletion
  use 'zchee/deoplete-clang'   -- C / C++ autocompletion

  -- Snippets
  use 'nvimdev/lspsaga.nvim'         -- LSP UIs
  use 'onsails/lspkind-nvim'         -- vscode-like pictograms
  use 'L3MON4D3/LuaSnip'
  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  --  Highlight
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  -- Comment
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Formatting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'
  use 'folke/zen-mode.nvim'

  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" }


  -- Tmux helper
  use { 'alexghergh/nvim-tmux-navigation', config = function()
    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup {
      disable_when_zoomed = true -- defaults to false
    }

    vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    vim.keymap.set('n', "<C-n>", nvim_tmux_nav.NvimTmuxNavigateNext)
  end
  }

  -- Nvim helpers
  use 'ThePrimeagen/vim-be-good' -- Game to learn vim motions
  use {
    "m4xshen/hardtime.nvim",     -- Prohibits the use of mouse and force keymap usage
    requires = { 'MunifTanjim/nui.nvim', "nvim-lua/plenary.nvim" }
  }

  -- Prisma helper
  use 'prisma/vim-prisma'

  -- Emmet
  use 'mattn/emmet-vim'

  -- Live server for html
  use({
    "aurum77/live-server.nvim",
    run = function()
      require "live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  })
end)
