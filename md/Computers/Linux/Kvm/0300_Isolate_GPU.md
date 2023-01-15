# Isolate GPU
Assuming that the IOMMU groups are setup correctly you can now isolate the GPU you wish to passthrough.

# Get the GPU device ids
List the IOMMU groups
```sh 
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
```

The ids will be near the end of the device description and will be formatted like this: `[0000:0000]`

```sh
IOMMU Group 24:
	25:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP102 [GeForce GTX 1080 Ti] [10de:1b06] (rev a1)
IOMMU Group 25:
	25:00.1 Audio device [0403]: NVIDIA Corporation GP102 HDMI Audio Controller [10de:10ef] (rev a1) 
```

In my case the ids are `10de:1b06` and `10de:10ef`

# Edit the grub config

Edit the grub file to isolate the gpu on startup

Open `/etc/default/grub` and add the following parameters in the `GRUB_CMDLINE_LINUX_DEFAULT` option

* amd_iommu=on
* iommu=pt
* rd.driver.pre=vfio-pci
* transparent_hugepage=never `faster memory access for the VM`
* vfio pci.ids=10de:1b06,10de:10ef `add your ids accordingly`
* pcie_acs_override=downstream,multifunction `whether this option is good is debatable probably should remove`

My file looks like this:

``` title="/etc/default/grub"
...
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash apparmor=1 security=apparmor udev.log_priority=3 amd_iommu=on iommu=pt transparent_hugepage=never rd.driver.pre=vfio-pci vfio pci.ids=10de:1b06,10de:10ef pcie_acs_override=downstream,multifunction"
...
``` 

Apply grub configuration
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```