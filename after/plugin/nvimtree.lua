-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
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
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<space>e",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
-- <A-c>/c	create	Create file/folder at current path (trailing path separator creates folder)
-- <S-CR>	create_from_prompt	Create and open file/folder from prompt (trailing path separator creates folder)
-- <A-r>/r	rename	Rename multi-selected files/folders
-- <A-m>/m	move	Move multi-selected files/folders to current path
-- <A-y>/y	copy	Copy (multi-)selected files/folders to current path
-- <A-d>/d	remove	Delete (multi-)selected files/folders
-- <C-o>/o	open	Open file/folder with default system application
-- <C-g>/g	goto_parent_dir	Go to parent directory
-- <C-e>/e	goto_home_dir	Go to home directory
-- <C-w>/w	goto_cwd	Go to current working directory (cwd)
-- <C-t>/t	change_cwd	Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f	toggle_browser	Toggle between file and folder browser
-- <C-h>/h	toggle_hidden	Toggle hidden files/folders
-- <C-s>/s	toggle_all	Toggle all entries ignoring ./ and ../
-- <Tab>	see telescope.nvim	Toggle selection and move to next selection
-- <S-Tab>	see telescope.nvim	Toggle selection and move to prev selection
-- <bs>/	backspace	With an empty prompt, goes to parent dir. Otherwise acts normally

