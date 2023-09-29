vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<leader>y", "\"0y")
keymap.set("v", "<leader>y", "\"0y")
keymap.set("n", "<leader>p", "\"0p")
keymap.set("v", "<leader>p", "\"0p")
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

keymap.set("n", "<leader>nh", ":nohl<CR>")     -- clear search bar

keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>v")        -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab

-- plugin keymaps
--
-- neo-tree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")                                            -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")                                          -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")                                              -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                                            -- list available help tags

-- neogit
vim.keymap.set("n", "<leader>n", "<cmd>Neogit<cr>")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<F1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<F2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<F3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<F4>", function() ui.nav_file(4) end)

-- zenmode
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")

-- undo tree
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- golang
keymap.set("n", "<leader>ee", "oif err != nil {<cr>}<esc>Oreturn err")
