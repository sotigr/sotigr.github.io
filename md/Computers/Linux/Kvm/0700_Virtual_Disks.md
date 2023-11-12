# RAW Virtual Disks
 
## Install libguestfs
libguestfs is a set of tools used to access and modify virtual machine (VM) disk images.
```sh
sudo pacman -S libguestfs
```

## Create and format virtual disk

```sh
qemu-img create myimage.img 60G
qemu-system-x86_64 -drive format=raw,file=myimage.img
```
