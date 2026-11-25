local hl = vim.api.nvim_set_hl
local theme = {}

-- Colors follow VS Code's "Dark Modern" and "Light Modern" themes: the syntax colors come from
-- Dark+ / Light+ (which Modern extends) and the editor UI colors from Modern itself. VS Code colors
-- with an alpha channel are pre-blended onto the surface they are drawn on (Neovim has no alpha).
theme.set_highlights = function(opts)
    local c = require("vscode.colors").get_colors()
    local is_dark = vim.o.background == "dark"
    local editor_background = opts.transparent and "NONE" or (is_dark and c.d_black_30 or c.l_white_30)
    -- `editor.foreground`: text that no syntax rule colors (e.g. punctuation)
    local default_fg = is_dark and c.d_gray_260 or c.l_gray_10

    hl(0, "Normal", { fg = default_fg, bg = editor_background })
    hl(0, "ColorColumn", { fg = "NONE", bg = is_dark and c.d_gray_10 or c.l_gray_230 })
    hl(0, "Cursor", { fg = is_dark and c.d_black_30 or c.l_white_30, bg = is_dark and c.d_gray_230 or c.l_black_10 })
    hl(0, "CursorLine", { bg = is_dark and c.d_gray_10 or c.l_gray_230 })
    hl(0, "CursorColumn", { fg = "NONE", bg = is_dark and c.d_gray_10 or c.l_gray_230 })
    hl(0, "Directory", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = editor_background })
    hl(0, "DiffAdd", { fg = "NONE", bg = is_dark and c.d_green_20 or c.l_green_110 })
    hl(0, "DiffChange", { fg = "NONE", bg = is_dark and c.d_green_20 or c.l_green_110 })
    hl(0, "DiffDelete", { fg = "NONE", bg = is_dark and c.d_red_10 or c.l_red_130 })
    hl(0, "DiffText", { fg = "NONE", bg = is_dark and c.d_green_30 or c.l_green_90 })
    hl(0, "EndOfBuffer", { fg = editor_background, bg = "NONE" })
    hl(0, "ErrorMsg", { fg = is_dark and c.d_red_80 or c.l_red_110, bg = editor_background })
    hl(0, "VertSplit", { fg = is_dark and c.d_gray_40 or c.l_gray_210, bg = editor_background })
    hl(0, "WinSeparator", { link = "VertSplit" })
    hl(0, "Folded", { fg = "NONE", bg = is_dark and c.d_blue_10 or c.l_blue_230 })
    hl(0, "FoldColumn", { fg = is_dark and c.d_gray_150 or c.l_gray_60, bg = editor_background })
    hl(0, "SignColumn", { fg = "NONE", bg = editor_background })
    hl(0, "IncSearch", { fg = "NONE", bg = is_dark and c.d_brown_30 or c.l_gray_140 })
    hl(0, "CurSearch", { link = "IncSearch" })
    hl(0, "LineNr", { fg = is_dark and c.d_gray_150 or c.l_gray_60, bg = editor_background })
    hl(0, "CursorLineNr", { fg = is_dark and c.d_gray_260 or c.l_blue_30, bg = editor_background })
    -- VS Code draws a border around the matching bracket; underline it instead
    hl(0, "MatchParen", {
        fg = "NONE",
        bg = is_dark and c.d_green_10 or c.l_green_100,
        underline = true,
        sp = is_dark and c.d_gray_170 or c.l_gray_150,
    })
    hl(0, "ModeMsg", { fg = default_fg, bg = is_dark and c.d_black_40 or c.l_white_10 })
    hl(0, "MoreMsg", { fg = default_fg, bg = is_dark and c.d_black_40 or c.l_white_10 })
    hl(0, "NonText", { fg = is_dark and c.d_gray_60 or c.l_gray_190, bg = "NONE" })
    hl(0, "Pmenu", { fg = default_fg, bg = is_dark and c.d_black_40 or c.l_white_10 })
    hl(0, "PmenuSel", { fg = is_dark and c.d_white_10 or c.l_black_10, bg = is_dark and c.d_blue_20 or c.l_gray_220 })
    hl(0, "PmenuMatch", { fg = is_dark and c.d_blue_170 or c.l_blue_80, bold = true })
    hl(0, "PmenuMatchSel", { fg = is_dark and c.d_blue_170 or c.l_blue_80, bold = true })
    hl(0, "PmenuSbar", { fg = "NONE", bg = is_dark and c.d_black_40 or c.l_white_10 })
    hl(0, "PmenuThumb", { fg = "NONE", bg = is_dark and c.d_gray_90 or c.l_gray_160 })
    hl(0, "Question", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = editor_background })
    hl(0, "Search", { fg = "NONE", bg = is_dark and c.d_brown_10 or c.l_orange_30 })
    hl(0, "SpecialKey", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "StatusLine", { fg = default_fg, bg = is_dark and c.d_black_20 or c.l_white_10 })
    hl(0, "StatusLineNC", {
        fg = is_dark and c.d_gray_220 or c.l_gray_30,
        bg = opts.transparent and editor_background or (is_dark and c.d_black_20 or c.l_white_10),
    })
    hl(0, "TabLine", { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = is_dark and c.d_black_20 or c.l_white_10 })
    hl(
        0,
        "TabLineFill",
        { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = is_dark and c.d_black_20 or c.l_white_10 }
    )
    hl(0, "TabLineSel", { fg = is_dark and c.d_white_10 or c.l_gray_10, bg = is_dark and c.d_black_30 or c.l_white_30 })
    hl(0, "Title", { fg = "NONE", bg = "NONE", bold = true })
    hl(0, "Visual", { fg = "NONE", bg = is_dark and c.d_blue_40 or c.l_blue_190 })
    hl(0, "VisualNOS", { fg = "NONE", bg = is_dark and c.d_gray_50 or c.l_blue_220 })
    hl(0, "WarningMsg", { fg = is_dark and c.d_yellow_10 or c.l_yellow_40, bg = editor_background })
    hl(0, "WildMenu", { fg = "NONE", bg = is_dark and c.d_blue_40 or c.l_blue_190 })
    hl(0, "Comment", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE", italic = opts.italic_comments })
    hl(0, "Constant", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "String", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "Character", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "Number", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "Boolean", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "Float", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "Identifier", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "Function", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "Statement", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Conditional", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Repeat", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Label", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Operator", { fg = is_dark and c.d_gray_270 or c.l_black_10, bg = "NONE" })
    hl(0, "Keyword", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Exception", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "PreProc", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Include", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Define", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "Macro", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "Type", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "StorageClass", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "Structure", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "Typedef", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "Special", { fg = is_dark and c.d_yellow_20 or c.l_red_80, bg = "NONE" })
    hl(0, "SpecialChar", { fg = default_fg, bg = "NONE" })
    hl(0, "Tag", { fg = default_fg, bg = "NONE" })
    hl(0, "Delimiter", { fg = default_fg, bg = "NONE" })
    hl(0, "SpecialComment", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE" })
    hl(0, "Debug", { fg = default_fg, bg = "NONE" })
    hl(0, "Underlined", { fg = "NONE", bg = "NONE", underline = true })
    hl(0, "Conceal", { fg = default_fg, bg = editor_background })
    hl(0, "Ignore", { fg = default_fg, bg = "NONE" })
    hl(0, "Error", {
        fg = is_dark and c.d_red_50 or c.l_red_50,
        bg = editor_background,
        undercurl = true,
        sp = is_dark and c.d_red_50 or c.l_red_50,
    })
    hl(0, "Todo", { link = "Comment" })
    hl(0, "SpellBad", { fg = "NONE", undercurl = true, sp = is_dark and c.d_red_60 or c.l_red_70 })
    hl(0, "SpellCap", { fg = "NONE", undercurl = true, sp = is_dark and c.d_yellow_10 or c.l_yellow_40 })
    hl(0, "SpellRare", { fg = "NONE", undercurl = true, sp = is_dark and c.d_blue_50 or c.l_blue_10 })
    hl(0, "SpellLocal", { fg = "NONE", undercurl = true, sp = is_dark and c.d_blue_160 or c.l_blue_90 })
    hl(0, "Whitespace", { fg = is_dark and c.d_gray_60 or c.l_gray_190 })
    hl(0, "NormalFloat", { fg = default_fg, bg = is_dark and c.d_black_40 or c.l_white_10 })
    hl(
        0,
        "FloatBorder",
        { fg = is_dark and c.d_gray_80 or c.l_gray_200, bg = is_dark and c.d_black_40 or c.l_white_10 }
    )
    hl(0, "FloatTitle", { fg = default_fg, bg = is_dark and c.d_black_40 or c.l_white_10, bold = true })
    hl(0, "WinBar", { fg = default_fg, bg = editor_background, bold = true })
    hl(0, "WinBarNc", { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = editor_background })
    hl(0, "QuickFixLine", { bold = true })

    -- Treesitter
    hl(0, "@error", { fg = is_dark and c.d_red_50 or c.l_red_50, bg = "NONE" }) -- Legacy
    hl(0, "@punctuation.bracket", { fg = default_fg, bg = "NONE" })
    hl(0, "@punctuation.special", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@punctuation.special.markdown", { fg = is_dark and c.d_green_50 or c.l_blue_50, bg = "NONE" })
    hl(0, "@punctuation.delimiter", { fg = default_fg, bg = "NONE" })
    hl(0, "@comment", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE", italic = opts.italic_comments })
    hl(0, "@comment.todo", { link = "@comment" })
    hl(0, "@comment.note", { link = "@comment" })
    hl(0, "@comment.warning", { link = "@comment" })
    hl(0, "@comment.error", { link = "@comment" })
    hl(0, "@constant", { fg = is_dark and c.d_blue_190 or c.l_blue_100, bg = "NONE" })
    hl(0, "@constant.builtin", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@constant.macro", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@string", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "@string.regexp", { fg = is_dark and c.d_red_70 or c.l_red_20, bg = "NONE" })
    hl(0, "@string.escape", { fg = is_dark and c.d_yellow_20 or c.l_red_80, bg = "NONE" })
    hl(0, "@string.special", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "@string.special.symbol", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@string.special.url", { link = "@markup.link.url" })
    hl(0, "@character", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "@character.special", { fg = is_dark and c.d_yellow_20 or c.l_red_80, bg = "NONE" })
    hl(0, "@number", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "@number.float", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "@boolean", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@annotation", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@attribute", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@attribute.builtin", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "@module", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "@function", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@function.builtin", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@function.macro", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@function.method", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "@define", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@variable", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@variable.builtin", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@variable.parameter", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@variable.parameter.reference", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@variable.member", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@property", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@constructor", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "@constructor.lua", { fg = default_fg, bg = "NONE" }) -- table braces `{}`
    hl(0, "@label", { fg = is_dark and c.d_gray_250 or c.l_black_10, bg = "NONE" })
    hl(0, "@keyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@keyword.conditional", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.conditional.ternary", { fg = is_dark and c.d_gray_270 or c.l_black_10, bg = "NONE" })
    hl(0, "@keyword.coroutine", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.directive", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.directive.define", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.repeat", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.return", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.exception", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@keyword.import", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "@operator", { fg = is_dark and c.d_gray_270 or c.l_black_10, bg = "NONE" })
    hl(0, "@type", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    -- Primitive types are `support.type` (teal) in most languages, but keywords (blue) in C, C++ and C#
    hl(0, "@type.builtin", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "@type.builtin.c", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@type.builtin.cpp", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@type.builtin.c_sharp", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@type.qualifier", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "@structure", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "@tag", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "@tag.builtin", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "@tag.delimiter", { fg = is_dark and c.d_gray_160 or c.l_red_10, bg = "NONE" })
    hl(0, "@tag.attribute", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })

    -- Language specific scopes that Dark+ / Light+ color differently
    hl(0, "@string.html", { fg = is_dark and c.d_orange_10 or c.l_blue_40, bg = "NONE" })
    hl(0, "@string.xml", { fg = is_dark and c.d_orange_10 or c.l_blue_40, bg = "NONE" })
    for _, lang in ipairs({ "html", "xml" }) do
        -- e.g. the text inside <h1>: VS Code doesn't color it
        hl(0, "@markup.heading." .. lang, { fg = default_fg, bg = "NONE" })
        for level = 1, 6 do
            hl(0, "@markup.heading." .. level .. "." .. lang, { fg = default_fg, bg = "NONE" })
        end
    end
    hl(0, "@property.json", { fg = is_dark and c.d_blue_210 or c.l_blue_50, bg = "NONE" })
    hl(0, "@property.jsonc", { fg = is_dark and c.d_blue_210 or c.l_blue_50, bg = "NONE" })
    hl(0, "@property.yaml", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "@string.yaml", { fg = is_dark and c.d_orange_10 or c.l_blue_40, bg = "NONE" })
    for _, lang in ipairs({ "css", "scss" }) do
        hl(0, "@tag." .. lang, { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
        hl(0, "@type." .. lang, { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
        hl(0, "@constant." .. lang, { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
        hl(0, "@attribute." .. lang, { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
        hl(0, "@property." .. lang, { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
        hl(0, "@variable." .. lang, { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
        hl(0, "@string." .. lang, { fg = is_dark and c.d_orange_10 or c.l_blue_50, bg = "NONE" })
    end

    hl(0, "@text", { fg = default_fg, bg = "NONE" }) -- Legacy
    hl(0, "@markup.strong", { fg = is_dark and c.d_blue_100 or c.l_blue_10, bold = true })
    hl(0, "@markup.italic", { fg = is_dark and c.d_pink_40 or c.l_purple_10, bg = "NONE", italic = true })
    hl(0, "@markup.underline", { fg = "NONE", bg = "NONE", underline = true })
    hl(0, "@markup.strikethrough", { fg = "NONE", bg = "NONE", strikethrough = true })
    hl(0, "@markup.heading", { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
    hl(0, "@markup.raw", { fg = is_dark and c.d_orange_10 or c.l_red_10, bg = "NONE" })
    hl(0, "@markup.raw.block", { fg = default_fg, bg = "NONE" })
    hl(0, "@markup.link", { fg = default_fg, bg = "NONE" })
    hl(
        0,
        "@markup.link.label",
        { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE", underline = opts.underline_links }
    )
    hl(0, "@markup.link.url", { fg = default_fg, bg = "NONE", underline = opts.underline_links })
    hl(0, "@markup.list", { fg = is_dark and c.d_blue_90 or c.l_blue_50, bg = "NONE" })
    hl(0, "@markup.list.checked", { link = "@markup.list" })
    hl(0, "@markup.list.unchecked", { link = "@markup.list" })
    hl(0, "@textReference", { fg = is_dark and c.d_orange_10 or c.l_red_30 })
    hl(0, "@stringEscape", { link = "@string.escape" })

    hl(0, "@diff.plus", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "@diff.minus", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "@diff.delta", { fg = is_dark and c.d_blue_100 or c.l_blue_50, bg = "NONE" })

    -- LSP semantic tokens
    hl(0, "@lsp.typemod.type.defaultLibrary", { link = "@type" })
    hl(0, "@lsp.type.type", { link = "@type" })
    hl(0, "@lsp.type.typeParameter", { link = "@type" })
    hl(0, "@lsp.type.macro", { link = "@constant.macro" })
    hl(0, "@lsp.type.enumMember", { link = "@constant" })
    hl(0, "@lsp.typemod.variable.readonly", { link = "@constant" })
    hl(0, "@lsp.typemod.property.readonly", { link = "@constant" })
    hl(0, "@lsp.typemod.variable.constant", { link = "@constant" })
    hl(0, "@lsp.type.member", { link = "@function" })
    hl(0, "@lsp.type.keyword", { link = "@keyword" })
    hl(0, "@lsp.typemod.keyword.controlFlow", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    -- clangd marks inactive preprocessor regions as comments; VS Code fades them
    hl(0, "@lsp.type.comment.c", { link = "DiagnosticUnnecessary" })
    hl(0, "@lsp.type.comment.cpp", { link = "DiagnosticUnnecessary" })

    -- Markdown
    hl(0, "markdownBold", { fg = is_dark and c.d_blue_100 or c.l_blue_10, bold = true })
    hl(0, "markdownItalic", { fg = is_dark and c.d_pink_40 or c.l_purple_10, italic = true })
    hl(0, "markdownCode", { fg = is_dark and c.d_orange_10 or c.l_red_10, bg = "NONE" })
    hl(0, "markdownRule", { fg = default_fg, bg = "NONE" })
    hl(0, "markdownCodeDelimiter", { fg = default_fg, bg = "NONE" })
    hl(0, "markdownHeadingDelimiter", { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
    for level = 1, 6 do
        hl(0, "markdownH" .. level, { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
    end
    hl(0, "markdownListMarker", { fg = is_dark and c.d_blue_90 or c.l_blue_50, bg = "NONE" })
    hl(0, "markdownOrderedListMarker", { fg = is_dark and c.d_blue_90 or c.l_blue_50, bg = "NONE" })
    hl(0, "markdownBlockquote", { fg = is_dark and c.d_green_50 or c.l_blue_50, bg = "NONE" })
    hl(0, "markdownFootnote", { fg = is_dark and c.d_orange_10 or c.l_red_30, bg = "NONE" })
    hl(0, "markdownFootnoteDefinition", { fg = is_dark and c.d_orange_10 or c.l_red_30 })
    hl(0, "markdownUrl", { fg = default_fg, bg = "NONE", underline = true })
    hl(0, "markdownLinkText", { fg = is_dark and c.d_orange_10 or c.l_red_30 })
    hl(0, "markdownEscape", { fg = is_dark and c.d_yellow_20 or c.l_red_80 })
    for level = 1, 6 do
        hl(0, "RenderMarkdownH" .. level, { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
        hl(0, "RenderMarkdownH" .. level .. "Bg", { bg = editor_background, bold = true })
    end

    -- Asciidoc
    hl(0, "asciidocAttributeEntry", { fg = is_dark and c.d_yellow_20 or c.l_red_10 })
    hl(0, "asciidocAttributeList", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "asciidocAttributeRef", { fg = is_dark and c.d_yellow_20 or c.l_red_10 })
    hl(0, "asciidocHLabel", { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
    hl(0, "asciidocListingBlock", { fg = is_dark and c.d_orange_10 or c.l_red_10 })
    hl(0, "asciidocMacroAttributes", { fg = is_dark and c.d_yellow_20 or c.l_red_10 })
    hl(0, "asciidocOneLineTitle", { fg = is_dark and c.d_blue_100 or c.l_red_10, bold = true })
    hl(0, "asciidocPassthroughBlock", { fg = is_dark and c.d_blue_100 or c.l_blue_40 })
    hl(0, "asciidocQuotedMonospaced", { fg = is_dark and c.d_orange_10 or c.l_red_10 })
    hl(0, "asciidocTriplePlusPassthrough", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20 })
    hl(0, "asciidocMacro", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "asciidocAdmonition", { fg = is_dark and c.d_orange_10 or c.l_red_10 })
    hl(0, "asciidocQuotedEmphasized", { fg = is_dark and c.d_pink_40 or c.l_purple_10, italic = true })
    hl(0, "asciidocQuotedEmphasized2", { fg = is_dark and c.d_pink_40 or c.l_purple_10, italic = true })
    hl(0, "asciidocQuotedEmphasizedItalic", { fg = is_dark and c.d_pink_40 or c.l_purple_10, italic = true })
    hl(0, "asciidocBackslash", { link = "Keyword" })
    hl(0, "asciidocQuotedBold", { link = "markdownBold" })
    hl(0, "asciidocQuotedMonospaced2", { link = "asciidocQuotedMonospaced" })
    hl(0, "asciidocQuotedUnconstrainedBold", { link = "asciidocQuotedBold" })
    hl(0, "asciidocQuotedUnconstrainedEmphasized", { link = "asciidocQuotedEmphasized" })
    hl(0, "asciidocURL", { link = "markdownUrl" })

    -- JSON
    hl(0, "jsonKeyword", { fg = is_dark and c.d_blue_210 or c.l_blue_50, bg = "NONE" })
    hl(0, "jsonEscape", { fg = is_dark and c.d_yellow_20 or c.l_red_80, bg = "NONE" })
    hl(0, "jsonNull", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "jsonBoolean", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })

    -- HTML
    hl(0, "htmlTag", { fg = is_dark and c.d_gray_160 or c.l_red_10, bg = "NONE" })
    hl(0, "htmlEndTag", { fg = is_dark and c.d_gray_160 or c.l_red_10, bg = "NONE" })
    hl(0, "htmlTagName", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "htmlSpecialTagName", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "htmlArg", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "htmlString", { fg = is_dark and c.d_orange_10 or c.l_blue_40, bg = "NONE" })

    -- PHP
    hl(0, "phpStaticClasses", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "phpMethod", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "phpClass", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "phpFunction", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "phpInclude", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "phpUseClass", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "phpRegion", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "phpMethodsVar", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })

    -- CSS
    hl(0, "cssBraces", { fg = default_fg, bg = "NONE" })
    hl(0, "cssInclude", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "cssTagName", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssClassName", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssPseudoClass", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssPseudoClassId", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssPseudoClassLang", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssIdentifier", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "cssProp", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "cssDefinition", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "cssVendor", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "cssStyle", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "cssAttr", { fg = is_dark and c.d_orange_10 or c.l_blue_50, bg = "NONE" })
    hl(0, "cssAttrRegion", { fg = is_dark and c.d_orange_10 or c.l_blue_50, bg = "NONE" })
    hl(0, "cssColor", { fg = is_dark and c.d_orange_10 or c.l_blue_50, bg = "NONE" })
    hl(0, "cssFunction", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "cssFunctionName", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "cssValueNumber", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "cssValueLength", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "cssUnitDecorators", { fg = is_dark and c.d_green_110 or c.l_green_50, bg = "NONE" })
    hl(0, "cssImportant", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })

    -- JavaScript
    hl(0, "jsVariableDef", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsFuncArgs", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsFuncBlock", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsRegexpString", { fg = is_dark and c.d_red_70 or c.l_red_30, bg = "NONE" })
    hl(0, "jsThis", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "jsOperatorKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "jsDestructuringBlock", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsObjectKey", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsGlobalObjects", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "jsModuleKeyword", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsClassDefinition", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "jsClassKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "jsExtendsKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "jsExportDefault", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "jsFuncCall", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "jsObjectValue", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsParen", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsObjectProp", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsIfElseBlock", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsParenIfElse", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsSpreadOperator", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "jsSpreadExpression", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })

    -- Typescript
    hl(0, "typescriptLabel", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptExceptions", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptBraces", { fg = default_fg, bg = "NONE" })
    hl(0, "typescriptEndColons", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptParens", { fg = default_fg, bg = "NONE" })
    hl(0, "typescriptDocTags", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptDocComment", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptLogicSymbols", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptImport", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "typescriptBOM", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptVariableDeclaration", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptVariable", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptExport", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "typescriptAliasDeclaration", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptAliasKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptClassName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptAccessibilityModifier", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptOperator", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptArrowFunc", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptMethodAccessor", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptMember", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "typescriptTypeReference", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptTemplateSB", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "typescriptArrowFuncArg", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptParamImpl", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptFuncComma", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptCastKeyword", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptCall", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptCase", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptReserved", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "typescriptDefault", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptDecorator", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "typescriptPredefinedType", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptClassHeritage", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptClassExtends", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptClassKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptBlock", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptDOMDocProp", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptTemplateSubstitution", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptClassBlock", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptFuncCallArg", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptIndexExpr", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptConditionalParen", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptArray", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "typescriptES6SetProp", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptObjectLiteral", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptTypeParameter", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptEnumKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptEnum", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptLoopParen", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptParenExp", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptModule", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "typescriptAmbientDeclaration", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptFuncTypeArrow", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptInterfaceHeritage", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptInterfaceName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptInterfaceKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptInterfaceExtends", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptGlobal", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "typescriptAsyncFuncKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptFuncKeyword", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "typescriptGlobalMethod", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "typescriptPromiseMethod", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })

    -- XML
    hl(0, "xmlTag", { fg = is_dark and c.d_gray_160 or c.l_red_10, bg = "NONE" })
    hl(0, "xmlTagName", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "xmlEndTag", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "xmlAttrib", { fg = is_dark and c.d_blue_210 or c.l_red_60, bg = "NONE" })
    hl(0, "xmlString", { fg = is_dark and c.d_orange_10 or c.l_blue_40, bg = "NONE" })

    -- Ruby
    hl(0, "rubyClassNameTag", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "rubyClassName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "rubyModuleName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "rubyConstant", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })

    -- Golang
    hl(0, "goPackage", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goImport", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goVar", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goConst", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goStatement", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "goType", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goSignedInts", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goUnsignedInts", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goFloats", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goComplexes", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goBuiltins", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "goBoolean", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goPredefinedIdentifiers", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goTodo", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE" })
    hl(0, "goDeclaration", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goDeclType", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goTypeDecl", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "goTypeName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "goVarAssign", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "goVarDefs", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "goReceiver", { fg = default_fg, bg = "NONE" })
    hl(0, "goReceiverType", { fg = default_fg, bg = "NONE" })
    hl(0, "goFunctionCall", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "goMethodCall", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "goSingleDecl", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })

    -- Python
    hl(0, "pythonStatement", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonOperator", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonException", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "pythonExClass", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "pythonBuiltinObj", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "pythonBuiltinType", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "pythonBoolean", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonNone", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonTodo", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonClassVar", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "pythonClassDef", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })

    -- TeX
    hl(0, "texStatement", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "texBeginEnd", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "texBeginEndName", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "texOption", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "texBeginEndModifier", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "texDocType", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "texDocTypeArgs", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })

    -- Git
    hl(0, "gitcommitHeader", { fg = is_dark and c.d_gray_160 or c.l_black_10, bg = "NONE" })
    hl(0, "gitcommitOnBranch", { fg = is_dark and c.d_gray_160 or c.l_black_10, bg = "NONE" })
    hl(0, "gitcommitBranch", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "gitcommitComment", { fg = is_dark and c.d_gray_160 or c.l_black_10, bg = "NONE" })
    hl(0, "gitcommitSelectedType", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE" })
    hl(0, "gitcommitSelectedFile", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE" })
    hl(0, "gitcommitDiscardedType", { fg = is_dark and c.d_red_50 or c.l_red_90, bg = "NONE" })
    hl(0, "gitcommitDiscardedFile", { fg = is_dark and c.d_red_50 or c.l_red_90, bg = "NONE" })
    hl(0, "gitcommitOverflow", { fg = is_dark and c.d_red_50 or c.l_red_90, bg = "NONE" })
    hl(0, "gitcommitSummary", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "gitcommitBlank", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })

    -- Lua
    hl(0, "luaFuncCall", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "luaFuncArgName", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "luaFuncKeyword", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "luaLocal", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "luaBuiltIn", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })

    -- SH
    hl(0, "shDeref", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })
    hl(0, "shVariable", { fg = is_dark and c.d_blue_210 or c.l_blue_20, bg = "NONE" })

    -- SQL
    hl(0, "sqlKeyword", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "sqlFunction", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "sqlOperator", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })

    -- YAML
    hl(0, "yamlKey", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "yamlBlockMappingKey", { fg = is_dark and c.d_blue_100 or c.l_red_10, bg = "NONE" })
    hl(0, "yamlConstant", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })

    -- Gitgutter (editorGutter.*)
    hl(0, "GitGutterAdd", { fg = is_dark and c.d_green_40 or c.l_green_70, bg = "NONE" })
    hl(0, "GitGutterChange", { fg = is_dark and c.d_blue_70 or c.l_blue_70, bg = "NONE" })
    hl(0, "GitGutterDelete", { fg = is_dark and c.d_red_80 or c.l_red_110, bg = "NONE" })

    -- Git Signs
    hl(0, "GitSignsAdd", { fg = is_dark and c.d_green_40 or c.l_green_70, bg = "NONE" })
    hl(0, "GitSignsChange", { fg = is_dark and c.d_blue_70 or c.l_blue_70, bg = "NONE" })
    hl(0, "GitSignsDelete", { fg = is_dark and c.d_red_80 or c.l_red_110, bg = "NONE" })
    hl(0, "GitSignsAddLn", { link = "DiffAdd" })
    hl(0, "GitSignsChangeLn", { link = "DiffChange" })
    hl(0, "GitSignsDeleteLn", { link = "DiffDelete" })

    -- NvimTree (sideBar.*, list.*, gitDecoration.*)
    local sidebar_background = opts.disable_nvimtree_bg and editor_background
        or (is_dark and c.d_black_20 or c.l_white_10)
    hl(0, "NvimTreeRootFolder", { fg = default_fg, bg = "NONE", bold = true })
    hl(0, "NvimTreeImageFile", { fg = is_dark and c.d_blue_50 or c.l_blue_10, bg = "NONE" })
    hl(0, "NvimTreeEmptyFolderName", { fg = default_fg, bg = "NONE" })
    hl(0, "NvimTreeFolderName", { fg = default_fg, bg = "NONE" })
    hl(0, "NvimTreeSpecialFile", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE", underline = true })
    hl(0, "NvimTreeNormal", { fg = default_fg, bg = sidebar_background })
    hl(0, "NvimTreeCursorLine", { fg = "NONE", bg = is_dark and c.d_gray_30 or c.l_gray_240 })
    hl(0, "NvimTreeVertSplit", { fg = is_dark and c.d_gray_20 or c.l_gray_210, bg = editor_background })
    hl(0, "NvimTreeEndOfBuffer", { fg = sidebar_background })
    hl(0, "NvimTreeOpenedFolderName", { fg = "NONE", bg = sidebar_background })
    hl(0, "NvimTreeGitRenamed", { fg = is_dark and c.d_green_90 or c.l_green_10, bg = "NONE" })
    hl(0, "NvimTreeGitIgnored", { fg = is_dark and c.d_gray_180 or c.l_gray_80, bg = "NONE" })
    hl(0, "NvimTreeGitDeleted", { fg = is_dark and c.d_red_40 or c.l_red_40, bg = "NONE" })
    hl(0, "NvimTreeGitStaged", { fg = is_dark and c.d_yellow_30 or c.l_yellow_10, bg = "NONE" })
    hl(0, "NvimTreeGitMerge", { fg = is_dark and c.d_red_90 or c.l_red_40, bg = "NONE" })
    hl(0, "NvimTreeGitDirty", { fg = is_dark and c.d_yellow_30 or c.l_yellow_10, bg = "NONE" })
    hl(0, "NvimTreeGitNew", { fg = is_dark and c.d_green_90 or c.l_green_10, bg = "NONE" })

    -- Bufferline (tab.*)
    hl(0, "BufferLineIndicatorSelected", { fg = is_dark and c.d_blue_70 or c.l_blue_70, bg = "NONE" })
    hl(
        0,
        "BufferLineFill",
        { fg = "NONE", bg = opts.transparent and editor_background or (is_dark and c.d_black_20 or c.l_white_10) }
    )

    -- BarBar (tab.*)
    local tab_active_fg = is_dark and c.d_white_10 or c.l_gray_10
    local tab_active_bg = is_dark and c.d_black_30 or c.l_white_30
    local tab_inactive_fg = is_dark and c.d_gray_220 or c.l_gray_30
    local tab_inactive_bg = is_dark and c.d_black_20 or c.l_white_10
    local tab_modified_fg = is_dark and c.d_yellow_30 or c.l_yellow_10
    local tab_target_fg = is_dark and c.d_red_60 or c.l_red_70
    hl(0, "BufferCurrent", { fg = tab_active_fg, bg = tab_active_bg })
    hl(0, "BufferCurrentIndex", { fg = tab_active_fg, bg = tab_active_bg })
    hl(0, "BufferCurrentMod", { fg = tab_modified_fg, bg = tab_active_bg })
    hl(0, "BufferCurrentSign", { fg = is_dark and c.d_blue_70 or c.l_blue_70, bg = tab_active_bg })
    hl(0, "BufferCurrentTarget", { fg = tab_target_fg, bg = tab_active_bg })
    hl(0, "BufferVisible", { fg = tab_inactive_fg, bg = tab_active_bg })
    hl(0, "BufferVisibleIndex", { fg = tab_inactive_fg, bg = tab_active_bg })
    hl(0, "BufferVisibleMod", { fg = tab_modified_fg, bg = tab_active_bg })
    hl(0, "BufferVisibleSign", { fg = tab_inactive_fg, bg = tab_active_bg })
    hl(0, "BufferVisibleTarget", { fg = tab_target_fg, bg = tab_active_bg })
    hl(0, "BufferInactive", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferInactiveIndex", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferInactiveMod", { fg = tab_modified_fg, bg = tab_inactive_bg })
    hl(0, "BufferInactiveSign", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferInactiveTarget", { fg = tab_target_fg, bg = tab_inactive_bg })
    hl(0, "BufferTabpage", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferTabpageFill", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferTabpages", { fg = tab_inactive_fg, bg = tab_inactive_bg })
    hl(0, "BufferTabpagesFill", { fg = tab_inactive_fg, bg = tab_inactive_bg })

    -- IndentBlankLine (editorIndentGuide.*)
    hl(0, "IblIndent", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE", nocombine = true })
    hl(0, "IblWhitespace", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE", nocombine = true })
    hl(0, "IblScope", { fg = is_dark and c.d_gray_140 or c.l_gray_100, bg = "NONE", nocombine = true })

    -- Snacks.indent
    hl(0, "SnacksIndent", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE", nocombine = true })
    hl(0, "SnacksIndentScope", { fg = is_dark and c.d_gray_140 or c.l_gray_100, bg = "NONE", nocombine = true })

    -- Neotest
    hl(0, "NeotestAdapterName", { fg = default_fg, bold = true })
    hl(0, "NeotestDir", { fg = is_dark and c.d_blue_100 or c.l_blue_40 })
    hl(0, "NeotestExpandMarker", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "NeotestFailed", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "NeotestFile", { fg = is_dark and c.d_blue_100 or c.l_blue_40 })
    hl(0, "NeotestFocused", { bold = true })
    hl(0, "NeotestIndent", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "NeotestMarked", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bold = true })
    hl(0, "NeotestNamespace", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "NeotestPassed", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "NeotestRunning", { fg = is_dark and c.d_yellow_50 or c.l_yellow_30 })
    hl(0, "NeotestSkipped", { fg = is_dark and c.d_blue_100 or c.l_blue_40 })
    hl(0, "NeotestTarget", { fg = is_dark and c.d_red_70 or c.l_red_30 })
    hl(0, "NeotestWatching", { fg = is_dark and c.d_yellow_50 or c.l_yellow_30 })
    hl(0, "NeotestWinSelect", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bold = true })

    -- LSP (editorError.*, editorWarning.*, editorInfo.*, editorHint.*, editor.wordHighlight*, editorInlayHint.*)
    hl(0, "DiagnosticOk", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "DiagnosticError", { fg = is_dark and c.d_red_60 or c.l_red_70, bg = "NONE" })
    hl(0, "DiagnosticWarn", { fg = is_dark and c.d_yellow_10 or c.l_yellow_40, bg = "NONE" })
    hl(0, "DiagnosticInfo", { fg = is_dark and c.d_blue_160 or c.l_blue_90, bg = "NONE" })
    hl(0, "DiagnosticHint", { fg = is_dark and c.d_gray_240 or c.l_gray_50, bg = "NONE" })
    -- VS Code fades unnecessary code (editorUnnecessaryCode.opacity); approximate with faded text
    hl(0, "DiagnosticUnnecessary", { fg = is_dark and c.d_gray_190 or c.l_gray_120, bg = "NONE" })
    hl(0, "DiagnosticDeprecated", { strikethrough = true })
    hl(
        0,
        "DiagnosticUnderlineError",
        { fg = "NONE", bg = "NONE", undercurl = true, sp = is_dark and c.d_red_60 or c.l_red_70 }
    )
    hl(
        0,
        "DiagnosticUnderlineWarn",
        { fg = "NONE", bg = "NONE", undercurl = true, sp = is_dark and c.d_yellow_10 or c.l_yellow_40 }
    )
    hl(
        0,
        "DiagnosticUnderlineInfo",
        { fg = "NONE", bg = "NONE", undercurl = true, sp = is_dark and c.d_blue_160 or c.l_blue_90 }
    )
    hl(
        0,
        "DiagnosticUnderlineHint",
        { fg = "NONE", bg = "NONE", underdotted = true, sp = is_dark and c.d_gray_240 or c.l_gray_50 }
    )
    hl(0, "LspReferenceText", { fg = "NONE", bg = is_dark and c.d_gray_100 or c.l_gray_180 })
    hl(0, "LspReferenceRead", { fg = "NONE", bg = is_dark and c.d_gray_100 or c.l_gray_180 })
    hl(0, "LspReferenceWrite", { fg = "NONE", bg = is_dark and c.d_blue_30 or c.l_blue_200 })
    hl(0, "LspInlayHint", {
        fg = is_dark and c.d_gray_200 or c.l_gray_110,
        bg = is_dark and c.d_black_50 or c.l_white_20,
        italic = opts.italic_inlayhints,
    })
    hl(0, "LspSignatureActiveParameter", { fg = is_dark and c.d_blue_170 or c.l_blue_80, bold = true })
    hl(0, "LspCodeLens", { fg = is_dark and c.d_gray_210 or c.l_gray_90 })
    hl(0, "LspCodeLensSeparator", { fg = is_dark and c.d_gray_210 or c.l_gray_90 })

    -- Trouble
    hl(0, "TroubleNormal", { link = "Normal" })
    hl(0, "TroubleNormalNC", { link = "Normal" })

    -- COC.nvim
    hl(0, "CocHighlightText", { link = "LspReferenceText" })
    hl(0, "CocHighlightRead", { link = "LspReferenceRead" })
    hl(0, "CocHighlightWrite", { link = "LspReferenceWrite" })
    hl(0, "CocFloating", { link = "NormalFloat" })
    hl(0, "CocMenuSel", { link = "PmenuSel" })
    hl(0, "CocSearch", { link = "PmenuMatch" })

    -- Completion item kinds (symbolIcon.*), shared by nvim-cmp and blink.cmp
    local kind_purple = is_dark and c.d_purple_20 or c.l_purple_20
    local kind_orange = is_dark and c.d_orange_20 or c.l_orange_10
    local kind_blue = is_dark and c.d_blue_200 or c.l_blue_120
    local kind_colors = {
        Function = kind_purple,
        Method = kind_purple,
        Constructor = kind_purple,
        Class = kind_orange,
        Enum = kind_orange,
        Event = kind_orange,
        Variable = kind_blue,
        Field = kind_blue,
        Interface = kind_blue,
        EnumMember = kind_blue,
    }
    -- stylua: ignore
    local kinds = {
        'Text', 'Method', 'Function', 'Constructor', 'Field', 'Variable', 'Class', 'Interface', 'Module',
        'Property', 'Unit', 'Value', 'Enum', 'Keyword', 'Snippet', 'Color', 'File', 'Reference', 'Folder',
        'EnumMember', 'Constant', 'Struct', 'Event', 'Operator', 'TypeParameter',
    }
    for _, kind in ipairs(kinds) do
        hl(0, "CmpItemKind" .. kind, { fg = kind_colors[kind] or default_fg, bg = "NONE" })
        hl(0, "BlinkCmpKind" .. kind, { fg = kind_colors[kind] or default_fg, bg = "NONE" })
    end
    local completion_detail_fg = is_dark and c.d_gray_220 or c.l_gray_10 -- descriptionForeground
    local completion_ghost_fg = is_dark and c.d_gray_130 or c.l_gray_70 -- editorGhostText.foreground

    -- Nvim cmp
    hl(0, "CmpItemKind", { link = "Pmenu" })
    hl(0, "CmpItemMenu", { fg = completion_detail_fg, bg = "NONE" })
    hl(0, "CmpItemAbbr", { fg = default_fg, bg = "NONE" })
    hl(0, "CmpItemAbbrDeprecated", { fg = is_dark and c.d_gray_190 or c.l_gray_120, bg = "NONE", strikethrough = true })
    hl(0, "CmpItemAbbrMatch", { link = "PmenuMatch" })
    hl(0, "CmpItemAbbrMatchFuzzy", { link = "PmenuMatch" })
    hl(0, "CmpGhostText", { fg = completion_ghost_fg })

    -- Blink
    hl(0, "BlinkCmpMenu", { link = "Pmenu" })
    hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
    hl(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
    hl(0, "BlinkCmpScrollBarThumb", { link = "PmenuThumb" })
    hl(0, "BlinkCmpScrollBarGutter", { link = "PmenuSbar" })
    hl(0, "BlinkCmpLabel", { fg = default_fg, bg = "NONE" })
    hl(0, "BlinkCmpLabelDeprecated", { link = "CmpItemAbbrDeprecated" })
    hl(0, "BlinkCmpLabelMatch", { link = "PmenuMatch" })
    hl(0, "BlinkCmpLabelDetail", { fg = completion_detail_fg, bg = "NONE" })
    hl(0, "BlinkCmpLabelDescription", { fg = completion_detail_fg, bg = "NONE" })
    hl(0, "BlinkCmpKind", { fg = default_fg, bg = "NONE" })
    hl(0, "BlinkCmpSource", { fg = completion_detail_fg, bg = "NONE" })
    hl(0, "BlinkCmpGhostText", { fg = completion_ghost_fg })
    hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
    hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
    hl(0, "BlinkCmpDocSeparator", { link = "FloatBorder" })
    hl(0, "BlinkCmpDocCursorLine", { link = "Visual" })
    hl(0, "BlinkCmpSignatureHelp", { link = "NormalFloat" })
    hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })
    hl(0, "BlinkCmpSignatureHelpActiveParameter", { link = "LspSignatureActiveParameter" })
    hl(0, "BlinkCmpKindCopilot", { fg = default_fg, bg = "NONE" })

    -- HiPhish/rainbow-delimiters.nvim (editorBracketHighlight.foreground1-3, cycling)
    local bracket_1 = is_dark and c.d_yellow_60 or c.l_blue_60
    local bracket_2 = is_dark and c.d_pink_30 or c.l_green_60
    local bracket_3 = is_dark and c.d_blue_120 or c.l_brown_10
    -- rainbow-delimiters' default order is Red, Yellow, Blue, Orange, Green, Violet, Cyan
    hl(0, "RainbowDelimiterRed", { fg = bracket_1, bg = "NONE" })
    hl(0, "RainbowDelimiterYellow", { fg = bracket_2, bg = "NONE" })
    hl(0, "RainbowDelimiterBlue", { fg = bracket_3, bg = "NONE" })
    hl(0, "RainbowDelimiterOrange", { fg = bracket_1, bg = "NONE" })
    hl(0, "RainbowDelimiterGreen", { fg = bracket_2, bg = "NONE" })
    hl(0, "RainbowDelimiterViolet", { fg = bracket_3, bg = "NONE" })
    hl(0, "RainbowDelimiterCyan", { fg = bracket_1, bg = "NONE" })

    -- rcarriga/nvim-dap-ui
    -- Source: https://github.com/rcarriga/nvim-dap-ui/blob/master/lua/dapui/config/highlights.lua
    hl(0, "DapUIBreakpointsCurrentLine", { fg = is_dark and c.d_green_80 or c.l_blue_110, bold = true })
    hl(0, "DapUIBreakpointsDisabledLine", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "DapUIBreakpointsInfo", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIBreakpointsLine", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIBreakpointsPath", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUICurrentFrameName", { fg = is_dark and c.d_green_80 or c.l_blue_110, bold = true })
    hl(0, "DapUIDecoration", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUILineNumber", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIModifiedValue", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bold = true })
    hl(0, "DapUIPlayPause", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIPlayPauseNC", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIRestart", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIRestartNC", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIScope", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUISource", { fg = is_dark and c.d_blue_150 or c.l_blue_170 })
    hl(0, "DapUIStepBack", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepBackNC", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepInto", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepIntoNC", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepOut", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepOutNC", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepOver", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStepOverNC", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIStop", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "DapUIStopNC", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "DapUIStoppedThread", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIThread", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIType", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "DapUIUnavailable", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "DapUIUnavailableNC", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "DapUIWatchesEmpty", { fg = is_dark and c.d_gray_110 or c.l_blue_210 })
    hl(0, "DapUIWatchesError", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "DapUIWatchesValue", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "DapUIWinSelect", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bold = true })

    -- Dashboard
    hl(0, "DashboardHeader", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "DashboardDesc", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "DashboardIcon", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "DashboardShortCut", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "DashboardKey", { fg = default_fg, bg = "NONE" })
    hl(0, "DashboardFooter", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE", italic = true })

    -- Illuminate
    hl(0, "illuminatedWord", { link = "LspReferenceText" })
    hl(0, "illuminatedCurWord", { link = "LspReferenceText" })
    hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
    hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
    hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })

    -- mini.statusline (statusBar.*)
    local statusline_background = is_dark and c.d_black_20 or c.l_white_10
    local statusline_section_background = is_dark and c.d_gray_20 or c.l_gray_210
    local statusline_accent = is_dark and c.d_blue_70 or c.l_blue_70
    hl(
        0,
        "MiniStatuslineModeNormal",
        { fg = is_dark and c.d_white_10 or c.l_white_30, bg = statusline_accent, bold = true }
    )
    hl(
        0,
        "MiniStatuslineModeInsert",
        { fg = editor_background, bg = is_dark and c.d_blue_210 or c.l_blue_20, bold = true }
    )
    hl(
        0,
        "MiniStatuslineModeVisual",
        { fg = editor_background, bg = is_dark and c.d_pink_40 or c.l_purple_30, bold = true }
    )
    hl(
        0,
        "MiniStatuslineModeReplace",
        { fg = editor_background, bg = is_dark and c.d_yellow_20 or c.l_red_10, bold = true }
    )
    hl(
        0,
        "MiniStatuslineModeCommand",
        { fg = editor_background, bg = is_dark and c.d_red_70 or c.l_red_30, bold = true }
    )
    hl(
        0,
        "MiniStatuslineModeOther",
        { fg = is_dark and c.d_white_10 or c.l_white_30, bg = statusline_accent, bold = true }
    )
    hl(0, "MiniStatuslineDevinfo", { fg = default_fg, bg = statusline_section_background })
    hl(0, "MiniStatuslineFilename", { fg = default_fg, bg = statusline_background })
    hl(0, "MiniStatuslineFileinfo", { fg = default_fg, bg = statusline_section_background })
    hl(
        0,
        "MiniStatuslineInactive",
        { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = is_dark and c.d_black_30 or c.l_white_10 }
    )

    -- mini.icons
    hl(0, "MiniIconsAzure", { fg = is_dark and c.d_blue_100 or c.l_blue_40 })
    hl(0, "MiniIconsBlue", { fg = is_dark and c.d_blue_150 or c.l_blue_170 })
    hl(0, "MiniIconsCyan", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "MiniIconsGreen", { fg = is_dark and c.d_green_50 or c.l_green_30 })
    hl(0, "MiniIconsGrey", { fg = default_fg })
    hl(0, "MiniIconsOrange", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "MiniIconsPurple", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "MiniIconsRed", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "MiniIconsYellow", { fg = is_dark and c.d_yellow_50 or c.l_yellow_30 })

    -- Neotree (sideBar.*, list.*)
    hl(0, "NeoTreeBufferNumber", { fg = is_dark and c.d_gray_150 or c.l_gray_60, bg = "NONE" })
    hl(0, "NeoTreeCursorLine", { fg = "NONE", bg = is_dark and c.d_gray_30 or c.l_gray_240 })
    hl(0, "NeoTreeDimText", { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = "NONE" })
    hl(0, "NeoTreeDirectoryIcon", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "NeoTreeDirectoryName", { fg = default_fg, bg = "NONE" })
    hl(0, "NeoTreeDotfile", { fg = is_dark and c.d_blue_110 or c.l_blue_150, bg = "NONE" })
    hl(0, "NeoTreeFileIcon", { fg = is_dark and c.d_blue_50 or c.l_blue_10, bg = "NONE" })
    hl(0, "NeoTreeFileName", { fg = default_fg, bg = "NONE" })
    hl(0, "NeoTreeFileNameOpened", { fg = default_fg, bg = "NONE", bold = true })
    hl(0, "NeoTreeFilterTerm", { link = "PmenuMatch" })
    hl(0, "NeoTreeFloatBorder", { link = "FloatBorder" })
    hl(0, "NeoTreeFloatTitle", { link = "FloatTitle" })
    hl(0, "NeoTreeTitleBar", { link = "FloatTitle" })
    hl(0, "NeoTreeIndentMarker", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE" })

    -- Snacks nvim
    hl(0, "SnacksPicker", { link = "Normal" })
    hl(0, "SnacksPickerBorder", { fg = is_dark and c.d_gray_80 or c.l_gray_200, bg = editor_background })
    hl(0, "SnacksPickerDir", { fg = "NONE", bg = "NONE", nocombine = true })
    hl(0, "SnacksPickerDirectory", { fg = "NONE", bg = "NONE", nocombine = true })
    hl(0, "SnacksPickerMatch", { link = "PmenuMatch" })
    hl(0, "SnacksPickerListCursorLine", { link = "PmenuSel" })
    hl(0, "SnacksPickerPreviewCursorLine", { fg = "none", bg = "none", nocombine = true })

    -- Compiler mode nvim
    hl(0, "CompileModeMessage", { underline = true })
    hl(0, "CompileModeMessageRow", { fg = is_dark and c.d_pink_40 or c.l_purple_30 })
    hl(0, "CompileModeMessageCol", { fg = is_dark and c.d_green_80 or c.l_blue_110 })
    hl(0, "CompileModeError", { fg = is_dark and c.d_red_50 or c.l_red_90 })
    hl(0, "CompileModeWarning", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20 })
    hl(0, "CompileModeInfo", { fg = is_dark and c.d_green_50 or c.l_green_30 })
    hl(0, "CompileModeCommandOutput", { fg = is_dark and c.d_blue_140 or c.l_blue_160 })
    hl(0, "CompileModeDirectoryMessage", { fg = is_dark and c.d_blue_140 or c.l_blue_160 })
    hl(0, "CompileModeOutputFile", { fg = is_dark and c.d_purple_10 or c.l_purple_40 })
    hl(0, "CompileModeCheckResult", { fg = is_dark and c.d_orange_30 or c.l_orange_20, bold = true })
    hl(0, "CompileModeCheckTarget", { fg = is_dark and c.d_orange_30 or c.l_orange_20 })
    hl(0, "CompileModeErrorLocus", { link = "Visual" })

    -- Copilot (editorGhostText.foreground)
    hl(0, "CopilotSuggestion", { fg = completion_ghost_fg, bg = "NONE" })

    -- NeogitOrg/neogit (diffEditor.*, gitDecoration.*)
    hl(0, "NeogitWinSeparator", { link = "WinSeparator" })
    hl(
        0,
        "NeogitDiffAdd",
        { fg = is_dark and c.d_green_70 or c.l_green_40, bg = is_dark and c.d_green_20 or c.l_green_110 }
    )
    hl(
        0,
        "NeogitDiffAddHighlight",
        { fg = is_dark and c.d_green_70 or c.l_green_40, bg = is_dark and c.d_green_30 or c.l_green_90 }
    )
    hl(0, "NeogitDiffContext", { fg = default_fg, bg = is_dark and c.d_black_20 or c.l_white_10 })
    hl(0, "NeogitDiffContextHighlight", { fg = default_fg, bg = is_dark and c.d_gray_10 or c.l_gray_230 })
    hl(0, "NeogitDiffDelete", { fg = is_dark and c.d_red_40 or c.l_red_40, bg = is_dark and c.d_red_10 or c.l_red_130 })
    hl(
        0,
        "NeogitDiffDeleteHighlight",
        { fg = is_dark and c.d_red_40 or c.l_red_40, bg = is_dark and c.d_red_20 or c.l_red_120 }
    )
    hl(0, "NeogitDiffHeader", { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = editor_background })
    hl(0, "NeogitDiffHeaderHighlight", { fg = is_dark and c.d_gray_220 or c.l_gray_30, bg = editor_background })
    hl(
        0,
        "NeogitHunkHeader",
        { fg = is_dark and c.d_yellow_30 or c.l_yellow_10, bg = is_dark and c.d_black_20 or c.l_white_10 }
    )
    hl(
        0,
        "NeogitHunkHeaderHighlight",
        { fg = is_dark and c.d_yellow_30 or c.l_yellow_10, bg = is_dark and c.d_gray_10 or c.l_gray_230 }
    )
    -- Cursor line highlights cause way too much distraction; rely on the
    -- pointer and regular highlight colors:
    hl(0, "NeogitDiffAddCursor", { link = "NeogitDiffAddHighlight" })
    hl(0, "NeogitDiffContextCursor", { link = "NeogitDiffContextHighlight" })
    hl(0, "NeogitDiffDeleteCursor", { link = "NeogitDiffDeleteHighlight" })
    hl(0, "NeogitHunkHeaderCursor", { link = "NeogitHunkHeaderHighlight" })

    -- Which key
    hl(0, "WhichKeyIconAzure", { fg = is_dark and c.d_green_80 or c.l_blue_110, bg = "NONE" })
    hl(0, "WhichKeyIconBlue", { fg = is_dark and c.d_blue_100 or c.l_blue_40, bg = "NONE" })
    hl(0, "WhichKeyIconGreen", { fg = is_dark and c.d_green_50 or c.l_green_30, bg = "NONE" })
    hl(0, "WhichKeyIconGrey", { fg = is_dark and c.d_gray_160 or c.l_black_10, bg = "NONE" })
    hl(0, "WhichKeyIconOrange", { fg = is_dark and c.d_yellow_20 or c.l_red_10, bg = "NONE" })
    hl(0, "WhichKeyIconPurple", { fg = is_dark and c.d_pink_40 or c.l_purple_30, bg = "NONE" })
    hl(0, "WhichKeyIconRed", { fg = is_dark and c.d_red_50 or c.l_red_90, bg = "NONE" })
    hl(0, "WhichKeyIconYellow", { fg = is_dark and c.d_yellow_40 or c.l_yellow_20, bg = "NONE" })
    hl(0, "WhichKeySeparator", { link = "Normal" })
    hl(0, "WhichKeyValue", { link = "Normal" })

    -- Floating window borders of various plugins (editorWidget.border)
    local float_border = is_dark and c.d_gray_80 or c.l_gray_200
    -- stylua: ignore
    for _, group in ipairs({
        'WhichKeyBorder', 'DapUIFloatBorder', 'LspFloatWinBorder', 'LspInfoBorder', 'LspSagaHoverBorder',
        'LspSagaSignatureHelpBorder', 'LspSagaCodeActionBorder', 'LspSagaDefPreviewBorder', 'LspLinesDiagBorder',
        'LspSagaRenameBorder', 'LSPSagaDiagnosticTruncateLine', 'LspSagaDiagnosticBorder', 'LspSagaShTruncateLine',
        'LspSagaDocTruncateLine', 'LspSagaLspFinderBorder', 'TelescopePromptBorder', 'TelescopeResultsBorder',
        'TelescopePreviewBorder',
    }) do
        hl(0, group, { fg = float_border, bg = 'NONE' })
    end
    hl(0, "LspFloatWinNormal", { fg = default_fg, bg = "NONE" })
    hl(0, "LspSagaBorderTitle", { fg = default_fg, bg = "NONE" })

    -- NvimTree
    hl(0, "NvimTreeFolderIcon", { fg = is_dark and c.d_blue_100 or c.l_blue_120, bg = "NONE" })
    hl(0, "NvimTreeIndentMarker", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE" })

    -- Telescope (quickInput.*, list.*)
    hl(0, "TelescopeNormal", { fg = default_fg, bg = "NONE" })
    hl(0, "TelescopeSelection", { link = "PmenuSel" })
    hl(0, "TelescopeMultiSelection", { link = "PmenuSel" })
    hl(0, "TelescopeMatching", { link = "PmenuMatch" })
    hl(0, "TelescopePromptPrefix", { fg = default_fg, bg = "NONE" })

    -- Debugging (editor.stackFrameHighlightBackground)
    hl(0, "debugPC", { bg = is_dark and c.d_brown_20 or c.l_yellow_60 })

    -- symbols-outline (list.activeSelection*, editorIndentGuide.*)
    hl(0, "FocusedSymbol", { link = "PmenuSel" })
    hl(0, "SymbolsOutlineConnector", { fg = is_dark and c.d_gray_70 or c.l_gray_170, bg = "NONE" })
end

theme.link_highlight = function()
    -- Legacy groups for official git.vim and diff.vim syntax
    hl(0, "diffAdded", { link = "@diff.plus" })
    hl(0, "diffChanged", { link = "@diff.delta" })
    hl(0, "diffRemoved", { link = "@diff.minus" })
    -- Legacy groups for treesitter
    hl(0, "@parameter", { link = "@variable.parameter" })
    hl(0, "@field", { link = "@variable.member" })
    hl(0, "@string.regex", { link = "@string.regexp" })
    hl(0, "@float", { link = "@number.float" })
    hl(0, "@namespace", { link = "@module" })
    hl(0, "@method", { link = "@function.method" })
    hl(0, "@field", { link = "@variable.member" })
    hl(0, "@conditional", { link = "@keyword.conditional" })
    hl(0, "@repeat", { link = "@keyword.repeat" })
    hl(0, "@exception", { link = "@keyword.exception" })
    hl(0, "@storageclass", { link = "@keyword.storage" })
    hl(0, "@include", { link = "@keyword.import" })
    hl(0, "@text.strong", { link = "@markup.strong" })
    hl(0, "@text.underline", { link = "@markup.underline" })
    hl(0, "@text.emphasis", { link = "@markup.italic" })
    hl(0, "@text.strike", { link = "@markup.strikethrough" })
    hl(0, "@text.title", { link = "@markup.heading" })
    hl(0, "@text.uri", { link = "@markup.link.url" })
    hl(0, "@text.literal", { link = "@markup.raw" })
    hl(0, "@text.note", { link = "@comment.note" })
    hl(0, "@text.warning", { link = "@comment.warning" })
    hl(0, "@text.danger", { link = "@comment.error" })
    hl(0, "@text.diff.add", { link = "@diff.plus" })
    hl(0, "@text.diff.delete", { link = "@diff.minus" })
    -- Nvim compe
    hl(0, "CompeDocumentation", { link = "Pmenu" })
    hl(0, "CompeDocumentationBorder", { link = "Pmenu" })
end

return theme
