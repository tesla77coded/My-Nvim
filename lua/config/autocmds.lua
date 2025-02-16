-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin",
  callback = function()
    local colors = require("catppuccin.palettes").get_palette() -- Get theme colors
    vim.api.nvim_set_hl(0, "Whitespace", { fg = colors.overlay1 }) -- Subtle grayish color
  end,
})
