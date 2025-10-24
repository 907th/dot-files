-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<M-Left>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<M-Right>", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<M-Up>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<M-Down>", "<C-w>j", { desc = "Go to Lower Window" })

map({ "n" }, "<Home>", function()
  return (vim.fn.col(".") == vim.fn.match(vim.fn.getline("."), "\\S") + 1) and "0" or "^"
end, { expr = true, desc = "Jump to either start or first character of the current line" })

map("n", "<CR>", "o<Esc>", { desc = "Insert empty line after current one" })
map("n", "<BS>", "O<Esc>", { desc = "Insert empty line before current one" })

map("n", "<S-Right>", ":BufferLineCycleNext<CR>", { desc = "Open next buffer", silent = true })
map("n", "<S-Left>", ":BufferLineCyclePrev<CR>", { desc = "Open previous buffer", silent = true })

-- map("n", "<Leader>e", function()
--   local explorerWin = Snacks.picker.get({ source = "explorer" })[1]
--   if explorerWin == nil then
--     Snacks.picker.explorer()
--   elseif explorerWin:is_focused() then
--     Snacks.picker.explorer()
--   else
--     Snacks.picker.explorer()
--     Snacks.picker.explorer()
--   end
-- end, { desc = "Open/close/jump to file explorer" })
