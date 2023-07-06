# systemctl systemd
- hard link with `ln`
- `$HOME/workspace/wiki_markdown/systemctl.md`
- `$HOME/workspace/systemd_timers/README.md`

## Common commands
### List services
- `systemctl list-unit-files --type=service`
- `systemctl list-unit-files --type=service --state=failed`

### List timers
- `systemctl list-unit-files --type=timer`
- `systemctl list-timers`

### Enable and start a service
`systemctl enable --now some.service`


## User custom service/timer
### Location
- `/etc/systemd/system/mine.service`
- `/etc/systemd/system/mine.timer`
- `/usr/local/bin/script.sh` with `sudo install script.sh /usr/local/bin`
### Start
`sudo systemctl start mine.timer`

## Error 203: can't find script and SELinux problem
- selinux does not want to run a script from a user home directory
- `sudo install script.sh /usr/local/bin`
