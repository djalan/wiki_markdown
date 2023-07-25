# tmux


## Kill window
Useful when lost SSH connection

- `Prefix` + `&`
- `Prefix` + `:kill-window`
- `tmux kill-window -t #`


## Rename window
- `renamew myself`
- `renamew -t number new_name`

## kill-session
```bash
tmux ls
tmux kill-session -t 0
```
