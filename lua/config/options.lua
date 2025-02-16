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
-- Add any additional options here
