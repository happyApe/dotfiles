return {

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    keys = {
      { "<leader>ah", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon menu" },

      { "<leader>aa", ":lua require('harpoon.mark').add_file()<CR>", desc = "Add file as marked" },
      { "<leader>an", ":lua require('harpoon.ui').nav_next()<CR>", desc = "Next file" },
      { "<leader>ap", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "Previous file" },
    },
  },
}
