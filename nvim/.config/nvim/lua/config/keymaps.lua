-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")

-- Better Movements
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")

-- Better copy
map("n", "gA", 'ggVG"+y') -- If this doesn't work change + to * -- Copy all to Clipboard
map("n", "gY", "ggVGy") -- If this doesn't work change + to * -- Copy all to Clipboard

-- Better Move to tabs
map("n", "<leader>1", "1gt", { desc = "Move to tab 1" })
map("n", "<leader>2", "2gt", { desc = "Move to tab 2" })
map("n", "<leader>3", "3gt", { desc = "Move to tab 3" })
map("n", "<leader>4", "4gt", { desc = "Move to tab 4" })
map("n", "<leader>5", "5gt", { desc = "Move to tab 5" })
map("n", "<leader>6", "6gt", { desc = "Move to tab 6" })
map("n", "<leader>7", "7gt", { desc = "Move to tab 7" })
map("n", "<leader>8", "8gt", { desc = "Move to tab 8" })
map("n", "<leader>9", "9gt", { desc = "Move to tab 9" })

-- Better Move Lines
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better Buffer Movements
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Lazy
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- formatting
map({ "n", "v" }, "<leader>fw", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- Telescope
map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
map("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>fb", require("telescope").extensions.file_browser.file_browser, { desc = "[F]ile [B]rowser" })
map("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "[G]it [B]ranches" })

-- Hop Word
map("n", "<leader>H", ":HopWord<CR>")
