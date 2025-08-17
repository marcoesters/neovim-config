return {
  "machakann/vim-sandwich",
  "tpope/vim-commentary",
  "voldikss/vim-floaterm",
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "mason-org/mason.nvim",
    },
    config = function()
      require("configs.nvim-lspconfig")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = true },
    },
    config = function()
      require("configs.nvim-cmp")
    end,
  },
  {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle", "GithubPreviewStart", "GithubPreviewStop" },
    opts = {},
    config = function(_, opts)
        local gpreview = require("github-preview")
        gpreview.setup(opts)
    end,
    ft = { "markdown" },
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn = false,  -- turn off by default
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require("configs.lualine")
    end,
  },
}
