-- Copyright (c) 2020-2021 Mofiqul Islam
-- MIT license, see LICENSE for more details.
local config = require('vscode.config')
local vscode = {}
local colors = {}

-- Follows VS Code's Dark Modern / Light Modern status bar (statusBar.*); the normal mode uses the
-- accent color, the other modes keep their own hue in section a. Section b uses the status bar text color
-- (statusBar.foreground), like the starship prompt and the wezterm tab bar.
if vim.o.background == 'dark' then
    colors.inactive = '#9D9D9D'
    colors.bg = '#181818'
    colors.bg2 = '#2B2B2B'
    colors.fg = '#CCCCCC'
    colors.accent_fg = '#FFFFFF'
    colors.red = '#F44747'
    colors.green = '#4EC9B0'
    colors.blue = '#0078D4'
    colors.lightblue = '#5CB6F8'
    colors.yellow = '#FFAF00'
    colors.pink = '#DDB6F2'
else
    colors.inactive = '#616161'
    colors.bg = '#F8F8F8'
    colors.bg2 = '#E5E5E5'
    colors.fg = '#3B3B3B'
    colors.accent_fg = '#FFFFFF'
    colors.red = '#FF0000'
    colors.green = '#008000'
    colors.blue = '#005FB8'
    colors.lightblue = '#0451A5'
    colors.yellow = '#C08000'
    colors.pink = '#FFA3A3'
end

vscode.normal = {
    a = { fg = colors.accent_fg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
    c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.visual = {
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.inactive = {
    a = { fg = colors.inactive, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.inactive, bg = config.opts.transparent and 'NONE' or colors.bg },
    c = { fg = colors.inactive, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.replace = {
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.red, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
    c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.insert = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
    c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.terminal = {
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
    c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

vscode.command = {
    a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.pink, gui = 'bold' },
    b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
    c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
}

return vscode
