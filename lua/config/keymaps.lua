-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("manuelparra.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opt = { silent = true }
local opts = { noremap = true, silent = true }

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Save and quit
keymap.set("n", "<leader>W", ":w<cr>", opt)
keymap.set("n", "<leader>Q", ":q<cr>", opt)

-- Delete a word backwards
keymap.set("n", "dw", "vd_d")

-- Switching relative number
keymap.set("n", "<F5>", ":set invrelativenumber<CR>", opt)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Copy and paste
keymap.set({ "n", "x" }, "cp", '"+y')
keymap.set({ "n", "x" }, "cv", '"+p')

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opt)

-- Clase tab
keymap.set("n", "tq", ":bd<cr>", { silent = true })

-- Move between tabs
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Rename
keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
