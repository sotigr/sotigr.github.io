# Initial Setup

## Update system

```sh
sudo pacman -Syu
```
## Install dependencies

```sh
sudo pacman -S archlinux-keyring
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
sudo pacman -S ebtables iptables
```


## Start libvirt
```sh
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
```

## Enable normal user account to use KVM
Open the file /etc/libvirt/libvirtd.conf for editing.
``` title="/etc/libvirt/libvirtd.conf"
...
unix_sock_group = "libvirt"
...
unix_sock_rw_perms = "0770"
...
```

## Add your user account to libvirt group.
```sh
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo systemctl restart libvirtd.service
```
 
## Autostart default network
```sh
sudo virsh net-start default
sudo virsh net-autostart --network default  
```