--------------Short-Forms------------------
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

cmd 'packadd packer.nvim'


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------- Plugins -------------
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use "whatsthatsmell/codesmell_dark.vim"
    use "EdenEast/nightfox.nvim" -- colorscheme 
    use { "ellisonleao/gruvbox.nvim" }
    use 'folke/tokyonight.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'b3nj5m1n/kommentary' -- For comments
    -- use {
    --     'numToStr/Comment.nvim',
    --     config = function()
    --         require('Comment').setup()
    --     end
    -- }
    use 'mg979/vim-visual-multi' -- For multi selection
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/nvim-compe'
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        -- requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-project.nvim' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- Install Hack-Nerd Font for your terminal
    }
    use "kyazdani42/nvim-web-devicons"
    use 'ryanoasis/vim-devicons'
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
    use 'lewis6991/gitsigns.nvim'
    use 'phaazon/hop.nvim'
    -- Lua
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
    use 'onsails/lspkind-nvim'
    use { 'mhartington/formatter.nvim' }
    use 'ThePrimeagen/git-worktree.nvim'
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'mhinz/vim-startify'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
end)

-------- Colours --------------
require('tokyonight').setup({
    style = "storm",
    transparent = false,
    terminal_colors = true,
    styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end

})

--- Gruvbox ---
-- setup must be called before loading the colorscheme
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {
    -- bright_green = "#990000",
  },
  overrides = {
    SignColumn = {bg = "#ff9900"}
},
  dim_inactive = false,
  transparent_mode = false,
})

require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
            functions = "bold",
            -- constants = "italic",
            -- keywords = "standout",
        }
    },
    specs = {
        all = {
            syntax = {
                keyword = "#FFFA3E",
                func = "#00FFFF",
                string = "#EE7EF8",
                number = "#9300FF",
                conditional  = "#E77C0C",
                variable = "#F22B14",
                operator = "#FFFA3E",
                comment = "#56BD37"
            },
        }
    },
    palettes = {
        carbonfox = {
            bg1 = "#000000", -- Pure Black background babyy
            sel0 = "#3e4a5b", -- Popup bg, visual selection bg
            sel1 = "#4f6074", -- Popup sel bg, search bg
            -- comment = "#E1C16E",
        },
    },
})

cmd("colorscheme carbonfox")
-- cmd("colorscheme tokyonight-night")
-- cmd("colorscheme gruvbox")
-- vim.opt.background = 'dark'

-- cmd("set fillchars+=vert:│")
-- cmd("colorscheme codesmell_dark")

-------- Plugin setups ------------
require('telescope').setup()
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
require('neogit').setup()

require('telescope').setup{
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    }
}

require('gitsigns').setup{
  numhl = true,
  linehl = true,
  current_line_blame = true,
  current_line_blame_opts = { delay = 1000, position = 'rightalign' },
}

require('lualine').setup{
  options = {
    theme = "nightfox",
    -- theme = "tokyonight",
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
}

require('hop').setup()
require('trouble').setup()
require('lspkind').init()
require("bufferline").setup{
  options = {
    indicator = {
        icon = '>',
        style = 'icon'
    },
    show_buffer_close_icons = false,
    show_close_icon =  false,
  }
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-------- Formatter ------------
require('formatter').setup{
  filetype = {
    python = {
       function()
         return {
           exe = "black",
           args = {'-l', '99', '-'},
           stdin = true
         }
       end,
       function()
         return {
           exe = "isort",
           args = {'-'},
           stdin = true
         }
       end
    },
    yaml = {
      function()
        return {
          exe = "yamlfix",
          args = {'-'},
          stdin = true
        }
      end
    }
  }
}
-- Format filetypes on save
-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.py,*.yaml,*.yml FormatWrite
-- augroup END
-- ]], true)
--
-------- Globals --------------
g.mapleader = " "                 -- Set space as leader key

-------- Options --------------
opt.encoding = 'utf-8'
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
-- opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 4                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.softtabstop = 4                 -- Soft tab stop
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 4                     -- Number of spaces tabs count for
opt.wildmode = {'list', 'longest'}  -- Command-line completion mod
opt.ttyfast = true
opt.lazyredraw = true
opt.timeoutlen = 1000               -- For comment.nvim to work
opt.undodir = vim.fn.stdpath('config') .. '/undodir'  -- Do a mkdir ~/.config/nvim/undodir
opt.undofile = true


