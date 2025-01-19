-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local gs = require("gitsigns")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map("n", ";", ":", opts)
-- map("v", ";", ":", opts)
map("n", "<leader>t.", ":TestFile<cr>", { noremap = true, silent = true, desc = "run test file" })
map("n", "<leader>ts", ":TestNearest<cr>", { noremap = true, silent = true, desc = "run test example" })
-- map("n", "<leader>a", ":testsuite<cr>", opts)
map("n", "<leader>z", ":VimuxZoomRunner<cr>", { noremap = true, silent = true, desc = "zoom in on test runner" })
