local M = {
    -- Autoformat
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = false,
        -- format_on_save = {
        --     timeout_ms = 500,
        --     lsp_fallback = true,
        -- },
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform can also run multiple formatters sequentially
            python = { "black" },
            --
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            -- javascript = { { "prettierd", "prettier" } },
        }
    },
}

M.config = function()
    require("conform").setup(M.opts)
    local wk = require("which-key")
    wk.register({
        ["<leader>lf"] = { "<cmd>lua require('conform').format()<CR>", "Format" },
    })
end
return M
