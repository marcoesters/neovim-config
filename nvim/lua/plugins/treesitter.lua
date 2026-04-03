return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "desktop",
        "diff",
        "dockerfile",
        "doxygen",
        "editorconfig",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "ini",
        "javascript",
        "jinja",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "python",
        "make",
        "markdown",
        "meson",
        "powershell",
        "printf",
        "regex",
        "requirements",
        "rust",
        "scss",
        "ssh_config",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zsh",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local ft = ev.match
          -- Highlighting
          pcall(vim.treesitter.start)

          -- Indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          -- Folding
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo[0][0].foldmethod = 'expr'
          vim.wo[0][0].foldlevel = 99
        end,
      })

      vim.filetype.add({
        pattern = {
          ["%.condarc"] = "yaml",
        },
      })

      vim.filetype.add({
        pattern = {
          [".*/.*%.nsi%.tmpl"] = "nsis",
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",

    config = function()
      require 'treesitter-context'.setup {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false,      -- Enable multiwindow support.
        max_lines = 10,           -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },
}
