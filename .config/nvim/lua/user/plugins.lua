-- Source: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  --{
  --  "nvim-neo-tree/neo-tree.nvim",
  --  branch = "v3.x",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --    "MunifTanjim/nui.nvim",
  --    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --  },
  --},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'nvim-lualine/lualine.nvim'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-nvim-lsp-signature-help'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-nvim-lua'},
  {'hrsh7th/nvim-cmp'},
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {'saadparwaiz1/cmp_luasnip'},
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {'simrat39/rust-tools.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      plugins = {
        tmux = { enabled = true },
        alacritty = {
          enabled = true,
          font = "16",
        },
      }
    },
  },
  {'onsails/lspkind.nvim'},
})
