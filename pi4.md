# Raspberry Pi 4 b


## Boot without Ubuntu gui
### Not working: not loading ssh or ping or networking by default
`systemctl set-default multi-user`


## Pi OS GPU memory
If you manually override the maximum in the GUI, the Pi won't boot anymore


## Mount external hard drive in /etc/fstab
Pi will not boot if your drive is not plugged in, unless:
`nofail,x-systemd.device-timeout=10000ms`


## Pi-Hole
### Configurations
- for a clean Query Log with names, add IPs in /etc/hosts