-------- LSP ---------------
local lsp = require('lspconfig')
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',jd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Jump to definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',jr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts) -- Jump to it's references
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts) -- Renaming all references
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',st', '<Cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts) -- Stop client

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>af', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code action
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',ji', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- lsp formatting isn't great or always supported comment for now and use formatter.vim instead
  --[[ vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>=', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]  -- PyLSP Format on save ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.pylsp.setup{    --- Needs pip install pydocstyle python-lsp-server pyls-flake8
  on_attach = on_attach,
  capabilities = capabilities,
  configurationSources = {'flake8', 'pydocstyle'},  -- respect tool config files
  plugins = {
    flake8 = { enabled = true },
    pydocstyle = { enabled = true },
  }
}

require('toggle_lsp_diagnostics').init({start_on = false}, {underline = false, virtual_text = { prefix = "XXX", spacing = 5 }}) -- Toggle LSP linter

lsp.yamlls.setup{  --- Needs yarn install -g yaml-language-server and .yarn/bin in PATH
  cmd = {'yaml-language-server', '--stdio'},
  filetypes = { 'yaml', 'yml' },
}

cmd("au BufRead,BufNewFile Dockerfile,Dockerfile.local set filetype=dockerfile")
lsp.dockerls.setup{
  filetypes = { "Dockerfile", "Dockerfile.local", "dockerfile" },
}

opt.completeopt = 'menuone,noselect'
require('compe').setup{
  enabled = true,
  autocomplete = true,
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

-- Utility functions for compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end


------- Mappings -----------
--- For Window Navigation ---
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')

--- For Buffer Navigations ---
map('n', '<leader>p', ':bp<CR>')
map('n', '<leader>n', ':bn<CR>')
map('n', '<leader>bb', ':b#<CR>')
map('n', '<leader>q', ':bd<CR>')


map('n', 'gA', 'ggVG"+y') -- If this doesn't work change + to * -- Copy all to Clipboard
map('n', 'gY', 'ggVGy') -- If this doesn't work change + to * -- Copy/Yank all to Vim's clipboard

map('n', '<leader>vl', ':so ~/.config/nvim/init.lua<CR>') -- Source the nvim config
map('n', '<leader>ve', ':e ~/.config/nvim/init.lua<CR>') -- Edit the nvim config

--- Telescope ---
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fs', ':Telescope grep_string<CR>')  -- needs ripgrep
map('n', '<leader>fb', ':Telescope file_browser<CR>') -- for file browsing
map('n', '<leader>fp', ':Telescope project<CR>') -- for project management -- (In normal mode, press c to create a project for your working dir)
map('n', '<leader>bf', ':Telescope buffers<CR>')
map('n', '<leader>gs', ':Telescope git_status<CR>')
map('n', '<leader>gl', ':Telescope git_commits<CR>')
map('n', '<leader>gb', ':Telescope git_branches<CR>')

map('n', '<leader>gg', ':Neogit<CR>')
map('n', '<leader>gd', ':DiffviewOpen master<CR>')

--- Git WorkTrees ---
map('n', '<leader>gw', ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map('n', '<leader>gn', ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")


--- Helpful maps ---
map('n', '<leader>/', ':HopPattern<CR>')
map('n', '<leader>w', ':HopWord<CR>')
map('n', '<leader>tt', ':TroubleToggle<CR>')
map('n', '<leader>td', ':ToggleDiag<CR>') -- Toggle the diagnostics
map('n', '<leader>gc', ':Gitsigns toggle_linehl<CR>') -- Toggle the diagnostics


--- Nvim Tree ---
map('n', '<leader>T', ':NvimTreeToggle<CR>') -- Toggle the NvimTree
map('n', '<leader>Tr', ':NvimTreeRefresh<CR>') -- Toggle the NvimTree


--- Kapitan compile map ---
map('n', '<leader>kc', ':!kapitan compile<CR>')

-- Map tab to the above tab complete functions
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

