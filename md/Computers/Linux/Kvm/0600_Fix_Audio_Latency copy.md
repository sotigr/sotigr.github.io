# Fix audio latency
 
WARNING: Possibly unstable

```xml
<qemu:commandline>
  ...
  <qemu:env name="QEMU_AUDIO_TIMER_PERIOD" value="0"/>
  ...
</qemu:commandline>
```
 