# fedora

## ZFS
Open ZFS not working well with fedora and zfs-fuse that is used by libvirt / qemu.

https://openzfs.github.io/openzfs-docs/Getting%20Started/Fedora/index.html
> Solution: raid instead of zfs

## VirtualBox
### Guests
#### Fedora
Don't use guest additions ISO. Instead `dnf install virtualbox-guest-additions`


## DNF
### Files inside a package
`rpm -ql package`

### What package installed a file
- `dnf provides executable`
- `dnf provides /full/path/of/something`
