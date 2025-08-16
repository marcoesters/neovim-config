return {
  ensure_installed = "all",

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = { "yaml" },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-m>",
    },
  },

  indent = {
    enable = true
  },
}
