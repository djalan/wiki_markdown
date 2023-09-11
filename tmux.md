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

## Renumber all the windows
### Call
`tmux move-window -r`
### Automatically when a window is killed
`set-option -g renumber-windows on`


## SSH Forwarding
### ~/.ssh/rc
```bash
if [ ! -S ~/.ssh/ssh_auth_sock ] && [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
```
### .tmux.conf
`set-environment -g 'SSH_AUTH_SOCK' ~/.ssh/ssh_auth_sock`
