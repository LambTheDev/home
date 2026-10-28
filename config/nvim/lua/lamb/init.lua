vim.g.mapleader = ","

-- Indent with two spaces.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Move by visual line when wrapping.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- System clipboard.
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+y$', { desc = "Yank to end of line to clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Put from clipboard after" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Put from clipboard before" })

vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without touching registers" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Write buffer" })

require("lamb.markdown")
require("lamb.format")
require("lamb.lsp")
