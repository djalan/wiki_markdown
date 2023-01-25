# xargs
Linux command to run a utility


## Group then process multiple lines
> `xargs -L 3 bash -c 'echo $0 $1'`
> Only single quotes work!!
```bash
## Group data then run utility
>>> echo '
Jesus
Christ
0

Tom
Brady
1977' | xargs -L 3 bash -c 'echo $0 $1'
Jesus Christ
Tom Brady
```


## Parallel mode
> `xargs -I {} -P 5 sh -c 'echo {} $(brew info {} | grep Required)'`
```bash
>>> brew list -1 --formula | xargs -I {} -P 5 sh -c 'echo {} $(brew info {} | grep Required)'
ca-certificates
bat
dust
coreutils Required: gmp
```


## mv
### Use `-t` with `mv` to copy multiple files in TARGET directory
```bash
fd -t f -0 | xargs -0 mv -t /tmp/
```
