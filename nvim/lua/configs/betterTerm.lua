local betterTerm = require("betterTerm")
betterTerm.setup({
  position = "bot",
  size = math.floor(vim.o.lines/5),
})

vim.keymap.set({"n", "t"}, "<C-;>", function() betterTerm.open() end, { desc = "Toggle terminal" })
