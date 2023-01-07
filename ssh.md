# ssh


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
