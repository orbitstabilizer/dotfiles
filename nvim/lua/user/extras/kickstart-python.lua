local M = {


    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap-python",
    },

    opts = {
        dap_enabled = true, -- makes the debugger work with venv
        -- stay_on_this_version = true,
        stay_on_this_version = true,

    },

}

M.config = function()
    require("venv-selector").setup(M.opts)
end

return M
