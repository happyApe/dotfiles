Util = require("lazyvim.util")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      on_highlights = function(hl, c)
        hl.NavicIconsFile = { fg = c.fg, bg = c.bg_dark }
        hl.NavicIconsModule = { fg = c.yellow, bg = c.bg_dark }
        hl.NavicIconsNamespace = { fg = c.fg, bg = c.bg_dark }
        hl.NavicIconsPackage = { fg = c.fg, bg = c.bg_dark }
        hl.NavicIconsClass = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsMethod = { fg = c.blue, bg = c.bg_dark }
        hl.NavicIconsProperty = { fg = c.green1, bg = c.bg_dark }
        hl.NavicIconsField = { fg = c.green1, bg = c.bg_dark }
        hl.NavicIconsConstructor = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsEnum = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsInterface = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsFunction = { fg = c.blue, bg = c.bg_dark }
        hl.NavicIconsVariable = { fg = c.magenta, bg = c.bg_dark }
        hl.NavicIconsConstant = { fg = c.magenta, bg = c.bg_dark }
        hl.NavicIconsString = { fg = c.green, bg = c.bg_dark }
        hl.NavicIconsNumber = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsBoolean = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsArray = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsObject = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsKey = { fg = c.purple, bg = c.bg_dark }
        hl.NavicIconsKeyword = { fg = c.purple, bg = c.bg_dark }
        hl.NavicIconsNull = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsEnumMember = { fg = c.green1, bg = c.bg_dark }
        hl.NavicIconsStruct = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsEvent = { fg = c.orange, bg = c.bg_dark }
        hl.NavicIconsOperator = { fg = c.fg, bg = c.bg_dark }
        hl.NavicIconsTypeParameter = { fg = c.green1, bg = c.bg_dark }
        hl.NavicText = { fg = c.fg, bg = c.bg_dark }
        hl.NavicSeparator = { fg = c.fg, bg = c.bg_dark }
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    keys = {
      { "<leader>th", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    keys = {
      { "<leader>th", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    keys = {
      { "<leader>th", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    -- Custom Theme inspired from original VIM
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
