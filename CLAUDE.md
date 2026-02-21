# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using **Lazy.nvim** as the plugin manager. All plugins are defined as individual spec files under `lua/plugins/`.

## Structure

- `init.lua` — Global editor settings (leader key: Space, 4-space tabs, persistent undo, splits right/below)
- `lua/config/lazy.lua` — Lazy.nvim bootstrap; scans `lua/plugins/` for plugin specs
- `lua/plugins/` — One file per plugin or logical group

## Adding/Modifying Plugins

Create or edit a file in `lua/plugins/`. Each file returns a table (or list of tables) in Lazy.nvim spec format:

```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({ ... })
  end,
}
```

Lazy.nvim auto-discovers all files in `lua/plugins/`. No registration step needed.

## LSP & Tooling (Python focus)

- **LSP servers**: Pyright (type checking) + Ruff (linting/formatting), configured in `lua/plugins/lspconfig.lua`
- **Installer**: Mason + mason-tool-installer auto-installs Pyright, Ruff, black, and isort (`lua/plugins/mason.lua`)
- **Completion**: nvim-cmp with LSP + Copilot sources (`lua/plugins/cmp.lua`)
- **Treesitter parsers**: Python, Lua, Vim (`lua/plugins/treesitter.lua`)

Uses Neovim 0.11's native `vim.lsp.enable()` API (not the deprecated `require('lspconfig').X.setup()` framework). LSP keymaps are set via a `LspAttach` autocmd. nvim-lspconfig is still used as the source of server definitions (cmd, filetypes, root_markers).

To add a new LSP server: add it to `ensure_installed` in `mason.lua` and call `vim.lsp.enable("server_name")` in `lspconfig.lua`.

## Key Bindings Summary

| Key | Action |
|-----|--------|
| `<leader>` | Space |
| `K` | LSP hover |
| `gd` / `gD` | Go to definition / declaration |
| `gr` / `gi` | References / implementation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format document |
| `<leader>e` | Diagnostics float |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>c` | Toggle CopilotChat |

## Copilot

- Inline suggestions and panel are **disabled** by default; Copilot surfaces only through nvim-cmp completions and CopilotChat (`<leader>c`).

## Lock File

`lazy-lock.json` pins plugin versions. Commit this file to reproduce exact plugin state.
