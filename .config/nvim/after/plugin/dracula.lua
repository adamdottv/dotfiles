local dracula = require("dracula")
local colors = {
  bg = "#22212C",
  bg_light = "#2E2B3B",
  bg_lighter = "#393649",
  fg = "#F8F8F2",
  selection = "#454158",
  comment = "#7970A9",
  red = "#FF9580",
  orange = "#FFCA80",
  yellow = "#FFFF80",
  green = "#8AFF80",
  purple = "#9580FF",
  cyan = "#80FFEA",
  pink = "#FF80BF",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
}

dracula.setup({
  -- customize dracula color palette
  colors = colors,
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = false, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights see `:h synIDattr`
  overrides = {
    -- https://github.com/Mofiqul/dracula.nvim/blob/main/lua/dracula/groups.lua
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.yellow, italic = true },
    Keyword = { fg = colors.cyan, italic = true },
    DiagnosticUnderlineError = { fg = colors.red, italic = true, underline = true },
    Special = { fg = colors.green },
    ['@keyword'] = { fg = colors.pink, italic = true },
    ['@keyword.function'] = { fg = colors.pink },
    ['@keyword.conditional'] = { fg = colors.pink, italic = true },
    ['@variable.member'] = { fg = colors.purple },
    ['@variable.parameter'] = { fg = colors.orange, italic = true },
    ['@constant'] = { fg = colors.purple, italic = true },
    ['@type'] = { fg = colors.bright_cyan, italic = true },
    ['@number'] = { fg = colors.purple, italic = true },
    ['@lsp.type.parameter'] = { fg = colors.orange, italic = true },
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_light, },
    -- CmpItemAbbr = { fg = colors.white, bg = colors.bg_light },
    -- CmpItemKind = { fg = colors.white, bg = colors.bg_light },
    NormalFloat = { fg = colors.fg, bg = colors.bg_light, },
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_light, },
    TelescopePromptBorder = { fg = colors.cyan, },
    TelescopeResultsBorder = { fg = colors.cyan, },
    TelescopePreviewBorder = { fg = colors.cyan, },
    FloatBorder = { fg = colors.cyan, },
    VertSplit = { fg = colors.cyan, },
    WinSeparator = { fg = colors.cyan, },
  },
})

-- Colorscheme
vim.cmd[[colorscheme dracula]]

