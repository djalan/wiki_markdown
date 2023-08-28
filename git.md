# Git

## Slow ZSH git plugin
### Must 
`git config --local --add oh-my-zsh.hide-dirty 1`
### Optional
`git config --local --add oh-my-zsh.hide-status 1`

## Delete file in git top level
`find $(git rev-parse --show-toplevel) -name a.out`
