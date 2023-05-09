# Fix audio latency
 
WARNING: Possibly unstable

```xml
<qemu:commandline>
  ...
  <qemu:env name="QEMU_AUDIO_TIMER_PERIOD" value="100"/>
  <qemu:env name="QEMU_AUDIO_DRV" value="pa"/>
  ...
</qemu:commandline>
```
 