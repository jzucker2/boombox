# Shairport

* https://github.com/mikebrady/shairport-sync
* https://hub.docker.com/r/mikebrady/shairport-sync
* https://github.com/parautenbach/hass-shairport-sync

```
mqtt =
{
    enabled = "yes";
    hostname = "10.0.1.104";
    port = 1883; // MQTT broker port; this is the default
    username = "hass";
    password = "raspberry";
    topic = "shairport/prod/showerspeakerz";
    publish_parsed = "yes"; // For metadata
    publish_cover = "yes"; // Album art
    enable_remote = "yes"; // Remote control
}
```

## Finding Sound Output

* https://github.com/mikebrady/shairport-sync/discussions/1623
* https://github.com/mikebrady/shairport-sync/issues/1564
* https://github.com/mikebrady/sps-alsa-explore
* https://hub.docker.com/r/mikebrady/sps-alsa-explore
* https://hub.docker.com/r/mikebrady/dacquery


```
docker run --device /dev/snd mikebrady/dacquery
```

```
# or with more info
docker run --device /dev/snd mikebrady/dacquery -e
```

Also found this:

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
