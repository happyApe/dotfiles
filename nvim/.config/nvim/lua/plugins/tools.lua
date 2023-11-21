return {
  -- Better scope for buffers throughout tabs
  {
    "tiagovla/scope.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "LazyFile",
    opts = {
      restore_state = false,
    },
  },

  -- -- Better diffing
  -- {
  --   "sindrets/diffview.nvim",
  --   -- stylua: ignore start
  --   cmd = {
  --     "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles",
  --     "DiffviewFileHistory", "DiffviewRefresh"
  --   },
  --   -- stylua: ignore end
  --   config = true,
  --   keys = {
  --     { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
  --     { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffviewFileHistory Current File" },
  --   },
  -- },

  -- Better surround for vim-visual-multi
  {
    "tpope/vim-surround",
    event = "LazyFile",
  },

  -- Better qflist??
  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      "junegunn/fzf",
      "junegunn/fzf.vim",
    },
    ft = { "qf" },
    opts = {},
  },
}
