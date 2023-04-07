# Hugepages memory optimization

## Reference 

[https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Huge_memory_pages](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Huge_memory_pages)

## Setup

According to the resource above it is preferable to use 1gb pages and reserve an amount of memory at startup for the guest to use.

### Grub
Edit `/etc/default/grub` and add the following parameters to `GRUB_CMDLINE_LINUX_DEFAULT`
```
default_hugepagesz=1G hugepagesz=1G hugepages=16
```
Apply grub configuration
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
This will reserver 16 GB for the guest. Make sure there is some spare memory for the host.

### Guest configuration
To enable hugepage usage for the guest add the following to the guest's xml configuration

```xml
...
<memoryBacking>
	<hugepages/>
</memoryBacking>
...

```

To disable transparent pages add `transparent_hugepage=never` to the grub config