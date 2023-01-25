# VNC

## TigerVNC
### Start the server
```bash
vncserver

or

vncserver -depth 32 -geometry 1920x1080
```
### List running servers
`vncserver -list`

### Session numbers and ports
- Session :1 will open port 5901
- Session :2 will open port 5902
- Session :3 will open port 5903
- Session :4 will open port 5904
- Session :5 WILL NOT open 5905, read the docs
