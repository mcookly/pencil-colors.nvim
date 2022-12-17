local M = {}

function M.setup(opts)

   vim.opt.termguicolors = true
   vim.g.colors_name = "pencil"

   -- Initialize user options only once.
   -- User must call `require("pencil").setup(opts) to override defaults.
   require("pencil.config").setup(opts)
end

function M.load()
   -- Set colorscheme
   -- This function is triggered with `colorsceme pencil` is called.
   vim.cmd.colorscheme("pencil")
 
   -- Generate the palette based on the current background and user options
   -- and pass generated palette into the highlights generator.
   local palette = require("pencil.palette").generate_palette(vim.o.background)
   require("pencil.highlights").setup(palette)
end

return M
