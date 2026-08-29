local M = {}

M.dark = {
  base = "#1a1a1a",
  mantle = "#141414",
  crust = "#0d0d0d",
  surface0 = "#252525",
  surface1 = "#333333",
  surface2 = "#444444",
  text = "#d0d6f0",
  subtext = "#7c8498",
  overlay = "#9098b0",
  peach = "#f8b080",
  mauve = "#c8a2f4",
  green = "#a4e09c",
  yellow = "#f5dea4",
  blue = "#84b4f8",
  cyan = "#90dcd0",
  sky = "#84d8e8",
  red = "#f08898",
  pink = "#f2c0e4",
  lavender = "#b0b8fc",
}

M.light = {
  base = "#f0f2f6",
  mantle = "#e8eaf0",
  crust = "#dde0e8",
  surface0 = "#cdd2dc",
  surface1 = "#bdc2cc",
  surface2 = "#adb2bc",
  text = "#4a4d66",
  subtext = "#8a8d9e",
  overlay = "#9a9dac",
  peach = "#fc6008",
  mauve = "#8636ec",
  green = "#3e9e28",
  yellow = "#dd8c1a",
  blue = "#1c64f2",
  cyan = "#159096",
  sky = "#02a2e2",
  red = "#d00c36",
  pink = "#e874c8",
  lavender = "#7084fa",
}

function M.setup(opts)
  opts = opts or {}
  local style = opts.style or "dark"
  local c = style == "light" and M.light or M.dark

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = style
  vim.g.colors_name = "aizen_" .. style

  local groups = {
    Normal = { fg = c.text, bg = c.base },
    Cursor = { fg = c.base, bg = c.peach },
    CursorLine = { bg = c.mantle },
    CursorLineNr = { fg = c.lavender, bg = c.mantle },
    LineNr = { fg = c.surface2 },
    Visual = { bg = c.surface1 },
    Search = { fg = c.base, bg = c.yellow },
    IncSearch = { fg = c.base, bg = c.peach },
    MatchParen = { fg = c.peach, bg = c.surface1, bold = true },

    StatusLine = { fg = c.text, bg = c.crust },
    StatusLineNC = { fg = c.subtext, bg = c.crust },
    VertSplit = { fg = c.surface1 },
    TabLine = { fg = c.subtext, bg = c.crust },
    TabLineFill = { bg = c.crust },
    TabLineSel = { fg = c.text, bg = c.base },

    Pmenu = { fg = c.text, bg = c.surface0 },
    PmenuSel = { fg = c.text, bg = c.surface1 },
    PmenuSbar = { bg = c.surface0 },
    PmenuThumb = { bg = c.surface2 },

    Folded = { fg = c.subtext, bg = c.mantle, italic = true },
    FoldColumn = { fg = c.surface2, bg = c.base },
    SignColumn = { bg = c.base },

    ErrorMsg = { fg = c.red },
    WarningMsg = { fg = c.yellow },
    MoreMsg = { fg = c.green },
    Question = { fg = c.sky },

    NonText = { fg = c.surface2 },
    SpecialKey = { fg = c.surface2 },
    Directory = { fg = c.blue },
    Title = { fg = c.peach, bold = true },

    DiffAdd = { fg = c.green },
    DiffChange = { fg = c.yellow },
    DiffDelete = { fg = c.red },
    DiffText = { fg = c.blue, underline = true },

    Comment = { fg = c.overlay, italic = true },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.peach },
    Float = { fg = c.peach },
    Boolean = { fg = c.peach },
    Constant = { fg = c.peach },

    Identifier = { fg = c.text },
    Function = { fg = c.peach },

    Statement = { fg = c.mauve },
    Conditional = { fg = c.mauve },
    Repeat = { fg = c.mauve },
    Label = { fg = c.mauve },
    Operator = { fg = c.sky },
    Keyword = { fg = c.mauve },
    Exception = { fg = c.mauve },

    PreProc = { fg = c.mauve },
    Include = { fg = c.mauve },
    Define = { fg = c.mauve },
    Macro = { fg = c.mauve },
    PreCondit = { fg = c.mauve },

    Type = { fg = c.yellow },
    StorageClass = { fg = c.mauve },
    Structure = { fg = c.yellow },
    Typedef = { fg = c.yellow },

    Special = { fg = c.pink },
    SpecialChar = { fg = c.pink },
    Tag = { fg = c.blue },
    Delimiter = { fg = c.overlay },
    SpecialComment = { fg = c.overlay, italic = true },
    Debug = { fg = c.red },

    Underlined = { fg = c.blue, underline = true },
    Error = { fg = c.red },
    Todo = { fg = c.yellow, bold = true },

    -- TreeSitter
    ["@variable"] = { fg = c.text },
    ["@variable.parameter"] = { fg = c.red, italic = true },
    ["@variable.builtin"] = { fg = c.red },
    ["@constant"] = { fg = c.peach },
    ["@constant.builtin"] = { fg = c.peach },
    ["@string"] = { fg = c.green },
    ["@function"] = { fg = c.peach },
    ["@function.builtin"] = { fg = c.peach },
    ["@keyword"] = { fg = c.mauve },
    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.yellow },
    ["@property"] = { fg = c.text },
    ["@punctuation"] = { fg = c.overlay },
    ["@punctuation.bracket"] = { fg = c.overlay },
    ["@tag"] = { fg = c.blue },
    ["@tag.attribute"] = { fg = c.yellow },

    -- Diagnostics
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.sky },
    DiagnosticHint = { fg = c.cyan },

    -- Git
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.yellow },
    GitSignsDelete = { fg = c.red },
  }

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = c.base
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.mauve
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.text
  vim.g.terminal_color_8 = c.surface2
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.mauve
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = c.text
end

return M
