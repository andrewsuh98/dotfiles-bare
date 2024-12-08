-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- "kj" as escape
-- map("i", "kj", "<Esc>", { desc = "Escape" })

-- remove lazyvim window mappings
map("n", "<leader>ww", "<Nop>")
map("n", "<leader>wd", "<Nop>")
map("n", "<leader>w-", "<Nop>")
map("n", "<leader>w|", "<Nop>")
map("n", "<leader>-", "<Nop>")
map("n", "<leader>|", "<Nop>")
map("n", "<C-Up>", "<Nop>")
map("n", "<C-Down>", "<Nop>")
map("n", "<C-Left>", "<Nop>")
map("n", "<C-Right>", "<Nop>")

-- arrow keys switch windows in normal mode
map("n", "<Up>", "<C-w>k", { desc = "Go to the up window" })
map("n", "<Down>", "<C-w>j", { desc = "Go to the down window" })
map("n", "<Left>", "<C-w>h", { desc = "Go to the left window" })
map("n", "<Right>", "<C-w>l", { desc = "Go to the right window" })

-- resize windows
map("n", "<C-w><Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-w><Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-w><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-w><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<C-w>m", "<C-w>_", { desc = "Max out height" })
map("n", "<C-w>M", "<C-w>|", { desc = "Max out width" })
map("n", "<C-w>c", "<cmd>close<cr>", { desc = "Close window" })

-- Increment/decrement
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
