-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<S-Right>", ":BufferLineCycleNext<CR>", { desc = "Open next buffer", silent = true })
map("n", "<S-Left>", ":BufferLineCyclePrev<CR>", { desc = "Open previous buffer", silent = true })

map("n", "<M-S-Right>", ":tabnext<CR>", { desc = "Open next tab", silent = true })
map("n", "<M-S-Left>", ":tabprevious<CR>", { desc = "Open previous tab", silent = true })

map("n", "<M-Left>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<M-Right>", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<M-Up>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<M-Down>", "<C-w>j", { desc = "Go to Lower Window" })

map({ "n" }, "<Home>", function()
  return (vim.fn.col(".") == vim.fn.match(vim.fn.getline("."), "\\S") + 1) and "0" or "^"
end, { expr = true, desc = "Jump to either start or first character of the current line" })

map("n", "<S-Up>", "O<Esc>", { desc = "Insert one empty line before" })
map("n", "<S-Down>", "o<Esc>", { desc = "Insert one empty line below" })

map("n", "<Del>", "i<Space><Esc>", { desc = "Insert one space in current cursor position" })
map("n", "<S-Del>", "a<Space><Esc>", { desc = "Insert one space after current cursor position" })
