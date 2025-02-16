-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", opts)
keymap.set("v", "jk", "<ESC>", opts)

keymap.set("i", "<A-h>", "<Left>", opts)
keymap.set("i", "<A-j>", "<Down>", opts)
keymap.set("i", "<A-k>", "<Up>", opts)
keymap.set("i", "<A-l>", "<Right>", opts)
