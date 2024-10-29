return {
    "machakann/vim-sandwich",
    "tpope/vim-commentary",
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
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
            { "williamboman/mason.nvim", lazy = true },
            { "williamboman/mason-lspconfig.nvim", lazy = true },
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        lazy = true,
    },
}
