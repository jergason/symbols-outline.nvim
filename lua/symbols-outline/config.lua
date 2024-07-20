local M = {}

M.defaults = {
  highlight_hovered_item = true,
  show_guides = true,
  position = "right",
  border = "single",
  relative_width = true,
  width = 25,
  auto_close = false,
  auto_preview = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = "Pmenu",
  winblend = 0,
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { "", "", },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { "q", },
    goto_location = "<cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    show_help = "?",
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

M.options = {}

function M.has_numbers()
  return M.options.show_numbers or M.options.show_relative_numbers
end

function M.get_position_navigation_direction()
  if M.options.position == "left" then
    return "h"
  else
    return "l"
  end
end

function M.get_window_width()
  if M.options.relative_width then
    return math.ceil(vim.o.columns * (M.options.width / 100))
  else
    return M.options.width
  end
end

function M.get_split_command()
  if M.options.position == "left" then
    return "topleft vs"
  else
    return "botright vs"
  end
end

local function has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

function M.is_symbol_blacklisted(kind)
  if kind == nil then
    return false
  end
  return has_value(M.options.symbol_blacklist, kind)
end

function M.is_client_blacklisted(client_id)
  local client = vim.lsp.get_client_by_id(client_id)
  if not client then
    return false
  end
  return has_value(M.options.lsp_blacklist, client.name)
end

function M.show_help()
  vim.notify("Current keymaps:")
  vim.notify(vim.inspect(M.options.keymaps))
end

function M.setup(options)
  vim.g.symbols_outline_loaded = 1
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

return M
