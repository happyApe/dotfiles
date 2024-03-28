-- You can add your own plugins here or in other files in this directory!
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } },
		keys = {
			{ "<leader>ah", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon Menu" },
			{ "<leader>aa", ":lua require('harpoon.mark').add_file()<CR>", desc = "add file as marked" },
			{ "<leader>ad", ":lua require('harpoon.mark').rm_file()<CR>", desc = "Remove file" },
			{ "<leader>acl", ":lua require('harpoon.mark').clear_all()<CR>", desc = "Clear shit" },
			{ "<leader>aj", ":lua require('harpoon.ui').nav_next()<CR>", desc = "Next file " },
			{ "<leader>ak", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "Prev file " },
			{ "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "1st file" },
			{ "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "2nd file" },
			{ "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "3rd file" },
			{ "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "4th file" },
			{ "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "5th file" },
		},
	},
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
			require("neo-tree").setup({
				window = { position = "right" },
			})
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
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
	},
	{ -- Custom Theme inspired from original VIM
		"EdenEast/nightfox.nvim", -- colorscheme
		opts = {
			options = {
				terminal_colors = true,
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
						string = "#D936E8",
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
