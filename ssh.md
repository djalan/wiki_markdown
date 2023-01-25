# ssh
Saves passphrase for keys to avoid retyping time all the time


## Specifiy key per host
Modify file `~/.ssh/config`
```
Host github.com
	IdentityFile ~/.ssh/id_github
	IdentitiesOnly yes
```


## Set keys between your own machines
```bash
ssh-keygen
ssh-copy-id -i ~/.ssh/id_my_machine user@remote
```


## zsh
### oh-my-zsh plugin
Combine `lazy yes` with `AddKeysToAgent yes`
```bash
plugins=(git vscode ssh-agent)

# PLUGIN: ssh-agent @ https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ssh-agent
# zstyle :omz:plugins:ssh-agent identities id_my_box github
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 1h

source $ZSH/oh-my-zsh.sh
```
