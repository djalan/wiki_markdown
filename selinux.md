# SELinux

sudo semanage fcontext -a -t public_content_rw_t "/media/ext4_3tb/vsftpd_downloads(/.*)?"
sudo restorecon -Rvv /media/ext4_3tb/vsftpd_downloads
