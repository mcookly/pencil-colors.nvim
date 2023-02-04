# Pencil Colors for Neovim

This is the same thing as the beloved [vim-colors-pencil](https://github.com/preservim/vim-colors-pencil), except it is ported to lua with a couple of small tweaks.
**This only works in Neovim.**

## Install

Install like you would any other plugin.
Just don't have `vim-colors-pencil` installed!

## Use

Load using

```vim
colorscheme pencil
```

or 

```lua
require("pencil").load()
```

## Customize

Use the setup function.
Here are the defaults:

```lua
require("pencil").setup({
   options = {
      higher_contrast_ui = false,
      neutral_code_bg = false,
      neutral_headings = false,
      terminal_italics = false,
      spell_undercurl = true,
      gutter_color = false,
   },
   lang = {
      html = true,
      markdown = true,
   },
})
```