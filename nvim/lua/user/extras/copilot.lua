local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
}


function M.config()
  require("copilot").setup {
    panel = {
      keymap = {
        jump_next = "<c-j>",
        jump_prev = "<c-k>",
        accept = "<c-l>",
        refresh = "r",
        open = "<M-CR>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<c-l>",
        next = "<c-j>",
        prev = "<c-k>",
        dismiss = "<c-h>",
        accept_line = "<m-l>",
        accept_word = "<c-w>",
      },
    },
    filetypes = {
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node",
    -- vim.g.copilot_no_tab_map = true
    -- vim.g.copilot_assume_mapped = true
    -- vim.g.copilot_tab_fallback = ""
    -- vim.g.copilot_filetypes = {
    --   markdown = true,
    --   norg = false
    -- }



  }

  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

  require("copilot_cmp").setup()
end

return M
