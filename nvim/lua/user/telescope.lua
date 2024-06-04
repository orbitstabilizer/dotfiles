local M = {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        { "nvim-telescope/telescope-file-browser.nvim", lazy=false},
        -- file_browser extensions
		"nvim-lua/plenary.nvim",
        "smartpde/telescope-recent-files"
	},
	lazy = false
}

function M.config()
	local wk = require("which-key")
-- lua require("telescope.builtin").lsp_document_symbols({ symbols = { "variable" } })
	wk.register({
		["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
		["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
		["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
		["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
		["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        ["<leader>fd"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        ["<leader>fdf"] = { "<cmd>Telescope lsp_document_symbols symbols={\"function\", \"method\"}<cr>"},
        ["<leader>fdv"] = { "<cmd>Telescope lsp_document_symbols symbols={\"variables\"}<cr>"}


	})

	local icons = require("user.icons")
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			recent_files = {
              -- This extension's options, see below.
            }},
            
		},
	})

    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("recent_files")
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>e",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true }
    )
end

return M
