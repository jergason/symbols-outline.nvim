# symbols-outline.nvim

**A tree like view for symbols in Neovim using the Language Server Protocol.
Supports all your favourite languages.**

![demo](./symbols-demo.gif)
Demo was taken from [rust-tools-demos](https://github.com/simrat39/rust-tools-demos/raw/master/symbols-demo.gif)

## Prerequisites

- `neovim 0.10+`
- Properly configured Neovim LSP client

## Installation and Setup

Using `lazy.nvim`

```lua
{
  "vaengir/symbols-outline.nvim",
  cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
  opts = {
    -- your configuration goes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>st", "<cmd>SymbolsOutline<cr>", desc = "Toggle Symbol Sidebar", },
  },
}
```

## Configuration

These options can be put in the opts table of the [Installation section](#installation-and-setup).

```lua
opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"q"},
    goto_location = "<cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "H",
    unfold = "L",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri", },
    Module = { icon = "", hl = "@namespace", },
    Namespace = { icon = "", hl = "@namespace", },
    Package = { icon = "", hl = "@namespace", },
    Class = { icon = "𝓒", hl = "@type", },
    Method = { icon = "ƒ", hl = "@method", },
    Property = { icon = "", hl = "@method", },
    Field = { icon = "", hl = "@field", },
    Constructor = { icon = "", hl = "@constructor", },
    Enum = { icon = "ℰ", hl = "@type", },
    Interface = { icon = "ﰮ", hl = "@type", },
    Function = { icon = "", hl = "@function", },
    Variable = { icon = "", hl = "@constant", },
    Constant = { icon = "", hl = "@constant", },
    String = { icon = "𝓐", hl = "@string", },
    Number = { icon = "#", hl = "@number", },
    Boolean = { icon = "⊨", hl = "@boolean", },
    Array = { icon = "", hl = "@constant", },
    Object = { icon = "⦿", hl = "@type", },
    Key = { icon = "", hl = "@type", },
    Null = { icon = "NULL", hl = "@type", },
    EnumMember = { icon = "", hl = "@field", },
    Struct = { icon = "𝓢", hl = "@type", },
    Event = { icon = "", hl = "@type", },
    Operator = { icon = "+", hl = "@operator", },
    TypeParameter = { icon = "𝙏", hl = "@parameter", },
    Component = { icon = "", hl = "@function", },
    Fragment = { icon = "", hl = "@constant", },
  },
}
```

| Property               | Description                                                                    | Type               | Default                  |
| ---------------------- | ------------------------------------------------------------------------------ | ------------------ | ------------------------ |
| highlight_hovered_item | Whether to highlight the currently hovered symbol (high cpu usage)             | boolean            | true                     |
| show_guides            | Whether to show outline guides                                                 | boolean            | true                     |
| position               | Where to open the split window                                                 | 'right' or 'left'  | 'right'                  |
| relative_width         | Whether width of window is set relative to existing windows                    | boolean            | true                     |
| width                  | Width of window (as a % or columns based on `relative_width`)                  | int                | 25                       |
| auto_close             | Whether to automatically close the window after selection                      | boolean            | false                    |
| auto_preview           | Show a preview of the code on hover                                            | boolean            | false                    |
| show_numbers           | Shows numbers with the outline                                                 | boolean            | false                    |
| show_relative_numbers  | Shows relative numbers with the outline                                        | boolean            | false                    |
| show_symbol_details    | Shows extra details with the symbols (lsp dependent)                           | boolean            | true                     |
| preview_bg_highlight   | Background color of the preview window                                         | string             | Pmenu                    |
| winblend               | Pseudo-transparency of the preview window                                      | int                | 0                        |
| keymaps                | Which keys do what                                                             | table (dictionary) | [here](#default-keymaps) |
| symbols                | Icon and highlight config for symbol icons                                     | table (dictionary) | scroll up                |
| lsp_blacklist          | Which lsp clients to ignore                                                    | table (array)      | {}                       |
| symbol_blacklist       | Which symbols to ignore ([possible values](./lua/symbols-outline/symbols.lua)) | table (array)      | {}                       |
| autofold_depth         | Depth past which nodes will be folded by default                               | int                | nil                      |
| auto_unfold_hover      | Automatically unfold hovered symbol                                            | boolean            | true                     |
| fold_markers           | Markers to denote foldable symbol's status                                     | table (array)      | { '', '' }             |
| wrap                   | Whether to wrap long lines, or let them flow off the window                    | boolean            | false                    |

## Commands

| Command                | Description            |
| ---------------------- | ---------------------- |
| `:SymbolsOutline`      | Toggle symbols outline |
| `:SymbolsOutlineOpen`  | Open symbols outline   |
| `:SymbolsOutlineClose` | Close symbols outline  |

## Default keymaps

| Key        | Action                                             |
| ---------- | -------------------------------------------------- |
| q          | Close outline                                      |
| Enter      | Go to symbol location in code                      |
| o          | Go to symbol location in code without losing focus |
| Ctrl+Space | Hover current symbol                               |
| K          | Toggles the current symbol preview                 |
| r          | Rename symbol                                      |
| a          | Code actions                                       |
| H          | fold symbol                                        |
| L          | Unfold symbol                                      |
| W          | Fold all symbols                                   |
| E          | Unfold all symbols                                 |
| R          | Reset all folding                                  |
| ?          | Show help message                                  |

## Highlights

| Highlight               | Purpose                                |
| ----------------------- | -------------------------------------- |
| FocusedSymbol           | Highlight of the focused symbol        |
| Pmenu                   | Highlight of the preview popup windows |
| SymbolsOutlineConnector | Highlight of the table connectors      |
| Comment                 | Highlight of the info virtual text     |

## Roadmap
- [ ] Add config option to not focus window on opening
- [ ] Prevent errors when not closing window properly
