# RAW Virtual Disks

## Create and format virtual disk

```sh
qemu-img create myimage.img 60G
qemu-system-x86_64 -drive format=raw,file=myimage.img
```
