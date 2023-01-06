# vsftpd


## FTPES
- explicit FTP over SSL/TLS
- better than SFTP
- connects on 21, but can encrypt credentials before they are sent
- encrypts data sent too


## FTPS
- implicit SSL/TLS
- deprecated
- default port 990


## SFTP
- runs over SSH
- can't lock users into the home folder with chroot


## how to get more details about errors
- deactivate SSL: ssl_enable=NO
- connect
- look for new messages


## 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
### bad solution, not hacking proof
- bad: `allow_writeable_chroot=YES`
- they can `cd` higher in system directories
### best solution
`chmod a-w /home/user`


## /sbin/nologin for user abc123
- replacement shell field to deny login access to account
- vsftpd checks for a valid shell like `/bin/bash` in file `/etc/shells`
```bash
usermod -s /sbin/nologin abc123
echo '/usr/sbin/nologin
/sbin/nologin' | sudo tee -a /etc/shells
```


## symlinks are not working with vsftpd, use `bind --mount`
- Does it take the filesystem space in GB? No! (double check)
```bash
mkdir /home/abc123/ftp/downloads
mount --bind /real/files/ /home/abc123/ftp/downloads

umount /home/abc123/ftp/downloads
rmdir /home/abc123/ftp/downloads
```
- Edit `/etc/fstab` if desired
```
/real/files /home/abc123/ftp/downloads none bind 0 0
/real/files /home/abc123/ftp/downloads none bind,nofail,x-systemd.device-timeout=10000ms 0 0
```


## local_root (default dir when FTP connection starts)
- not working, why?
- probably have to edit chroot list
- probably have to usermod new home directory to `/home/abc123/ftp/downloads/`


## Server sent passive reply with unroutable address. Using server address instead.
- router
    - Port Forwarding (NOT Virtual Server with external-to-internal mapping)
        - local IP
        - 5000-5003
- vsftpd.conf
    - pasv_addr_resolve=YES
    - pasv_address=my.domain.com
    - pasv_min_port=5000
    - pasv_max_port=5003


## GnuTLS error -15 in gnutls_record_recv: An unexpected TLS packet was received.
- potentially just a FileZilla problem
- GnuTLS error -15 in gnutls_record_recv: An unexpected TLS packet was received.
- Could not read from socket: ECONNABORTED - Connection aborted
### Solution
- disable SSL and then you see overloading of passive ports
- make sure to have a lot of passive ports opened
    - pasv_min_port=5000
    - pasv_max_port=6000
### Bad solution
`seccomp_sandbox=NO`


## selinux errors
### on file `disable_ipv6` or target object `net [dir]`
- use IPv4 only
- vsftpd.conf
    - listen=YES
    - listen_ipv6=NO
