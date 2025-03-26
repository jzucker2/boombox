# Alsa

* https://github.com/HEnquist/camilladsp/blob/master/backend_alsa.md

```
pi@showerspeakerz:~/boombox $ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: vc4hdmi0 [vc4-hdmi-0], device 0: MAI PCM i2s-hifi-0 [MAI PCM i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: vc4hdmi1 [vc4-hdmi-1], device 0: MAI PCM i2s-hifi-0 [MAI PCM i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Headphones [bcm2835 Headphones], device 0: bcm2835 Headphones [bcm2835 Headphones]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
card 3: Audio [KT USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

```
pi@showerspeakerz:~/boombox $ amixer
Simple mixer control 'Master',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 65536
  Mono:
  Front Left: Playback 26214 [40%] [on]
  Front Right: Playback 26214 [40%] [on]
Simple mixer control 'Capture',0
  Capabilities: cvolume cswitch cswitch-joined
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 65536
  Front Left: Capture 65536 [100%] [on]
  Front Right: Capture 65536 [100%] [on]
pi@showerspeakerz:~/boombox $ amixer controls
numid=4,iface=MIXER,name='Master Playback Switch'
numid=3,iface=MIXER,name='Master Playback Volume'
numid=2,iface=MIXER,name='Capture Switch'
numid=1,iface=MIXER,name='Capture Volume'
pi@showerspeakerz:~/boombox $ cat /proc/asound/cards 
 0 [vc4hdmi0       ]: vc4-hdmi - vc4-hdmi-0
                      vc4-hdmi-0
 1 [vc4hdmi1       ]: vc4-hdmi - vc4-hdmi-1
                      vc4-hdmi-1
 2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
                      bcm2835 Headphones
 3 [Audio          ]: USB-Audio - KT USB Audio
                      KTMicro KT USB Audio at usb-0000:01:00.0-1.2, full speed
```

```
In **alsamixer**, the difference between **'Master Playback Volume'** and **'Master Playback Switch'** is:

1. **Master Playback Volume** – This controls the overall output volume of your system. Adjusting this changes the loudness of all audio that passes through the Master channel.

2. **Master Playback Switch** – This is a mute/unmute toggle. If it's **on**, audio will play according to the Master Playback Volume setting. If it's **off**, all audio output is muted regardless of the volume setting.

In alsamixer, the switch is usually represented by **[MM]** (muted) or **[OO]** (unmuted). You can toggle it using the **M key** on your keyboard.
```

```
pi@showerspeakerz:~ $ aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default
    Playback/recording through the PulseAudio sound server
sysdefault
    Default Audio Device
lavrate
    Rate Converter Plugin Using Libav/FFmpeg Library
samplerate
    Rate Converter Plugin Using Samplerate Library
speexrate
    Rate Converter Plugin Using Speex Resampler
jack
    JACK Audio Connection Kit
oss
    Open Sound System
pulse
    PulseAudio Sound Server
speex
    Plugin using Speex DSP (resample, agc, denoise, echo, dereverb)
upmix
    Plugin for channel upmix (4,6,8)
vdownmix
    Plugin for channel downmix (stereo) with a simple spacialization
hw:CARD=vc4hdmi0,DEV=0
    vc4-hdmi-0, MAI PCM i2s-hifi-0
    Direct hardware device without any conversions
plughw:CARD=vc4hdmi0,DEV=0
    vc4-hdmi-0, MAI PCM i2s-hifi-0
    Hardware device with all software conversions
sysdefault:CARD=vc4hdmi0
    vc4-hdmi-0, MAI PCM i2s-hifi-0
    Default Audio Device
hdmi:CARD=vc4hdmi0,DEV=0
    vc4-hdmi-0, MAI PCM i2s-hifi-0
    HDMI Audio Output
dmix:CARD=vc4hdmi0,DEV=0
    vc4-hdmi-0, MAI PCM i2s-hifi-0
    Direct sample mixing device
usbstream:CARD=vc4hdmi0
    vc4-hdmi-0
    USB Stream Output
hw:CARD=vc4hdmi1,DEV=0
    vc4-hdmi-1, MAI PCM i2s-hifi-0
    Direct hardware device without any conversions
plughw:CARD=vc4hdmi1,DEV=0
    vc4-hdmi-1, MAI PCM i2s-hifi-0
    Hardware device with all software conversions
sysdefault:CARD=vc4hdmi1
    vc4-hdmi-1, MAI PCM i2s-hifi-0
    Default Audio Device
hdmi:CARD=vc4hdmi1,DEV=0
    vc4-hdmi-1, MAI PCM i2s-hifi-0
    HDMI Audio Output
dmix:CARD=vc4hdmi1,DEV=0
    vc4-hdmi-1, MAI PCM i2s-hifi-0
    Direct sample mixing device
usbstream:CARD=vc4hdmi1
    vc4-hdmi-1
    USB Stream Output
hw:CARD=Headphones,DEV=0
    bcm2835 Headphones, bcm2835 Headphones
    Direct hardware device without any conversions
plughw:CARD=Headphones,DEV=0
    bcm2835 Headphones, bcm2835 Headphones
    Hardware device with all software conversions
sysdefault:CARD=Headphones
    bcm2835 Headphones, bcm2835 Headphones
    Default Audio Device
dmix:CARD=Headphones,DEV=0
    bcm2835 Headphones, bcm2835 Headphones
    Direct sample mixing device
usbstream:CARD=Headphones
    bcm2835 Headphones
    USB Stream Output
hw:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    Direct hardware device without any conversions
plughw:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    Hardware device with all software conversions
sysdefault:CARD=Audio
    KT USB Audio, USB Audio
    Default Audio Device
front:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    Front output / input
surround21:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    4.0 Surround output to Front and Rear speakers
surround41:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
iec958:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    IEC958 (S/PDIF) Digital Audio Output
dmix:CARD=Audio,DEV=0
    KT USB Audio, USB Audio
    Direct sample mixing device
usbstream:CARD=Audio
    KT USB Audio
    USB Stream Output
```
