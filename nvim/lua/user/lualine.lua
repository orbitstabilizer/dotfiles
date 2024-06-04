local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
}

function M.config()
	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = {},
			lualine_b = { "branch" },
			lualine_c = { "diagnostics" },
			lualine_x = {
				{
					"copilot",
					-- Default values
					symbols = {
						status = {
							icons = {
								enabled = " ",
								sleep = " ",
								disabled = " ",
								warning = " ",
								unknown = " ",
							},
							hl = {
								enabled = "#50FA7B",
								sleep = "#AEB7D0",
								disabled = "#6272A4",
								warning = "#FFB86C",
								unknown = "#FF5555",
							},
						},
						spinners = require("copilot-lualine.spinners").dots,
						spinner_color = "#6272A4",
					},
					show_colors = false,
					show_loading = true,
				},
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = {
				"location",
				{
					function()
						local starts = vim.fn.line("v")
						local ends = vim.fn.line(".")
						local count = starts <= ends and ends - starts + 1 or starts - ends + 1
						return count .. "V"
					end,
					cond = function()
						return vim.fn.mode():find("[Vv]") ~= nil
					end,
				},
			},
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
