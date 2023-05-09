# Linux Vm config

## Config
```xml
 <domain xmlns:qemu="http://libvirt.org/schemas/domain/qemu/1.0" type="kvm">
  <name>brive</name>
  <uuid>93f78f12-0745-4280-b812-524420ce0a9f</uuid>
  <metadata>
    <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
      <libosinfo:os id="http://fedoraproject.org/fedora/unknown"/>
    </libosinfo:libosinfo>
  </metadata>
  <memory unit="KiB">16777216</memory>
  <currentMemory unit="KiB">16777216</currentMemory>
  <memoryBacking>
    <hugepages/>
  </memoryBacking>
  <vcpu placement="static">10</vcpu>
  <iothreads>1</iothreads>
  <cputune>
    <vcpupin vcpu="0" cpuset="0"/>
    <vcpupin vcpu="1" cpuset="6"/>
    <vcpupin vcpu="2" cpuset="1"/>
    <vcpupin vcpu="3" cpuset="7"/>
    <vcpupin vcpu="4" cpuset="2"/>
    <vcpupin vcpu="5" cpuset="8"/>
    <vcpupin vcpu="6" cpuset="3"/>
    <vcpupin vcpu="7" cpuset="9"/>
    <vcpupin vcpu="8" cpuset="4"/>
    <vcpupin vcpu="9" cpuset="10"/>
    <emulatorpin cpuset="5,11"/>
    <iothreadpin iothread="1" cpuset="5,11"/>
  </cputune>
  <sysinfo type="smbios">
    <bios>
      <entry name="vendor">American Megatrends Inc.</entry>
      <entry name="version">3.50</entry>
    </bios>
    <system>
      <entry name="manufacturer">Micro-Star International Co., Ltd</entry>
      <entry name="product">MS-7C02</entry>
      <entry name="version">1.0</entry>
      <entry name="serial">To be filled by O.E.M.</entry>
      <entry name="family">To be filled by O.E.M.</entry>
    </system>
  </sysinfo>
  <os>
    <type arch="x86_64" machine="pc-q35-7.1">hvm</type>
    <loader readonly="yes" type="pflash">/usr/share/edk2-ovmf/x64/OVMF_CODE.secboot.fd</loader>
    <nvram>/var/lib/libvirt/qemu/nvram/brive_VARS.fd</nvram>
    <bootmenu enable="no"/>
    <smbios mode="host"/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <pae/>
    <hyperv mode="custom">
      <relaxed state="on"/>
      <vapic state="on"/>
      <spinlocks state="on" retries="8191"/>
      <vpindex state="on"/>
      <synic state="on"/>
      <stimer state="on"/>
      <vendor_id state="on" value="694206789ab"/>
      <frequencies state="on"/>
    </hyperv>
    <vmport state="off"/>
    <ioapic driver="kvm"/>
  </features>
  <cpu mode="host-passthrough" check="none" migratable="on">
    <topology sockets="1" dies="1" cores="5" threads="2"/>
    <feature policy="require" name="topoext"/>
    <feature policy="require" name="invtsc"/>
    <feature policy="disable" name="vmx"/>
    <feature policy="require" name="pdpe1gb"/>
    <feature policy="require" name="amd-ssbd"/>
    <feature policy="disable" name="amd-no-ssb"/>
    <feature policy="require" name="stibp"/>
  </cpu>
  <clock offset="localtime">
    <timer name="rtc" tickpolicy="catchup"/>
    <timer name="pit" tickpolicy="delay"/>
    <timer name="hpet" present="no"/>
    <timer name="hypervclock" present="yes"/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <pm>
    <suspend-to-mem enabled="no"/>
    <suspend-to-disk enabled="no"/>
  </pm>
  <devices>
    <emulator>/usr/bin/qemu-system-x86_64</emulator>
    <disk type="file" device="disk">
      <driver name="qemu" type="raw" cache="none" discard="unmap"/>
      <source file="/mnt/vmData/brive-new.img"/>
      <target dev="sdf" bus="sata"/>
      <boot order="1"/>
      <address type="drive" controller="0" bus="0" target="0" unit="5"/>
    </disk>
    <controller type="usb" index="0" model="qemu-xhci" ports="15">
      <address type="pci" domain="0x0000" bus="0x02" slot="0x00" function="0x0"/>
    </controller>
    <controller type="pci" index="0" model="pcie-root"/>
    <controller type="pci" index="1" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="1" port="0x10"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0" multifunction="on"/>
    </controller>
    <controller type="pci" index="2" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="2" port="0x11"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x1"/>
    </controller>
    <controller type="pci" index="3" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="3" port="0x12"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x2"/>
    </controller>
    <controller type="pci" index="4" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="4" port="0x13"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x3"/>
    </controller>
    <controller type="pci" index="5" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="5" port="0x14"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x4"/>
    </controller>
    <controller type="pci" index="6" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="6" port="0x15"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x5"/>
    </controller>
    <controller type="pci" index="7" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="7" port="0x16"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x6"/>
    </controller>
    <controller type="pci" index="8" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="8" port="0x17"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x7"/>
    </controller>
    <controller type="pci" index="9" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="9" port="0x18"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x0" multifunction="on"/>
    </controller>
    <controller type="pci" index="10" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="10" port="0x19"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x1"/>
    </controller>
    <controller type="pci" index="11" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="11" port="0x1a"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x2"/>
    </controller>
    <controller type="pci" index="12" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="12" port="0x1b"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x3"/>
    </controller>
    <controller type="pci" index="13" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="13" port="0x1c"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x4"/>
    </controller>
    <controller type="pci" index="14" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="14" port="0x1d"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x5"/>
    </controller>
    <controller type="pci" index="15" model="pcie-root-port">
      <model name="pcie-root-port"/>
      <target chassis="15" port="0x1e"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x6"/>
    </controller>
    <controller type="pci" index="16" model="pcie-to-pci-bridge">
      <model name="pcie-pci-bridge"/>
      <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
    </controller>
    <controller type="sata" index="0">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x1f" function="0x2"/>
    </controller>
    <controller type="sata" index="1">
      <address type="pci" domain="0x0000" bus="0x10" slot="0x01" function="0x0"/>
    </controller>
    <controller type="scsi" index="0" model="virtio-scsi">
      <address type="pci" domain="0x0000" bus="0x09" slot="0x00" function="0x0"/>
    </controller>
    <interface type="bridge">
      <mac address="52:54:00:97:ab:fe"/>
      <source bridge="virbr0"/>
      <model type="virtio"/>
      <address type="pci" domain="0x0000" bus="0x07" slot="0x00" function="0x0"/>
    </interface>
    <serial type="pty">
      <target type="isa-serial" port="0">
        <model name="isa-serial"/>
      </target>
    </serial>
    <console type="pty">
      <target type="serial" port="0"/>
    </console>
    <input type="mouse" bus="ps2"/>
    <input type="keyboard" bus="ps2"/>
    <input type="tablet" bus="virtio">
      <address type="pci" domain="0x0000" bus="0x03" slot="0x00" function="0x0"/>
    </input>
    <graphics type="spice">
      <listen type="none"/>
      <image compression="off"/>
    </graphics>
    <sound model="ich9">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x1b" function="0x0"/>
    </sound>
    <audio id="1" type="spice"/>
    <video>
      <model type="none"/>
    </video>
    <hostdev mode="subsystem" type="pci" managed="yes">
      <source>
        <address domain="0x0000" bus="0x25" slot="0x00" function="0x0"/>
      </source>
      <address type="pci" domain="0x0000" bus="0x04" slot="0x00" function="0x0"/>
    </hostdev>
    <hostdev mode="subsystem" type="pci" managed="yes">
      <source>
        <address domain="0x0000" bus="0x25" slot="0x00" function="0x1"/>
      </source>
      <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
    </hostdev>
    <hostdev mode="subsystem" type="pci" managed="yes">
      <source>
        <address domain="0x0000" bus="0x2a" slot="0x00" function="0x3"/>
      </source>
      <address type="pci" domain="0x0000" bus="0x08" slot="0x00" function="0x0"/>
    </hostdev>
    <watchdog model="itco" action="reset"/>
    <memballoon model="virtio">
      <address type="pci" domain="0x0000" bus="0x06" slot="0x00" function="0x0"/>
    </memballoon>
  </devices>
  <qemu:commandline>
    <qemu:arg value="-object"/>
    <qemu:arg value="input-linux,id=kbd1,evdev=/dev/input/by-id/usb-Razer_Razer_BlackWidow-event-kbd,grab_all=on,repeat=on"/>
    <qemu:arg value="-object"/>
    <qemu:arg value="input-linux,id=kbd2,evdev=/dev/input/by-id/usb-Razer_Razer_BlackWidow-if01-event-kbd,grab_all=on,repeat=on"/>
    <qemu:arg value="-object"/>
    <qemu:arg value="input-linux,id=mouse1,evdev=/dev/input/by-id/usb-Razer_Razer_BlackWidow-if02-event-mouse"/>
    <qemu:arg value="-object"/>
    <qemu:arg value="input-linux,id=mouse2,evdev=/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_310_eSports_Mouse-if01-event-mouse"/>
    <qemu:arg value="-object"/>
    <qemu:arg value="input-linux,id=kbd3,evdev=/dev/input/by-id/usb-SteelSeries_SteelSeries_Rival_310_eSports_Mouse-if02-event-kbd,grab_all=on,repeat=on"/>
    <qemu:env name="QEMU_AUDIO_TIMER_PERIOD" value="0"/>
    <qemu:env name="QEMU_AUDIO_DRV" value="pa"/>
  </qemu:commandline>
</domain>

```  