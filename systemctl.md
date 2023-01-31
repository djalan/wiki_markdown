# systemctl

## List services
- `systemctl list-unit-files --type=service`
- `systemctl list-unit-files --type=service --state=failed`

## List timers
- `systemctl list-unit-files --type=timer`
- `systemctl list-timers`

## Enable and start a service
`systemctl enable --now some.service`
