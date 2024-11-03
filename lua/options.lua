require "nvchad.options"

-- add yours here!
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
--

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.textwidth = 30

-- Customize Neogit highlight groups
vim.cmd('highlight NeogitStatus guifg=#00ff00 guibg=#000000')
vim.cmd('highlight NeogitCommitView guifg=#ff0000 guibg=#000000')
