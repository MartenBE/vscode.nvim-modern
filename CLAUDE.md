# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`vscode.nvim` is a Neovim colorscheme plugin (pure Lua, no build step, no dependencies) — a port of VSCode's default light and dark themes. It is consumed directly by plugin managers, so the repo layout *is* the runtime layout (`colors/`, `lua/`, `after/queries/`).

## Commands

```sh
tests/run.sh                          # compare against the committed snapshots
NVIM=/path/to/nvim tests/run.sh

# regenerate a snapshot after an intentional color change (from repo root)
nvim --headless --clean --cmd "set rtp+=$PWD" -l tests/snapshot.lua dark >tests/snapshots/dark.txt

stylua tests/ lua/vscode/colors.lua   # format (config: stylua.toml)
stylua --check .                      # NB: pre-existing drift in init.lua,
                                      # utils.lua, theme.lua — format only what you touch
```

`tests/run.sh` is the CI entry point (`.github/workflows/test.yml`). There is no lint config beyond stylua.

Manual verification is still worth doing for anything visual — open a file in Neovim with the plugin on `runtimepath` and reload:

```vim
:lua package.loaded['vscode.theme'] = nil
:lua package.loaded['vscode.colors'] = nil
:lua require('vscode').load('light')   " or 'dark'
:Inspect                              " under cursor: which highlight group applies
:hi SomeGroup                         " check a resolved group
```

Commits follow conventional-commit prefixes (`feat:`, `fix:`).

## Architecture

Load path: `colors/vscode.lua` (what `:colorscheme vscode` runs) → `require('vscode').load()` → `theme.set_highlights(config.opts)` + `theme.link_highlight()` → user `group_overrides` applied last.

- **`lua/vscode/config.lua`** — options table. Calls `config.setup()` at require-time with defaults, so `load()` works with no user `setup()`. Reads legacy `vim.g.vscode_*` globals first, then user opts override them; keep both paths when adding an option.
- **`lua/vscode/colors.lua`** — the palette. `get_colors()` returns one flat table with **both** themes' colors (no branching on `background`), then merges `color_overrides`. Keys are `<theme>_<family>_<rank>`: `d_`/`l_` prefix, one of the 11 basic color names (black, white, gray, red, brown, orange, yellow, green, blue, purple, pink), and a rank 10, 20, 30… from darkest to lightest within that family (by CIE L*). Ranks have no gaps: to add a color, insert it in L* order and renumber the rest of that family, updating every reference in `theme.lua`, `utils.lua` and the docs (one simultaneous rename, so `_20`→`_30` doesn't chain into `_30`→`_40`). Each key is one hex value; there are no semantic aliases, so overriding a key changes every use of that color.
- **`lua/vscode/theme.lua`** — ~1000 lines of `vim.api.nvim_set_hl` calls, grouped by section comments (core UI → Treesitter → LSP semantic tokens → per-language → per-plugin). Palette keys only, never literal hex. The local `editor_background` holds the editor background (`'NONE'` when `opts.transparent`); use it, not the raw `d_black_10`/`l_white_30`, wherever the editor background is meant, so `transparent = true` keeps working.
- **`lua/vscode/utils.lua`** — maps the palette onto `vim.g.terminal_color_0..15`; called from `load()` after `background` is set.
- **`lua/lualine/themes/vscode.lua`** — separate lualine theme with its **own hardcoded palette**, independent of `vscode/colors.lua`. Discovered by lualine via `runtimepath`, not by `require('vscode')`.
- **`after/queries/{javascript,typescript,jsx}/highlights.scm`** — `;; extends` treesitter query overrides that re-capture `export`/`break` to match VSCode's coloring. Documented as a caveat in the README; keep it documented if changed.

### Light/dark divergence

Every color attribute picks its theme explicitly, in one of three styles:

1. inline ternary — `fg = is_dark and c.d_blue_60 or c.l_blue_30` (the default; nearly every attribute)
2. small `if is_dark then … else … end` blocks (Neogit, WhichKeyBorder) — branches use only `c.d_*` or only `c.l_*`
3. one large trailing `if is_dark … else … end` block (~line 850 onward) duplicating Telescope, LspSaga, NvimTree, COC and debug groups

Never use a `d_` key in the light path or vice versa. A group defined *only* inside a branch of (3) is undefined in the other mode — check both sides when editing there. When an opts condition is combined with a theme choice, parenthesise each arm: `opts.transparent and editor_background or (is_dark and c.d_black_40 or c.l_gray_80)`.

### `extra/`

Hand-maintained color schemes for other tools (alacritty, kitty, foot, ghostty, wezterm, zellij, fzf, i3/sway, Xresources, zathura, Windows Terminal, linux console, galaxyline). There is **no generator** — palette changes in `colors.lua` do not propagate here, and each file must be updated by hand.

## Tests

A change-detector, nothing more: `tests/snapshots/{dark,light}.txt` list every highlight group `theme.lua` sets, and `tests/run.sh` diffs the current output against them. No dependencies beyond `nvim`, one process per background.

`tests/snapshot.lua` captures by replacing `vim.api.nvim_set_hl` *before* `vscode.theme` is first required, exploiting the `local hl` binding at `theme.lua:12`. This is deliberately narrower than `nvim_get_hl(0, {})`, which would also return Neovim's own default highlights and churn the snapshots on every Neovim upgrade. It also sets `vim.o.background` before loading — assigning it afterwards re-sources the active colorscheme and runs the theme twice.

Scope is the Neovim theme only: the lualine theme and `vim.g.terminal_color_*` are not covered.

The snapshot diff **is** the review artifact — when a PR changes it, read the diff. `run.sh` only ever checks; regenerating is a deliberate manual step (command above), so a golden file is never silently overwritten.

## Adding plugin support

Add a section-commented block in `theme.set_highlights`, use existing palette keys (one `d_` and one `l_` per attribute), and verify in both backgrounds. Then add the plugin to the README's "Supported Plugins" list. Use `link = '…'` (in `link_highlight` or inline) rather than duplicating an existing group's attributes.
