# AGENTS.md

Guidance for coding agents working in this repository.

## What this is

`vscode.nvim` is a Neovim colorscheme plugin: pure Lua, no build step, no dependencies. It ports VS Code's Dark Modern / Light Modern themes, with syntax colors from Dark+ / Light+. Plugin managers load the repo directly, so the repo layout *is* the runtime layout (`colors/`, `lua/`).

## Commands

```sh
tests/run.sh                          # diff highlights against the committed snapshots
./lint.sh                             # StyLua check on all git-tracked Lua files

# regenerate a snapshot after an intentional color change (from the repo root), then read the diff
nvim --headless --clean --cmd "set rtp+=$PWD" -l tests/snapshot.lua dark >tests/snapshots/dark.txt
nvim --headless --clean --cmd "set rtp+=$PWD" -l tests/snapshot.lua light >tests/snapshots/light.txt

git ls-files -z '*.lua' | xargs -0 stylua   # format all tracked Lua files
```

CI is `.github/workflows/test.yml`. It runs `tests/run.sh` against Ubuntu's packaged Neovim, and `./lint.sh` against the latest StyLua from npm (`@johnnymorganz/stylua-bin`). There is no linter beyond the StyLua check. Formatting uses StyLua with 4-space indentation (from `.editorconfig`) and StyLua's default double quotes. Format Lua after editing it, or CI fails.

To check anything visual, run Neovim with the plugin on `runtimepath` and reload it. Pass `"light"` or `"dark"` to `load()`, then use `:Inspect` to see which highlight groups apply under the cursor and `:hi SomeGroup` to see a group's resolved attributes:

```vim
:lua package.loaded["vscode.theme"] = nil
:lua package.loaded["vscode.colors"] = nil
:lua require("vscode").load("light")
:Inspect
:hi SomeGroup
```

Commits use conventional-commit prefixes (`feat:`, `fix:`, …).

## Architecture

Load path: `colors/vscode.lua` (what `:colorscheme vscode` runs) → `require('vscode').load(style?)` in `lua/vscode/init.lua`. `load()` then:

1. clears highlights
2. sets `vim.o.background` from `style` or `opts.style`
3. sets the terminal colors via `utils.terminal()`
4. calls `theme.set_highlights(opts)` and `theme.link_highlight()`
5. applies the user's `group_overrides` last

- **`lua/vscode/config.lua`**: the options table. `config.setup()` runs at require time with defaults, so `load()` works without a user `setup()` call. Legacy `vim.g.vscode_*` globals are read first and user opts override them. When adding an option, support both paths.
- **`lua/vscode/colors.lua`**: the palette. `get_colors()` returns one flat table holding **both** themes' colors (it never branches on `background`) and then merges `color_overrides`.
  - Keys look like `<theme>_<family>_<rank>`:
    - theme: `d_` or `l_`
    - family: one of 11 basic color names (black, white, gray, red, brown, orange, yellow, green, blue, purple, pink)
    - rank: 10, 20, 30… from darkest to lightest within the family, by CIE L*
  - Ranks have no gaps. To add a color, insert it in L* order and renumber the rest of that family. Update every reference in `theme.lua`, `utils.lua` and the docs as one simultaneous rename, so `_20`→`_30` doesn't chain into `_30`→`_40`.
  - There are no semantic aliases, so overriding a key changes every use of that color.
- **`lua/vscode/theme.lua`**: about 930 lines of `hl(...)` calls (`local hl = vim.api.nvim_set_hl`, line 1).
  - Sections, each with a comment header, in order: core UI → Treesitter → LSP semantic tokens → per-language → per-plugin. `theme.link_highlight()` holds legacy-name links.
  - Section comments name the VS Code color keys a group is derived from, e.g. `-- Bufferline (tab.*)`. Keep doing this.
  - Use palette keys only, never literal hex.
  - `default_fg` is `editor.foreground`. `editor_background` is `d_black_30` / `l_white_30`, or `"NONE"` when `opts.transparent`. Use these locals, not raw keys, wherever the editor's foreground or background is meant, so `transparent = true` keeps working.
- **`lua/vscode/utils.lua`**: maps the palette onto `vim.g.terminal_color_0..15` (VS Code's `terminal.ansi*`).
- **`lua/lualine/themes/vscode.lua`**: a separate lualine theme with its **own hardcoded hex palette**, independent of `colors.lua`. It branches on `vim.o.background` when it is required. Lualine finds it through `runtimepath`, not through `require('vscode')`. Palette changes don't reach it on their own.
- **Treesitter captures are used as-is.** The plugin ships no `after/queries` overrides. Where nvim-treesitter captures a token differently from VS Code's scopes (e.g. `async` as `@keyword.coroutine`, JSX components as `@tag`), accept upstream's capture. Don't add query overrides; color the existing capture groups in `theme.lua` instead.

### Light and dark

Every color attribute chooses its theme inline with a ternary:

```lua
fg = is_dark and c.d_blue_100 or c.l_blue_40
```

Never use a `d_` key on the light side or an `l_` key on the dark side. When an option condition is combined with a theme choice, parenthesise each arm:

```lua
bg = opts.transparent and editor_background or (is_dark and c.d_black_20 or c.l_white_10)
```

When groups share one value, compute it once into a local and loop over the group names (see the floating-border block near the end of `set_highlights`).

## Tests

The tests only detect changes. `tests/snapshots/{dark,light}.txt` list every highlight group `theme.lua` sets, and `tests/run.sh` diffs current output against them, running one `nvim` process per background.

- `tests/snapshot.lua` wraps `vim.api.nvim_set_hl` *before* `vscode.theme` is first required, so the theme's `local hl` binding picks up the wrapper. That records only the groups this plugin sets. `nvim_get_hl(0, {})` would also return Neovim's built-in defaults and churn the snapshots on every Neovim upgrade.
- It sets `vim.o.background` before loading. Assigning it afterwards would re-source the colorscheme and run the theme twice.
- Not covered: the lualine theme and `vim.g.terminal_color_*`.
- `run.sh` only checks. Regenerating a snapshot is a deliberate manual step (commands above). In a PR that changes colors, the snapshot diff is what gets reviewed, so check that it contains only the changes you meant to make.

## Adding plugin support

1. Add a block with a section comment in `theme.set_highlights`, naming the VS Code color keys it mirrors.
2. Use existing palette keys, one `d_` and one `l_` per attribute. Prefer `link = "…"` over duplicating an existing group's attributes.
3. Regenerate both snapshots and read the diff.
4. Check the result in both backgrounds.
5. Add the plugin to the README's "Supported Plugins" list.
