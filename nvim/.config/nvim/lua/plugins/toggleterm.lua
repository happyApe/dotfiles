local Util = require("lazyvim.util")

return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = { "ToggleTerm" },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      close_on_exit = true, -- close the terminal window when the process exits
    },
  },
}
