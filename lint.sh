#!/usr/bin/env bash
#
# Checks that every git-tracked Lua file is formatted with StyLua.
# Formatting settings come from .editorconfig. To fix a failure, run:
#
#   git ls-files -z '*.lua' | xargs -0 stylua

set -euo pipefail

cd "$(dirname "$0")"

if ! command -v stylua >/dev/null; then
    echo "stylua not found: install it from https://github.com/JohnnyMorganz/StyLua" >&2
    exit 1
fi

stylua --version
git ls-files -z '*.lua' | xargs -0 --no-run-if-empty stylua --check
echo "OK stylua"
