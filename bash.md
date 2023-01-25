# bash

## Here-documents
There is a difference between `<<` and `<<-`
### With indentation
```bash
if [...]; then
    cat <<- EOF
        some text
    EOF
fi
```
### With no indentation
```bash
cat << EOF
some text
EOF
```
```bash
sudo tee -a /etc/fstab > /dev/null << EOF
UUID=123 /media/ext4_3tb ext4 nofail,x-systemd.device-timeout=1ms,defaults 0 0
UUID=456 /raid-mirror ext4 defaults 0 0
EOF
```bash
