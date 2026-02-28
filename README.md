# My nvim config

> Note to self:
> 
> - Don't let this get crudded up with useless flashy shit
> - Keep it up to date
> - Use it everywhere
> - Don't spend hours configuring nvim lol

## Corresponding tmux.conf

```
# y for yank to system clipboard
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -sel clip"

# Big history
set-option -g history-limit 50000

# Vim-like keys
set-window-option -g mode-keys vi

# Speedy
set -sg escape-time 10

# Set current session to CWD with alt-c
bind -n M-c attach-session -t . -c '#{pane_current_path}'

# From https://github.com/aserowy/tmux.nvim
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"

bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' '' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' '' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' '' 'select-pane -R' }
bind-key -n 'C-n' if-shell "$is_vim" 'send-keys C-n' { if -F '#{window_end_flag}' '' 'select-window -n' }
bind-key -n 'C-p' if-shell "$is_vim" 'send-keys C-p' { if 'test #{window_index} -gt #{base-index}' 'select-window -p' }

bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' '' 'select-pane -L'
bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' '' 'select-pane -U'
bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' '' 'select-pane -R'
bind-key -T copy-mode-vi 'C-n' if -F '#{window_end_flag}' '' 'select-window -n'
bind-key -T copy-mode-vi 'C-p' if 'test #{window_index} -gt #{base-index}' 'select-window -p'

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

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
