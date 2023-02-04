local M = {}

M.config = {
   options = {
      higher_contrast_ui = false,
      neutral_code_bg = false,
      neutral_headings = false,
      terminal_italics = false,
      spell_undercurl = true,
      gutter_color = false,
   },
   lang = {
      markdown = true,
   },
}

function M.setup(opts)
   -- Initialize user options only once.
   -- User must call `require("pencil").setup(opts) to override defaults.
   M.config = vim.tbl_deep_extend("force", M.config, opts or nil)
end

function M.load()
   -- This function is triggered when `colorsceme pencil` is called.
   if vim.g.colors_name then
      vim.cmd("highlight clear")
   end

   if not vim.o.termguicolors then
      vim.o.termguicolors = true
   end

   vim.g.colors_name = "pencil"
 
   -- Generate the palette based on the current background and user options
   -- and pass generated palette into the highlights generator.
   local palette = require("pencil.palette").generate_palette(vim.o.background)
   require("pencil.highlights").setup(palette)
end

return M
