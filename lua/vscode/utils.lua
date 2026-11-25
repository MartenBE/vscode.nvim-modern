local utils = {}

---Sets the terminal colors to VS Code's defaults for the integrated terminal (`terminal.ansi*`).
---@param c table<string,string> palette from `vscode.colors.get_colors()`
---@param opts table `vscode.config.opts`
utils.terminal = function(c, opts)
    local is_dark = vim.o.background == "dark"

    -- black
    vim.g.terminal_color_0 = opts.transparent and "NONE" or (is_dark and c.d_black_10 or c.l_black_10)
    vim.g.terminal_color_8 = is_dark and c.d_gray_120 or c.l_gray_40

    -- red
    vim.g.terminal_color_1 = is_dark and c.d_red_30 or c.l_red_50
    vim.g.terminal_color_9 = is_dark and c.d_red_60 or c.l_red_100

    -- green
    vim.g.terminal_color_2 = is_dark and c.d_green_60 or c.l_green_20
    vim.g.terminal_color_10 = is_dark and c.d_green_100 or c.l_green_80

    -- yellow
    vim.g.terminal_color_3 = is_dark and c.d_yellow_70 or c.l_brown_20
    vim.g.terminal_color_11 = is_dark and c.d_yellow_80 or c.l_yellow_50

    -- blue
    vim.g.terminal_color_4 = is_dark and c.d_blue_60 or c.l_blue_50
    vim.g.terminal_color_12 = is_dark and c.d_blue_80 or c.l_blue_140

    -- magenta
    vim.g.terminal_color_5 = is_dark and c.d_pink_10 or c.l_pink_10
    vim.g.terminal_color_13 = is_dark and c.d_pink_20 or c.l_pink_20

    -- cyan
    vim.g.terminal_color_6 = is_dark and c.d_blue_130 or c.l_blue_130
    vim.g.terminal_color_14 = is_dark and c.d_blue_180 or c.l_blue_180

    -- white
    vim.g.terminal_color_7 = is_dark and c.d_gray_280 or c.l_gray_20
    vim.g.terminal_color_15 = is_dark and c.d_gray_280 or c.l_gray_130
end

return utils
