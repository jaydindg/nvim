require "nvchad.options"

-- add yours here!
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
--

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.textwidth = 0

-- Customize Neogit highlight groups
vim.cmd('highlight NeogitStatus guifg=#00ff00 guibg=#000000')
vim.cmd('highlight NeogitCommitView guifg=#ff0000 guibg=#000000')


-- Create the autocmd group
local markdown_conceal_group = vim.api.nvim_create_augroup("markdown_conceal", { clear = true })

-- Enable conceal for all lines when reading or opening a buffer
vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter" }, {
  group = markdown_conceal_group,
  pattern = "*.norg",
  callback = function()
    vim.wo.conceallevel = 2
  end,
})

-- Reveal markdown for the current line in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  group = markdown_conceal_group,
  pattern = "*.norg",
  callback = function()
    vim.wo.concealcursor = "n"
  end,
})

-- Hide markdown for the current line in insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  group = markdown_conceal_group,
  pattern = "*.norg",
  callback = function()
    vim.wo.concealcursor = ""
    vim.wo.conceallevel = 2
  end,
})

-- Ensure conceal level is maintained for the hovered line in normal mode
vim.api.nvim_create_autocmd("CursorMoved", {
  group = markdown_conceal_group,
  pattern = "*.norg",
  callback = function()
    if vim.fn.mode() == 'n' then
      vim.wo.concealcursor = "nc"
      vim.wo.conceallevel = 2
    end
  end,
})

-- Handle switching to different buffers
vim.api.nvim_create_autocmd("BufLeave", {
  group = markdown_conceal_group,
  pattern = "*.norg",
  callback = function()
    vim.wo.conceallevel = 2
    vim.wo.concealcursor = ""
  end,
})



vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.autoindent = false
    vim.opt_local.smartindent = false
    vim.opt_local.cindent = false
  end,
})
