# Configuration

## Bottles default bottle

- [Bottle Mega link](https://mega.nz/file/BF1VCK7C#xSPGEH5UKqYeT87z8-mw04ti9BABveSAwtl2GlKPpKk)

Then copy the bottle to `~/.local/share/bottles/bottles/`


## Create config files
Create directory `~/.config/MangoHud`

Create `dxvk.conf` and `MongoHud.conf` presets listed bellow.

Export the config files:

XORG:

```sh title="~/.profile"
export MANGOHUD_CONFIGFILE=/home/user/.config/MangoHud/MongoHud.conf
export DXVK_CONFIG_FILE=/home/user/.config/MangoHud/dxvk.conf 
```

Wayland:

```sh title="~/.config/environment.d"
MANGOHUD_CONFIGFILE=/home/user/.config/MangoHud/MongoHud.conf
DXVK_CONFIG_FILE=/home/user/.config/MangoHud/dxvk.conf 
```

## Default values
 
!!! warning "Warning: Default config limits fps to 60 you can change it to your liking."

!!! warning "Warning: Vsync is also enforced by default"

``` sh title="dxvk.conf"
# Create the VkSurface on the first call to IDXGISwapChain::Present,
# rather than when creating the swap chain. Some games that start
# rendering with a different graphics API may require this option,
# or otherwise the window may stay black.
# 
# Supported values: True, False

# dxgi.deferSurfaceCreation = False
# d3d9.deferSurfaceCreation = False


# Enforce a stricter maximum frame latency. Overrides the application
# setting specified by calling IDXGIDevice::SetMaximumFrameLatency.
# Setting this to 0 will have no effect.
# 
# Supported values : 0 - 16

# dxgi.maxFrameLatency = 0
# d3d9.maxFrameLatency = 0


# Enables frame rate limiter. The main purpose of this is to work around
# bugs in games that have physics or other simulation tied to their frame
# rate, but do not provide their own limiter.
#
# Supported values : Any non-negative integer

dxgi.maxFrameRate = 60
d3d9.maxFrameRate = 60


# Override PCI vendor and device IDs reported to the application. Can
# cause the app to adjust behaviour depending on the selected values.
#
# Supported values: Any four-digit hex number.

# dxgi.customDeviceId = 0000
# dxgi.customVendorId = 0000

# d3d9.customDeviceId = 0000
# d3d9.customVendorId = 0000


# Override the reported device description
#
# Supported values: Any string.

# dxgi.customDeviceDesc = ""
# d3d9.customDeviceDesc = ""


# Report Nvidia GPUs as AMD GPUs by default. This is enabled by default
# to work around issues with NVAPI, but may cause issues in some games.
#
# Supported values: True, False

# dxgi.nvapiHack = True



# Override maximum amount of device memory and shared system memory
# reported to the application. This may fix texture streaming issues
# in games that do not support cards with large amounts of VRAM.
#
# Supported values: Any number in Megabytes.

# dxgi.maxDeviceMemory = 0
# dxgi.maxSharedMemory = 0


# Some games think we are on Intel given a lack of NVAPI or
# AGS/atiadlxx support. Report our device memory as shared memory,
# and some small amount for a "carveout".

# Supported values: True, False

# dxgi.emulateUMA = False


# Override back buffer count for the Vulkan swap chain.
# Setting this to 0 or less will have no effect.
#
# Supported values: Any number greater than or equal to 2.

# dxgi.numBackBuffers = 0
# d3d9.numBackBuffers = 0


# Overrides synchronization interval (Vsync) for presentation.
# Setting this to 0 disables vertical synchronization entirely.
# A positive value 'n' will enable Vsync and repeat the same
# image n times, and a negative value will have no effect.
#
# Supported values: Any non-negative number

dxgi.syncInterval = 1
d3d9.presentInterval = 1


# True enables the mailbox present mode in case regular Vsync is disabled.
# This should avoid tearing, but may be unsupported on some systems
# or require setting dxgi.numBackBuffers to a higher value in order
# to work properly. 
#
# False enables the relaxed fifo present mode in case regular Vsync is enabled.
# This should result in tearing but reduce stutter if FPS are too low,
# but may be unsupported on some systems.
#
# Please do not report issues with this option.
#
# Supported values: Auto, True, False

dxgi.tearFree = False
d3d9.tearFree = False


# Assume single-use mode for command lists created on deferred contexts.
# This may need to be disabled for some applications to avoid rendering
# issues, which may come at a significant performance cost.
#
# Supported values: True, False

# d3d11.dcSingleUseMode = True


# Override the maximum feature level that a D3D11 device can be created
# with. Setting this to a higher value may allow some applications to run
# that would otherwise fail to create a D3D11 device.
#
# Supported values: 9_1, 9_2, 9_3, 10_0, 10_1, 11_0, 11_1, 12_0, 12_1

# d3d11.maxFeatureLevel = 12_1


# Overrides the maximum allowed tessellation factor. This can be used to
# improve performance in titles which overuse tessellation.
# 
# Supported values: Any number between 8 and 64

# d3d11.maxTessFactor = 0


# Enables relaxed pipeline barriers around UAV writes.
# 
# This may improve performance in some games, but may also introduce
# rendering issues. Please don't report bugs with the option enabled.
#
# Supported values: True, False

# d3d11.relaxedBarriers = False


# Ignores barriers around UAV writes from fragment shaders.
#
# This may improve performance in some games, but may also introduce
# rendering issues. Please don't report bugs with the option enabled.
#
# Supported values: True, False

# d3d11.ignoreGraphicsBarriers = False


# Overrides anisotropic filtering for all samplers. Set this to a positive
# value to enable AF for all samplers in the game, or to 0 in order to
# disable AF entirely. Negative values will have no effect.
# 
# Supported values: Any number between 0 and 16

# d3d11.samplerAnisotropy = -1
# d3d9.samplerAnisotropy = -1


# Changes the mipmap LOD bias for all samplers. The given number will be
# added to the LOD bias provided by the application, rather than replacing
# it entirely. Positive values will reduce texture detail, while negative
# values may increase sharpness at the cost of shimmer.
#
# Supported values: Any number between -2.0 and 1.0

# d3d11.samplerLodBias = 0.0


# Declares vertex positions as invariant in order to solve
# potential Z-fighting issues at a small performance cost.
#
# Supported values: True, False

# d3d11.invariantPosition = True
# d3d9.invariantPosition = True


# Forces the sample count of all textures to 1, and performs
# the needed fixups in resolve operations and shaders.
#
# Supported values: True, False

# d3d11.disableMsaa = False


# Clears workgroup memory in compute shaders to zero. Some games don't do
# this and rely on undefined behaviour. Enabling may reduce performance.
#
# Supported values: True, False

# d3d11.zeroWorkgroupMemory = False


# Resource size limit for implicit discards, in kilobytes. For small staging
# resources mapped with MAP_WRITE, DXVK will sometimes allocate new backing
# storage in order to avoid GPU synchronization, so setting this too high
# may cause memory issues, setting it to -1 disables the feature.

# d3d11.maxImplicitDiscardSize = 256


# Resource size limit for buffer-mapped dynamic images, in kilobytes.
# A higher threshold may reduce memory usage and PCI-E bandwidth in
# some games, but may also increase GPU synchronizations. Setting it
# to -1 disables the feature.

# d3d11.maxDynamicImageBufferSize = -1


# Allocates dynamic resources with the given set of bind flags in
# cached system memory rather than uncached memory or host-visible
# VRAM, in order to allow fast readback from the CPU. This is only
# useful for buggy applications, and may reduce GPU-bound performance.
#
# Supported values: Any combination of the following:
# - v: Vertex buffers
# - i: Index buffers
# - c: Constant buffers
# - r: Shader resources
# - a: All dynamic resources

# d3d11.cachedDynamicResources = ""


# Force-enables the D3D11 context lock via the ID3D10Multithread
# interface. This may be useful to debug race conditions.
#
# Supported values: True, False

# d3d11.enableContextLock = False


# Sets number of pipeline compiler threads.
# 
# If the graphics pipeline library feature is enabled, the given
# number of threads will be used for shader compilation. Some of
# these threads will be reserved for high-priority work.
#
# Supported values:
# - 0 to use all available CPU cores
# - any positive number to enforce the thread count

# dxvk.numCompilerThreads = 0


# Toggles raw SSBO usage.
# 
# Uses storage buffers to implement raw and structured buffer
# views. Enabled by default on hardware which has a storage
# buffer offset alignment requirement of 4 Bytes (e.g. AMD).
# Enabling this may improve performance, but is not safe on
# hardware with higher alignment requirements.
# 
# Supported values:
# - Auto: Don't change the default
# - True, False: Always enable / disable

# dxvk.useRawSsbo = Auto


# Controls graphics pipeline library behaviour
#
# Can be used to change VK_EXT_graphics_pipeline_library usage for
# debugging purpose. Doing so will likely result in increased stutter
# or degraded performance.
#
# Supported values:
# - Auto: Enable if supported, and compile optimized pipelines in the background
# - True: Enable if supported, but do not compile optimized pipelines
# - False: Always disable the feature

# dxvk.enableGraphicsPipelineLibrary = Auto


# Controls pipeline lifetime tracking
#
# If enabled, pipeline libraries will be freed aggressively in order
# save memory and address space. Has no effect if graphics pipeline
# libraries are not supported or disabled.
#
# Supported values:
# - Auto: Enable tracking for 32-bit applications only
# - True: Always enable tracking
# - False: Always disable tracking

# dxvk.trackPipelineLifetime = Auto


# Sets enabled HUD elements
# 
# Behaves like the DXVK_HUD environment variable if the
# environment variable is not set, otherwise it will be
# ignored. The syntax is identical.

# dxvk.hud = 


# Reported shader model
#
# The shader model to state that we support in the device
# capabilities that the applicatation queries.
# 
# Supported values:
# - 1: Shader Model 1
# - 2: Shader Model 2
# - 3: Shader Model 3

# d3d9.shaderModel = 3


# DPI Awareness
# 
# Decides whether we should call SetProcessDPIAware on device
# creation. Helps avoid upscaling blur in modern Windows on
# Hi-DPI screens/devices.
#
# Supported values:
# - True, False: Always enable / disable

# d3d9.dpiAware = True


# Strict Constant Copies
# 
# Decides whether we should always copy defined constants to
# the UBO when relative addressing is used, or only when the
# relative addressing starts a defined constant.
#
# Supported values:
# - True, False: Always enable / disable

# d3d9.strictConstantCopies = False


# Strict Pow
# 
# Decides whether we have an opSelect for handling pow(0,0) = 0
# otherwise it becomes undefined.
#
# Supported values:
# - True, False: Always enable / disable

# d3d9.strictPow = True


# Lenient Clear
#
# Decides whether or not we fastpath clear anyway if we are close enough to
# clearing a full render target.
#
# Supported values:
# - True, False: Always enable / disable

# d3d9.lenientClear = False


# Max available memory
#
# Changes the max initial value used in tracking and GetAvailableTextureMem
# Value in Megabytes
#
# Supported values:
# - Max Available Memory: Any int32_t
# - Memory Tracking Testing: True, False

# d3d9.maxAvailableMemory = 4096
# d3d9.memoryTrackTest = False


# Force enable/disable floating point quirk emulation
#
# Force toggle anything * 0 emulation
# Setting it to True will use a faster but less accurate approach that works for most games.
# Supported values:
# - True: Use a faster but less accurate approach. Good enough for most games
# - False: Disable float emulation completely
# - Strict: Use a slower but more correct approach. Necessary for some games
# - Auto: DXVK will pick automatically

# d3d9.floatEmulation = Auto


# Enable dialog box mode
#
# Changes the default state of dialog box mode.
# *Disables* exclusive fullscreen when enabled.
#
# Supported values:
# - True, False: Always enable / disable

# d3d9.enableDialogMode = False

# Overrides the application's MSAA level on the swapchain
# 
# Supported values: -1 (application) and 0 to 16 (user override)

# d3d9.forceSwapchainMSAA = -1


# Long Mad
#
# Should we make our Mads a FFma or do it the long way with an FMul and an FAdd?
# This solves some rendering bugs in games that have z-pass shaders which
# don't match entirely to the regular vertex shader in this way.
#
# Supported values:
# - True/False

# d3d9.longMad = False

# Device Local Constant Buffers
#
# Enables using device local, host accessible memory for constant buffers in D3D9.
# This tends to actually be slower for some reason on AMD,
# and the exact same performance on NVIDIA.
#
# Supported values:
# - True/False

# d3d9.deviceLocalConstantBuffers = False

# No Explicit Front Buffer
#
# Disables the front buffer
#
# Supported values:
# - True/False

# d3d9.noExplicitFrontBuffer = False

# Support DF formats
#
# Support the vendor extension DF floating point depth formats
#
# Supported values:
# - True/False

# d3d9.supportDFFormats = True

# Use D32f for D24
#
# Useful for reproducing AMD issues on other hw.
#
# Supported values:
# - True/False

# d3d9.useD32forD24 = False

# Support X4R4G4B4
#
# Support the X4R4G4B4 format.
# The Sims 2 is a horrible game made by complete morons.
#
# Supported values:
# - True/False

# d3d9.supportX4R4G4B4 = True

# Support D32
#
# Support the D32 format.
#
# Supported values:
# - True/False

# d3d9.supportD32 = True

# Disable A8 as a Render Target
#
# Disable support for A8 format render targets
# Once again, The Sims 2 is a horrible game made by complete morons.
#
# Supported values:
# - True/False

# d3d9.disableA8RT = False

# Support for VCache Query
#
# Support for the vcache query
# Not very important as a user config.
# Used internally.
#
# Supported values:
# - True/False

# Defaults to True if vendorId == 0x10de
# d3d9.supportVCache = True

# Force Sampler Type Spec Constants
#
# Useful if games use the wrong image and sampler
# type combo like Halo: CE or Spellforce.
# Can fix rendering in older, broken games in some instances.
#
# Supported values:
# - True/False

# d3d9.forceSamplerTypeSpecConstants = False

# Force Aspect Ratio
#
# Only exposes modes with a given aspect ratio.
# Useful for titles that break if they see ultra-wide.
#
# Supported values:
# - Any ratio, ie. "16:9", "4:3"

# d3d9.forceAspectRatio = ""

# Allow Discard
#
# Allow the discard lock flag to be used
# Useful if some apps use this incorrectly.
#
# Supported values:
# - True/False

# d3d9.allowDiscard = True

# Enumerate by Displays
#
# Whether we should enumerate D3D9 adapters by display (windows behaviour)
# or by physical adapter.
# May be useful in PRIME setups.
#
# Supported values:
# - True/False

# d3d9.enumerateByDisplays = True

# APITrace Mode
#
# Makes all host visible buffers cached and coherent
# Improves performance when apitracing, but also can impact
# some dumb games.
#
# Supported values:
# - True/False

# d3d9.apitraceMode = False

# Seamless Cubes
#
# Don't use non seamless cube maps even if they are supported.
# Non seamless cubes are correct d3d9 behavior, but can produce worse looking edges.
#
# Supported values:
# - True/False

# d3d9.seamlessCubes = False

# Debug Utils
#
# Enables debug utils as this is off by default, this enables user annotations like BeginEvent()/EndEvent().
# Alternatively could be enabled with DXVK_DEBUG=markers environment variable.
#
# Supported values:
# - True/False

# dxvk.enableDebugUtils = False

# Memory limit for locked D3D9 textures
#
# How much virtual memory will be used for textures (in MB).
# 0 to disable the limit.
# THIS DOES NOT IMPACT ACTUAL MEMORY CONSUMPTION OR TEXTURE QUALITY.
# DO NOT CHANGE THIS UNLESS YOU HAVE A VERY GOOD REASON.

# d3d9.textureMemory = 100


```



``` sh title="MongoHud.conf"
### MangoHud configuration file
### Uncomment any options you wish to enable. Default options are left uncommented
### Use some_parameter=0 to disable a parameter (only works with on/off parameters)
### Everything below can be used / overridden with the environment variable MANGOHUD_CONFIG instead

################ PERFORMANCE #################

### Limit the application FPS. Comma-separated list of one or more FPS values (e.g. 0,30,60). 0 means unlimited (unless VSynced)
fps_limit=60

### VSync [0-3] 0 = adaptive; 1 = off; 2 = mailbox; 3 = on
vsync=0

### OpenGL VSync [0-N] 0 = off; >=1 = wait for N v-blanks, N > 1 acts as a FPS limiter (FPS = display refresh rate / N)
gl_vsync=1

################### VISUAL ###################

### Legacy layout
# legacy_layout=false

### Display custom centered text, useful for a header
# custom_text_center=

### Display the current system time
time

### Time formatting examples
# time_format=%H:%M
# time_format=[ %T %F ]
# time_format=%X # locally formatted time, because of limited glyph range, missing characters may show as '?' (e.g. Japanese)

### Display MangoHud version
version

### Display the current GPU information
## Note: gpu_mem_clock also needs "vram" to be enabled
gpu_stats
# gpu_temp
# gpu_core_clock
# gpu_mem_clock
# gpu_power
# gpu_text=GPU
# gpu_load_change
# gpu_load_value=60,90
# gpu_load_color=39F900,FDFD09,B22222

### Display the current CPU information
cpu_stats
# cpu_temp
# cpu_power
# cpu_text=CPU
# cpu_mhz
# cpu_load_change
# cpu_load_value=60,90
# cpu_load_color=39F900,FDFD09,B22222

### Display the current CPU load & frequency for each core
# core_load
# core_load_change

### Display IO read and write for the app (not system)
# io_stats
# io_read
# io_write

### Display system vram / ram / swap space usage
# vram
# ram
# swap

### Display per process memory usage
## Show resident memory and other types, if enabled
# procmem
# procmem_shared
# procmem_virt

### Display battery information
# battery
# battery_icon
# gamepad_battery
# gamepad_battery_icon

### Display FPS and frametime
fps
# fps_sampling_period=500
# fps_color_change
# fps_value=30,60
# fps_color=B22222,FDFD09,39F900
frametime
# frame_count

### Display miscellaneous information
# engine_version
# gpu_name
#- vulkan_driver
# wine

### Display loaded MangoHud architecture
# arch

### Display the frametime line graph
frame_timing
# histogram

### Display GameMode / vkBasalt running status
# gamemode
# vkbasalt

### Display current FPS limit
# show_fps_limit

### Display the current resolution
# resolution

### Display custom text
# custom_text=
### Display output of Bash command in next column
# exec=

### Display media player metadata
# media_player
# media_player_name=spotify
## Format metadata, lines are delimited by ; (wip)
# media_player_format={title};{artist};{album}
# media_player_format=Track:;{title};By:;{artist};From:;{album}

### Change the hud font size
# font_size=24
# font_scale=1.0
# font_size_text=24
# font_scale_media_player=0.55
# no_small_font

### Change default font (set location to TTF/OTF file)
## Set font for the whole hud
# font_file=

## Set font only for text like media player metadata
# font_file_text=

## Set font glyph ranges. Defaults to Latin-only. Don't forget to set font_file/font_file_text to font that supports these
## Probably don't enable all at once because of memory usage and hardware limits concerns
## If you experience crashes or text is just squares, reduce glyph range or reduce font size
# font_glyph_ranges=korean,chinese,chinese_simplified,japanese,cyrillic,thai,vietnamese,latin_ext_a,latin_ext_b

### Change the hud position
# position=top-left

### Change the corner roundness
# round_corners=

### Disable / hide the hud by default
no_display

### Hud position offset
# offset_x=
# offset_y=

### Hud dimensions
# width=
# height=
# table_columns=
# cellpadding_y=

### Hud transparency / alpha
# background_alpha=0.5
# alpha=

### FCAT overlay
### This enables an FCAT overlay to perform frametime analysis on the final image stream.
### Enable the overlay
# fcat
### Set the width of the FCAT overlay.
### 24 is a performance optimization on AMD GPUs that should not have adverse effects on nVidia GPUs.
### A minimum of 20 pixels is recommended by nVidia.
# fcat_overlay_width=24
### Set the screen edge, this can be useful for special displays that don't update from top edge to bottom. This goes from 0 (left side) to 3 (top edge), counter-clockwise.
# fcat_screen_edge=0

### Color customization
# text_color=FFFFFF
# gpu_color=2E9762
# cpu_color=2E97CB
# vram_color=AD64C1
# ram_color=C26693
# engine_color=EB5B5B
# io_color=A491D3
# frametime_color=00FF00
# background_color=020202
# media_player_color=FFFFFF
# wine_color=EB5B5B
# battery_color=FF9078

### Specify GPU with PCI bus ID for AMDGPU and NVML stats
### Set to 'domain:bus:slot.function'
# pci_dev=0:0a:0.0

### Blacklist
# blacklist=

### Control over socket
### Enable and set socket name, '%p' is replaced with process id
# control = mangohud
# control = mangohud-%p

################ WORKAROUNDS #################
### Options starting with "gl_*" are for OpenGL
### Specify what to use for getting display size. Options are "viewport", "scissorbox" or disabled. Defaults to using glXQueryDrawable
# gl_size_query=viewport

### (Re)bind given framebuffer before MangoHud gets drawn. Helps with Crusader Kings III
# gl_bind_framebuffer=0

### Don't swap origin if using GL_UPPER_LEFT. Helps with Ryujinx
# gl_dont_flip=1

################ INTERACTION #################

### Change toggle keybinds for the hud & logging
# toggle_hud=Shift_R+F12
# toggle_fps_limit=Shift_L+F1
# toggle_logging=Shift_L+F2
# reload_cfg=Shift_L+F4
# upload_log=Shift_L+F3

#################### LOG #####################
### Automatically start the log after X seconds
# autostart_log=1
### Set amount of time in seconds that the logging will run for
# log_duration=
### Change the default log interval, 100 is default
# log_interval=100
### Set location of the output files (required for logging)
# output_folder=/home/<USERNAME>/mangologs
### Permit uploading logs directly to FlightlessMango.com
# permit_upload=1
### Define a '+'-separated list of percentiles shown in the benchmark results
### Use "AVG" to get a mean average. Default percentiles are 97+AVG+1+0.1
# benchmark_percentiles=97,AVG,1,0.1

```


## Mangohud Steam

Go to game properties and in the launch options enter: `mangohud %command%`