# boombox

This is just an easy repo for running stuff:

* https://github.com/mikebrady/shairport-sync
* https://hub.docker.com/r/mikebrady/sps-alsa-explore

```
$ docker run --device /dev/snd mikebrady/sps-alsa-explore
> Device Full Name:    "hw:sndrpihifiberry"
  Short Name:          "hw:0"
  This device seems suitable for use with Shairport Sync.
  The following rate and format would be chosen by Shairport Sync in "auto" mode:
     Rate              Format
     44100             S32_LE

> Device Full Name:    "hdmi:vc4hdmi0"
  Short Name:          "hdmi:1"
  This device seems suitable for use with Shairport Sync.
  The following rate and format would be chosen by Shairport Sync in "auto" mode:
     Rate              Format
     44100             S32_LE

> Device Full Name:    "hdmi:vc4hdmi1"
  Short Name:          "hdmi:2"
  This HDMI port is not initialised. To use it:
   (1) connect it up to the output device,
   (2) turn on the output device and select this device as input,
   (3) reboot and try again.

```
