# rsync

## rsync versus scp
- rsync is faster
- rsync will guarantee the files are copied correctly
- rsync can do partial/resume transfers
- can be done without ssh


## trailing slash
- `/some/dir/` will not copy folder `dir`, only its content
- `/some/dir` will copy folder `dir` and its content


## examples
### copy to remote host
```bash
rsync -avhP -e ssh 'Series 1080p' dest:/srv/Shows/

-a archive
-v verbose
-h human readable format
-P partial & progress

-z compression
```
