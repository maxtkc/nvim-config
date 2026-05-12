# My nvim config

> Note to self:
> 
> - Don't let this get crudded up with useless flashy shit
> - Keep it up to date
> - Use it everywhere
> - Don't spend hours configuring nvim lol

## Git keybindings (gitsigns)

**Navigation**

| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |

**Viewing diffs**

| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk (floating window) |
| `<leader>hi` | Preview hunk inline |
| `<leader>hd` | Diff this file vs index |
| `<leader>hD` | Diff this file vs last commit |

**Blame**

| Key | Action |
|-----|--------|
| `<leader>hb` | Blame current line (full) |
| `<leader>tb` | Toggle inline blame |
| `<leader>tw` | Toggle word diff |

**Staging / resetting**

| Key | Action |
|-----|--------|
| `<leader>hs` | Stage hunk (normal or visual) |
| `<leader>hr` | Reset hunk (normal or visual) |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hq` | Send hunks to quickfix |
| `<leader>hQ` | Send all hunks to quickfix |

## tmux

Config lives in [`tmux.conf`](tmux.conf). Run `./install.sh` to symlink it to `~/.tmux.conf` and install TPM.

After installing, load plugins inside tmux with `prefix + I`.

## claude-status

[`claude-status`](claude-status) is a Python status-line script for Claude Code. It shows git branch + dirty counts, context %, 5-hour session usage, 7-day usage (each with a `+N` / `-N` linear-burn delta), and the active model.

`./install.sh` symlinks it to `~/.local/bin/claude-status` and sets `statusLine` in `~/.claude/settings.json` to:

```json
{
  "statusLine": { "type": "command", "command": "claude-status" }
}
```

Requires `~/.local/bin` on `PATH` and `python3`. Usage data is pulled from the OAuth usage API using the token in `~/.claude/.credentials.json` and cached for 60s at `~/.claude/cache/usage-api.json`.

## keyd for swap escape `/etc/keyd/default.conf`

```
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock

# Remap < key to shift for german keyboards
# 102nd = overload(shift, <)
```
