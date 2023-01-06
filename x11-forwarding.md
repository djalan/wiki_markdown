# X11 forwarding
Programs can run good or bad
- gedit: runs very well
- wireshark: lag in File|Edit|View menus

## Configure
### Configure host
`set DISPLAY=127.0.0.1:0`
### Configure remote
```bash
cd
mv .Xauthority .Xauthority.old
touch .Xauthority
xauth generate :0 . trusted
xauth add ${HOST}:0 . $(xxd -l 16 -p /dev/urandom)
xauth list
```

## Run program on host
```bash
ssh -Y user@remote.local
gedit
```

## To-do
- check `ssh -Y` versus `ssh -X`
