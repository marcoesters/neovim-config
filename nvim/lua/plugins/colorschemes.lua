return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      keywordStyle = {
        italic = false,
      },
      overrides = function(_, opts)
        return {
          ["@variable.builtin"] = { italic = false },
        }
      end,
    },
  },
}
