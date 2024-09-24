local M = {
	"sindrets/diffview.nvim",
	opts = {},
}

M.config = function()
	require("diffview").setup(M.opts)
	local wk = require("which-key")
	-- wk.register({
	-- 	-- add keybindings here
	-- })
end
return M
