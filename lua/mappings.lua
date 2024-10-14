require "nvchad.mappings"
local opts = { noremap = true, silent = true }
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- MY CUSTOM KEY MAPPINGS

map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
map("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Telescope Live Grep" })

map("n", "J", ":m .+1<CR>==")
map("n", "K", ":m .-2<CR>==")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "jj", "<Esc>", { noremap = true, silent = true })
map("i", "JJ", "<Esc>", { noremap = true, silent = true })
-- map("n", "<leader>wv", ":vsp<CR>", { noremap = true, silent = true })
-- map("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true })
-- map("n", "<leader>wx", ":close<CR>", { noremap = true, silent = true })
map("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- map("n", "<leader>fc", ":%s//g<Left><Left>", { noremap = true, silent = true, desc = "Replace Word in File" })

map("n", "<leader>st", "<cmd> lua require('spectre').toggle()<CR>", { desc = "Spectre Toggle", noremap = true })
map(
  "n",
  "<leader>sw",
  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
  { desc = "Search current word" }
)
map(
  "n",
  "<leader>sf",
  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
  { desc = "Search on current file" }
)


-- Neogit keybindings
map("n", "<leader>gs", '<cmd>lua require("neogit").open()<CR>', { desc = "Neogit Status" })
map("n", "<leader>gc", '<cmd>lua require("neogit").open({ "commit" })<CR>', { desc = "Neogit Commit" })
map("n", "<leader>gp", '<cmd>lua require("neogit").open({ "push" })<CR>', { desc = "Neogit Push" })
map("n", "<leader>gl", '<cmd>lua require("neogit").open({ "log" })<CR>', { desc = "Neogit Log" })
map("n", "<leader>gd", '<cmd>lua require("neogit").open({ "diff" })<CR>', { desc = "Neogit Diff" })
