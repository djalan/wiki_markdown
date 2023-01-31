# mdadm Raid

## Status
- `cat /proc/mdstat`
- `sudo mdadm --detail /dev/md127`

## Stop check
### Try first `idle`
abort any running action though some actions will automatically restart

`echo idle | sudo tee /sys/block/md127/md/sync_action`

### Alternative: `frozen`
ensure no other action starts automatically

`echo frozen | sudo tee /sys/block/md127/md/sync_action`
