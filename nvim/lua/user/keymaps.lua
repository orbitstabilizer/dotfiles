local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "



if vim.g.neovide then
    keymap("n", "<D-v>", "\"*p", opts)
    keymap("i", "<D-v>", "<C-r>*", opts)
end

keymap("n", "<leader>;", "", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- zjuan
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader>q", ":wq<CR>", opts)
-- keymap("n", "<Leader>e", ":Ex<CR>", opts)
keymap("n", "<Leader>c", ":bd<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>", opts)
vim.api.nvim_set_keymap(  't'  ,  '<C-k>'  ,  '<C-\\><C-n>'  ,  {noremap = true}  )

keymap("n", "<C-e>", "5<C-e>",opts)
keymap("n", "<C-y>", "5<C-y>",opts)

-- open config file: ~/.config/nvim/init.lua
keymap("n", "<Leader>;c", ":e ~/.config/nvim/init.lua<CR>", opts)

keymap("n", "<Leader>tc", "<CMD>lua ToggleCompileOnSave()<CR>")



-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<M-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
-- vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
-- keymap({ "n", "x" }, "j", "gj", opts)
-- keymap({ "n", "x" }, "k", "gk", opts)
-- keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)


vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-n>', opts)

-- nmap <M-j> mz:m+<cr>`z
-- nmap <M-k> mz:m-2<cr>`z
-- vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
-- vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

keymap("n", "<Leader>j", ":m .+1<CR>==", opts)
keymap("n", "<Leader>k", ":m .-2<CR>==", opts)
keymap("v", "<Leader>j", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<Leader>k", ":m '<-2<CR>gv=gv", opts) 

