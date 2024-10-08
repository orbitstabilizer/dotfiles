local lunar_M = {
	name = "lunar",
	"LunarVim/lunar.nvim",
	-- "ellisonleao/gruvbox.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
        vim.o.background = "dark"
        vim.cmd("colorscheme lunar")
        
    end
}

local M = {
	-- name = "github_dark",
	"projekt0n/github-nvim-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			-- ...
		})
		vim.cmd("colorscheme github_dark_high_contrast")
	end,
}

function lunar_M.config()
	-- require("gruvbox").setup({
	--     terminal_colors = true, -- add neovim terminal colors
	--     undercurl = true,
	--     underline = true,
	--     bold = true,
	--     italic = {
	--         strings = true,
	--         emphasis = true,
	--         comments = true,
	--         operators = false,
	--         folds = true,
	--     },
	--     strikethrough = true,
	--     invert_selection = false,
	--     invert_signs = false,
	--     invert_tabline = false,
	--     invert_intend_guides = false,
	--     inverse = true, -- invert background for search, diffs, statuslines and errors
	--     contrast = "soft", -- can be "hard", "soft" or empty string
	--     palette_overrides = {},
	--     overrides = {},
	--     dim_inactive = false,
	--     transparent_mode = false,
	-- })
	vim.o.background = "dark"
	vim.cmd.colorscheme(M.name)
end

return M
