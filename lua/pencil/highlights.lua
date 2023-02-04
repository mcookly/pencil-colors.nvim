local c = require("pencil").config

local M = {}

local function set_highlight(hl_group)
   for hl_name, hl_settings in pairs(hl_group) do
      vim.api.nvim_set_hl(0, hl_name, hl_settings)
   end
end

local function load_highlights(p)
   local hl = { lang = {}, plugin = {}, }

   hl.common = {
      Normal = { bg = p.bg, fg = p.norm },
      Cursor = { bg = p.blue, fg = p.norm },
      Comment = { fg = p.medium_gray, italic = true },
      -- Constant
      Constant = { fg = p.cyan },
      String = { link = "Constant" },
      Character = { link = "Constant" },
      Number = { link = "Constant" },
      Boolean = { link = "Constant" },
      Float = { link = "Constant" },
      -- Identifier
      Identifier = { fg = p.dark_blue },
      Function = { link = "Identifier" },
      -- Statement
      Statement = { fg = p.green },
      Conditonal = { link = "Statement" },
      Repeat = { link = "Statement" },
      Label = { link = "Statement" },
      Operator = { link = "Statement" },
      Keyword = { link = "Statement" },
      Exception = { link = "Statement" },
      -- Preproc
      PreProc = { fg = p.red },
      Include = { link = "PreProc" },
      Define = { link = "PreProc" },
      Macro = { link = "PreProc" },
      PreCondit = { link = "PreProc" },
      -- Type
      Type = { fg = p.purple },
      StorageClass = { link = "Type" },
      Structure = { link = "Type" },
      Typedef = { link = "Type" },
      -- Special
      Special = { fg = p.pink },
      SpecialChar = { link = "Special" },
      Tag = { link = "Special" },
      Delimiter = { link = "Special" },
      SpecialComment = { link = "Special" },
      Debug = { link = "Special" },
      -- Underlined
      Underlined = { fg = p.norm, underline = true },
      Ignore = { fg = p.bg },
      Error = { fg = p.actual_white, bg = p.red, bold = true },
      Todo = { fg = p.actual_white, bg = p.pink, bold = true },
   }

   hl.ui_chrome = {
      SpecialKey = { fg = p.light_green },
      NonText = { fg = p.bg_subtle },
      Directory = { fg = p.dark_blue },
      ErrorMsg = { fg = p.pink },
      IncSearch = { bg = p.yellow, fg = p.light_black },
      Search = { bg = p.bg_subtle },
      MoreMsg = { fg = p.medium_gray, bold = true },
      ModeMsg = { link = "MoreMsg" },
      LineNr = { fg = p.bg_subtle },
      CursorLineNr = { fg = p.blue, bg = p.bg_very_subtle },
      Question = { fg = p.red },
      StatusLine = { bg = p.bg_very_subtle },
      Conceal = { fg = p.norm },
      StatusLineNC = { bg = p.bg_very_subtle, fg = p.medium_gray },
      VertSplit = { bg = p.bg_very_subtle, fg = p.bg_very_subtle },
      Title = { fg = p.dark_blue },
      Visual = { bg = p.visual },
      VisualNOS = { bg = p.bg_subtle },
      WarningMsg = { fg = p.red },
      WildMenu = { fg = p.bg, bg = p.norm },
      Folded = { fg = p.medium_gray },
      FoldColumn = { fg = p.bg_subtle },
      DiffAdd = { bg = p.bg_subtle, fg = p.green },
      DiffAdded = { bg = p.bg_subtle, fg = p.green },
      DiffDelete = { bg = p.bg_subtle, fg = p.red },
      DiffRemoved = { bg = p.bg_subtle, fg = p.red },
      DiffChange = { bg = p.bg_subtle, fg = p.dark_yellow },
      DiffChanged = { bg = p.bg_subtle, fg = p.dark_yellow },
      DiffText = { bg = p.bg_subtle, fg = p.dark_blue },
      SignColumn = { fg = p.light_green },
      -- Spelling
      SpellBad = vim.tbl_extend("error", p.sp_un, { sp = p.red, fg = p.red }),
      SpellCap = vim.tbl_extend("error", p.sp_un, { sp = p.light_green, fg = p.light_green }),
      SpellRare = vim.tbl_extend("error", p.sp_un, { sp = p.pink, fg = p.pink }),
      SpellLocal = vim.tbl_extend("error", p.sp_un, { sp = p.dark_green, fg = p.dark_green }),
      -- Menu
      Pmenu = { fg = p.norm, bg = p.bg_subtle },
      PmenuSel = { fg = p.norm, bg = p.blue },
      PmenuSbar = { fg = p.norm, bg = p.bg_subtle },
      PmenuThumb = { fg = p.norm, bg = p.bg_subtle },
      TabLine = { fg = p.norm, bg = p.bg_very_subtle },
      TabLineSel = { fg = p.blue, bg = p.bg_subtle, bold = true },
      TabLineFill = { fg = p.norm, bg = p.bg_very_subtle },
      CursorColumn = { bg = p.bg_very_subtle },
      CursorLine = { bg = p.bg_very_subtle },
      ColorColumn = { bg = p.bg_subtle },
      -- Misc
      MatchParen = { bg = p.bg_subtle, fg = p.norm },
      qfLineNr = { fg = p.medium_gray },
   }

   hl.lang.markdown = {
      markdownBlockquote = { fg = p.norm },
      markdownBold = { fg = p.norm, bold = true },
      markdownBoldItalic = { fg = p.norm, italic = true, bold = true },
      markdownEscape = { fg = norm },
      markdownH1 = { fg = p.head_a, italic = true, bold = true },
      markdownH2 = { fg = p.head_a, bold = true },
      markdownH3 = { fg = p.head_a, italic = true },
      markdownH4 = { fg = p.head_a, italic = true },
      markdownH5 = { fg = p.head_a },
      markdownH6 = { fg = p.head_a },
      markdownHeadingDelimiter = { fg = p.norm },
      markdownHeadingRule = { fg = p.norm },
      markdownId = { fg = p.medium_gray },
      markdownIdDeclaration = { fg = p.norm_subtle },
      markdownItalic = { fg = p.norm, italic = true },
      markdownLinkDelimiter = { fg = p.medium_gray },
      markdownLinkText = { fg = p.norm },
      markdownLinkTextDelimiter = { fg = p.medium_gray },
      markdownListMarker = { fg = p.norm },
      markdownOrderedListMarker = { fg = p.norm },
      markdownRule = { fg = p.norm },
      markdownUrl = { fg = p.medium_gray, underline = true },
      markdownUrlDelimiter = { fg = p.medium_gray },
      markdownUrlTitle = { fg = p.norm },
      markdownUrlTitleDelimiter = { fg = p.medium_gray },
      markdownCode = { fg = p.norm, bg = p.code_bg },
      markdownCodeDelimiter = { fg = p.norm, bg = p.code_bg },
   }

   return hl
end

function M.setup(palette)
   local hl = load_highlights(palette)

   set_highlight(hl.common)
   set_highlight(hl.ui_chrome)

   for lang_name, lang_enabled in pairs(c.lang) do
      if lang_enabled then
         set_highlight(hl.lang[lang_name])
      end
   end
end

return M