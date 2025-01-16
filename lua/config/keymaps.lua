-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "jj", "<Esc>", options)
vim.api.nvim_set_keymap("n", "zw", ":w<CR>", options)
vim.api.nvim_set_keymap("n", "vv", "<C-v>", options)
