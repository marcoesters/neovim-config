return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal = {
      split_side = "left",
      snacks_win_opts = {
        position = "bottom",
        height = 0.4,
        width = 1.0,
        border = "rounded",
        title = " Claude ",
        title_pos = "center",
      }
    },
  },
  keys = {
    { "<C-,>",        "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>cc",  "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>ccf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ccr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>ccC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>ccm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>ccs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
