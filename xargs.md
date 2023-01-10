# xargs
Linux command to run a utility
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
> Only single quotes work with `bash -c 'something $0 $1 $2'`

## Run utility in parallel mode
```bash
>>> brew list -1 --formula | xargs -I {} -P 5 sh -c 'echo {} $(brew info {} | grep Required)'
ca-certificates
bat
dust
coreutils Required: gmp
```
