# ssh

## Specifiy key per host
Modify file `~/.ssh/config`
```bash
Host github.com
	Hostname github.com
	IdentityFile ~/.ssh/id_github
	IdentitiesOnly yes
```
### solves bugs
- `ssh -T git@github.com`
