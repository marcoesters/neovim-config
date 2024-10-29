local opt = vim.opt
local is_windows = vim.fn.has "win32" ~= 0
local pathsep = is_windows and "\\" or "/"
local default_colorscheme = "kanagawa-wave"

require("configs.lazy")
vim.cmd(string.format("colorscheme %s", default_colorscheme))
opt.backspace = { "indent", "eol" , "start" }
opt.colorcolumn = "100"
opt.errorbells = false
opt.expandtab = true
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = false
opt.laststatus = 2
opt.mouse = "a"
opt.number = true
opt.ruler = true
opt.shiftwidth = 4
opt.showmode = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.syntax = "on"
opt.tabstop = 4
opt.wildmenu = true

opt.undofile = true
-- Add double pathsep to the end to use full path as file names.
-- This prevents clobbering of files with the same basename.
opt.backup = true
opt.backupdir = table.concat({ vim.fn.stdpath "data", "backup", "", "" }, pathsep)

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
            vim.highlight.on_yank({
            hlgroup = "IncSearch",
            timeout = 500,
        })
    end,
})

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
