require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")
require("user.utils")

-- ./lua/user/lspsettings/clangd.lua
-- local ok, err = pcall(require, "user.retrobox")
local ok = false
if not ok then
    spec("user.lunar_colorscheme")
    -- vim.notify("Error loading retrobox: " .. err)
end
spec("user.devicons")
spec("user.treesitter")
spec("user.mason")
spec("user.schemastore")
spec("user.lspconfig")
-- spec("kickstart.lspconfig")
spec("user.cmp")
-- spec("user.telescope")
spec("kickstart.telescope")

-- spec("user.none-ls")
spec("user.illuminate")
spec("user.gitsigns")
spec("user.whichkey")
spec("user.nvimtree")
spec("user.comment")
spec("user.lualine")
spec("user.navic")
spec("user.breadcrumbs")
spec("user.harpoon")
--+ spec "user.neotest"
-- spec("user.autopairs")
spec("user.neogit")
spec("user.alpha")
spec("user.conform")
spec("user.oil")

spec("user.project")
-- spec "user.indentline"
--+ spec "user.toggleterm"

spec("user.extras.copilot")
spec("user.extras.cellular-automaton")
spec("user.extras.obsidian")
-- spec("user.extras.mini")
-- spec("user.extras.nvim-ufo")

require("user.lazy")

if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0
else
    spec("user.extras.neoscroll")
end

vim.cmd("unmap H")
vim.cmd("unmap L")
-- https://github.com/vim/vim/issues/6040#issuecomment-827176487
vim.cmd([[tnoremap <S-space> <space>]])


-- mini.nvim

