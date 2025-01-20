require "nvchad.mappings"
local opts = { noremap = true, silent = true }
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- MY CUSTOM KEY MAPPINGS

map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
map("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Telescope Live Grep" })

map("n", "J", ":m .+1<CR>==")
map("n", "K", ":m .-2<CR>==")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "jj", "<Esc>", { noremap = true, silent = true })
map("i", "JJ", "<Esc>", { noremap = true, silent = true })
map("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

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

-- Toggle line number
map("n", "<leader>tn", '<cmd>set nu!<CR>', { desc = "toggle line number", noremap = true })
vim.keymap.del("n", "<leader>n")

-- Neogit keybindings
map("n", "<leader>gs", '<cmd>lua require("neogit").open()<CR>', { desc = "Neogit Status" })
map("n", "<leader>gc", '<cmd>lua require("neogit").open({ "commit" })<CR>', { desc = "Neogit Commit" })
map("n", "<leader>gP", '<cmd>lua require("neogit").open({ "push" })<CR>', { desc = "Neogit Push" })
map("n", "<leader>gp", '<cmd>lua require("neogit").open({ "pull" })<CR>', { desc = "Neogit pull" })
map("n", "<leader>gl", '<cmd>lua require("neogit").open({ "log" })<CR>', { desc = "Neogit Log" })
map("n", "<leader>gd", '<cmd>lua require("neogit").open({ "diff" })<CR>', { desc = "Neogit Diff" })
map("n", "<leader>gb", '<cmd>lua require("neogit").open({ "branch" })<CR>', { desc = "Neogit Branch" })



vim.keymap.set('n', '<leader>cb', function()
  -- Close all other buffers except the current one
  local current_buffer = vim.api.nvim_get_current_buf()
  local all_buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(all_buffers) do
    if buf ~= current_buffer then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = 'Close All Buffers' })



-- Neorg keybinds
map("n", "<leader>ni", '<cmd>Neorg index<CR>', { desc = "Neorg Workspace Index" })

-- Indent selected text in visual mode with Tab
map('v', '<Tab>', '>gv', { desc = "Indent selected text in Visual mode" })

-- Unindent selected text in visual mode with Shift+Tab
map('v', '<S-Tab>', '<gv', { desc = "Unindent selected text in Visual mode" })



-- While in a .norg file
-- zc: Close (collapse) a fold.
--
-- zo: Open (expand) a fold.
--
-- za: Toggle a fold open or closed.
--
-- zr: Reduce fold level (open more folds).
--
-- zm: Increase fold level (close more folds).
--
-- zM: Close all folds.
--
-- zR: Open all folds.
