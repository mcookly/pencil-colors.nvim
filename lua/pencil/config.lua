local M = {}

M.config = {}

local default_config = {
   options = {
      higher_contrast_ui = false,
      neutral_code_bg = false,
      neutral_headings = false,
      terminal_italics = false,
      spell_undercurl = true,
      gutter_color = false,
   },
   plugins = {
      gitsigns = false,
      treesitter = false,
   },
}

function M.setup(opts)
   M.config = vim.tbl_deep_extend("force", default_config, opts or {})
end

return M
