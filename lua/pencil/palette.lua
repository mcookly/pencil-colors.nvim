local c = require("pencil.config").config

local M = {}

local base_palette = {
   black = "#212121",
   medium_gray = "#767676",
   white = "#F1F1F1",
   actual_white = "#FFFFFF",
   light_black = "#424242",
   lighter_black = "#545454",
   pink = "#fb007a",
   dark_red = "#C30771",
   light_red = "#E32791",
   orange = "#D75F5F",
   darker_blue = "#005F87",
   dark_blue = "#008EC4",
   blue = "#20BBFC",
   light_blue = "#b6d6fd",
   dark_cyan = "#20A5BA",
   light_cyan = "#4FB8CC",
   dark_green = "#10A778",
   light_green = "#5FD7A7",
   dark_purple = "#523C79",
   light_purple = "#6855DE",
   yellow = "#F3E430",
   dark_yellow = "#A89C14",
}

function M.generate_palette(bg)
   local theme = base_palette

   if c.options.higher_contrast_ui then
      theme = vim.tbl_extend("error", theme, {
         subtle_black = "#262626",
         light_gray = "#D9D9D9",
         lighter_gray = "#E5E6E6",
      })
   else
      theme = vim.tbl_extend("error", theme, {
         subtle_black = "#303030",
         light_gray = "#B2B2B2",
         lighter_gray = "#C6C6C6",
      })
   end

   if bg == "dark" then
      theme = vim.tbl_extend("error", base_palette, {
            bg = base_palette.black,
            bg_subtle = base_palette.light_black,
            bg_very_subtle = base_palette.subtle_black,
            norm = base_palette.lighter_gray,
            norm_subtle = base_palette.light_gray,
            purple = base_palette.light_purple,
            cyan = base_palette.light_cyan,
            green = base_palette.light_green,
            red = base_palette.light_red,
            visual = base_palette.lighter_black,
      })
   else
      theme = vim.tbl_extend("error", base_palette, {
            bg = base_palette.white,
            bg_subtle = base_palette.light_gray,
            bg_very_subtle = base_palette.lighter_gray,
            norm = base_palette.light_black,
            norm_subtle = base_palette.lighter_black,
            purple = base_palette.dark_purple,
            cyan = base_palette.dark_cyan,
            green = base_palette.dark_green,
            red = base_palette.dark_red,
            visual = base_palette.light_blue,
      })
   end

   if c.options.neutral_headings then
      theme = vim.tbl_extend("error", theme, {
         head_a = theme.norm,
         head_b = theme.norm,
         head_c = theme.norm,
      })
   else
      theme = vim.tbl_extend("error", theme, {
         head_a = theme.dark_blue,
         head_b = theme.blue,
         head_c = theme.dark_cyan,
      })
   end

   if c.options.neutral_code_bg then
      theme["code_bg"] = theme.bg
   else
      theme["code_bg"] = theme.bg_very_subtle
   end

   if c.options.spell_undercurl then
      theme["sp_un"] = { undercurl = true, underline = false }
   else
      theme["sp_un"] = { undercurl = false, underline = true }
   end

   return theme
end

return M
