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
