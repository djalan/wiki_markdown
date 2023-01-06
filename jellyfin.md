# Jellyfin

## Logs
### where
found at `/var/log/jellyfin/*.log`
### why
- often see errors
- often see **restart required**
### configure Debug or Information
`$HOME/.config/jellyfin/logging.default.json`

## Configure HTTPS
### generate certificate with cerbot @ Let's Encrypt
- Convert certificate
    - `openssl pkcs12 -inkey privkey.pem -in cert.pem -passout pass: -export -out jellyfin.pkcs12`
- Don't create a passphrase
    - `-passout pass:`
### alternative if Jellyfin HTTPS has too many bugs
- use reverse proxy
- use **caddy**
    - ultimate server with automatic HTTPS
    - https://caddyserver.com

## Service
```bash
systemctl restart jellyfin
systemctl status jellyfin
```

## nethogs
Analyse network traffic
### change units to MB/sec
use letter `m`
### alternative program
iftop

## group `ssl-cert`
- used in `/etc/ssl/private`
- `usermod -a -G ssl-cert jellyfin`
- permission `--x`: cd into directory but disable `ls -l`
- permission `r-w`: cd into directory and enable `ls -l` view of metadata

## ufw firewall setup
### Create Jellyfin app in `/etc/ufw/applications.d/jellyfin`
```ini
[JELLYFIN]
title=Media Server
description=Open source media server working with Apple TV
ports=1900/udp|7359/udp|8096/tcp|8920/tcp
```
### Activate app
```bash
ufw status
ufw update jellyfin
ufw app list
ufw allow jellyfin
ufw status
```

## plugins
### Pushover
Very cool and 5$ only for great notifications iOS / Android / Chrome
- NotSupported 2023-01-03
### Webhook
- Malfunctioned 2023-01-03
