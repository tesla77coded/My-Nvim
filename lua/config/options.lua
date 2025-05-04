-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "│·", -- Vertical bar for tabs
  trail = "•", -- Dots for trailing spaces
  extends = "»", -- Overflow indicator
  precedes = "«", -- Overflow indicator
}

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.list = true
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.list = false
  end,
})
-- Add any additional options here
