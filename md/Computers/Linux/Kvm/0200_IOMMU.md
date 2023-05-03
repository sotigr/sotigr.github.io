# IOMMU
Ensure that AMD-Vi/Intel VT-d is supported and enabled in the BIOS

## List out IOMMU groups

```sh 
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
```

The output will list all the pci devices grouped by their IOMMU group number.

```sh
IOMMU Group 24:
	25:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP102 [GeForce GTX 1080 Ti] [10de:1b06] (rev a1)
IOMMU Group 25:
	25:00.1 Audio device [0403]: NVIDIA Corporation GP102 HDMI Audio Controller [10de:10ef] (rev a1) 
```
 
The GPU you wish to passthrough must not share a group with any other device.
But this will not likely be the case. In that case you have to ACS patch the Kernel 

## ACS Kernel Patch
```sh
mkdir build && cd build
git clone https://aur.archlinux.org/linux-vfio.git
makepkg -si
# or
makepkg -si --skippgpcheck
```