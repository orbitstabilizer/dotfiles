local M = {
	"folke/which-key.nvim",
}

function M.config()
	local mappings = {
		q = { "<cmd>confirm q<CR>", "Quit" },
		H = { "<cmd>nohlsearch<CR>", "NOHL" },
		[";"] = { "<cmd>Alpha <CR>", "Alpha Dashboard" },
		v = { "<cmd>vsplit<CR>", "Vertical Split" },
		h = { "<cmd>split<CR>", "Horizontal Split" },
		b = { name = "Buffers" },
		d = { name = "Debug" },
		f = { name = "Find" },
		g = { name = "Git" },
		l = { name = "LSP", s = { "<cmd>LspStart<cr>", "Start" } },
		p = {
			name = "Plugins",
			h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
		},
		-- t = { name = "Test" },
		t = {
			name = "Tab",
			n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
			N = { "<cmd>tabnew %<cr>", "New Tab" },
			o = { "<cmd>tabonly<cr>", "Only" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
			["]"] = { "<cmd>tabnext<cr>", "Next" },
			["["] = { "<cmd>tabprevious<cr>", "Previous" },
		},
		T = { name = "Treesitter" },
		L = {
			name = "Custom",
		},
	}

	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
	}

	-- which_key.register(mappings, opts)
	which_key.add({
		{ "<leader>;", "<cmd>Alpha <CR>", desc = "Alpha Dashboard" },
		{ "<leader>H", "<cmd>nohlsearch<CR>", desc = "NOHL" },
		{ "<leader>L", group = "Custom" },
		{ "<leader>T", group = "Treesitter" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>h", "<cmd>split<CR>", desc = "Horizontal Split" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>ls", "<cmd>LspStart<cr>", desc = "Start" },
		{ "<leader>p", group = "Plugins" },
		{ "<leader>ph", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon" },
		{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
		{ "<leader>t", group = "Tab" },
		{ "<leader>tN", "<cmd>tabnew %<cr>", desc = "New Tab" },
		{ "<leader>t[", "<cmd>tabprevious<cr>", desc = "Previous" },
		{ "<leader>t]", "<cmd>tabnext<cr>", desc = "Next" },
		{ "<leader>th", "<cmd>-tabmove<cr>", desc = "Move Left" },
		{ "<leader>tl", "<cmd>+tabmove<cr>", desc = "Move Right" },
		{ "<leader>tn", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
		{ "<leader>to", "<cmd>tabonly<cr>", desc = "Only" },
		{ "<leader>v", "<cmd>vsplit<CR>", desc = "Vertical Split" },
	})
end

return M
