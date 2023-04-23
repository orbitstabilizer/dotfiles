local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<leader>r", mark.remove_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu) 

vim.keymap.set("n", "<C-k>", function() ui.nav_file(1) end )
vim.keymap.set("n", "<C-l>", function() ui.nav_file(2) end )







