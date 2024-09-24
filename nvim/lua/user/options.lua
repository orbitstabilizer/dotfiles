
-- zjuan
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end


-- nohlsearch
vim.cmd [[
  augroup clear_search
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END
]]

vim.g.loaded_matchit = 1
vim.opt.autochdir = false
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 4 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line

vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = false
-- colorcolumn = "80",
-- colorcolumn = "120",
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2


vim.opt.wrap = true
vim.opt.showbreak = "↪"
vim.opt.conceallevel = 1

-- let s:guifontsize = 10
-- let s:guifont ="Menlo-Regular:h24" 
--
-- function! AdjustFontSize(amount)
--   let s:guifontsize = s:guifontsize+a:amount
--   exe "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
-- endfunction

-- local guifontsize = 20
-- local guifont = "Menlo-Regular:h" .. guifontsize
--
-- function _G.adjust_font_size(amount)
--   guifontsize = guifontsize + amount
--   vim.cmd("set guifont=" .. guifont .. ":h" .. guifontsize)
-- end

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"


-- Neovide
if vim.g.neovide then
    -- set title
    vim.opt.title = true
    vim.opt.titlestring = " "

    local map = vim.keymap.set

    local function neovideScale(amount)
        local temp = vim.g.neovide_scale_factor + amount

        if temp < 0.5 then
            return
        end

        vim.g.neovide_scale_factor = temp
    end

    map("n", "<C-=>", function()
        neovideScale(0.1)
    end)

    map("n", "<C-->", function()
        neovideScale(-0.1)
    end)
end



