---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "decay",
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = false,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
