-- You can add your own plugins here or in other files in this directory!
return {
	{ "mbbill/undotree" },
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		config = function()
			require("toggle_lsp_diagnostics").init(
				{ start_on = true },
				{ underline = true, virtual_text = { prefix = "XXX", spacing = 5 } }
			) -- Toggle LSP linter
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({})
		end,
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
		lazy = false,
	},
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
	{
		"mg979/vim-visual-multi",
		branch = "master",
		-- event = { "BufReadPost", "BufNewFile" },
		init = function()
			vim.g.VM_theme = "purplegray"
			vim.g.VM_mouse_mappings = 1
		end,
	},
	{ -- Custom Theme inspired from original VIM
		"EdenEast/nightfox.nvim", -- colorscheme
		opts = {
			options = {
				styles = {
					comments = "italic",
					functions = "bold",
					-- constants = "italic",
					-- keywords = "standout",
				},
			},
			specs = {
				all = {
					syntax = {
						keyword = "#FFFA3E",
						func = "#00FFFF",
						string = "#EE7EF8",
						number = "#9300FF",
						conditional = "#E77C0C",
						variable = "#FFFFFF",
						operator = "#FFFA3E",
						comment = "#56BD37",
					},
				},
			},
			palettes = {
				carbonfox = {
					bg1 = "#000000", -- Pure Black background babyy
					sel0 = "#3e4a5b", -- Popup bg, visual selection bg
					sel1 = "#4f6074", -- Popup sel bg, search bg
					-- comment = "#E1C16E",
				},
			},
		},
	},
}
