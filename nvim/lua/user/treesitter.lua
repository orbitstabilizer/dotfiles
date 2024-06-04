local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" },
		highlight = { 
            enable = true ,
            -- disable slow treesitter highlight for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = true,

        },
		indent = { enable = true },
		-- incremental_selection = {
		-- 	enable = true,
		-- 	keymaps = {
		-- 		init_selection = "<Leader>]", -- set to `false` to disable one of the mappings
		-- 		node_incremental = "<C-]>",
		-- 		scope_incremental = "<C-n>",
		-- 		node_decremental = "<C-[>",
		-- 	},
		-- },
	})
end

return M
