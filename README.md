# boombox

I got it working! Now to really use it ...

This is just an easy repo for running stuff:

* https://github.com/mikebrady/shairport-sync
* https://github.com/jzucker2/simple-shairport-sync
* https://hub.docker.com/r/mikebrady/sps-alsa-explore
* https://github.com/parautenbach/hass-shairport-sync

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

```
pi@boombox:~ $ ifconfig -a
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.1.202  netmask 255.255.255.0  broadcast 10.0.1.255
        inet6 fe80::ea4f:52a6:906b:e694  prefixlen 64  scopeid 0x20<link>
        inet6 fd2c:a1b:6d5d:2d4a:6c57:20ac:b804:1f7b  prefixlen 64  scopeid 0x0<global>
        ether d8:3a:dd:28:50:aa  txqueuelen 1000  (Ethernet)
        RX packets 1552  bytes 608333 (594.0 KiB)
        RX errors 0  dropped 133  overruns 0  frame 0
        TX packets 506  bytes 72335 (70.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 17  bytes 2146 (2.0 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 17  bytes 2146 (2.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.1.203  netmask 255.255.255.0  broadcast 10.0.1.255
        inet6 fd2c:a1b:6d5d:2d4a:a6a:2c79:3f84:cf81  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::b50f:cb2d:db06:23d4  prefixlen 64  scopeid 0x20<link>
        ether d8:3a:dd:28:50:ab  txqueuelen 1000  (Ethernet)
        RX packets 728  bytes 166315 (162.4 KiB)
        RX errors 0  dropped 126  overruns 0  frame 0
        TX packets 90  bytes 20679 (20.1 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Create a file at `/etc/environment` like:

```
# Could also use America/New_York or America/Chicago or America/Denver
TZ=America/Los_Angeles
# The BOOMBOX_DHCP_IP should be whatever your ethernet port is
BOOMBOX_DHCP_IP=10.0.1.177
DOCKER_LOCALHOST="host.docker.internal"
AIRPLAY_NAME=ShowerSpeakerzAirplay
SPOTIFY_NAME="ShowerSpeakerzSpotify"
AUDIO_OUTPUT_DEVICE=hw:Audio
MQTT_HOSTNAME=10.0.1.104
MQTT_PORT=1883
MQTT_USERNAME=hass
MQTT_PASSWORD=raspberry
MQTT_TOPIC=shairport/prod/showerspeakerz
CADVISOR_EXTERNAL_PORT=8080
NODE_EXPORTER_EXTERNAL_PORT=9100
PROMTAIL_EXTERNAL_PORT=9080
```
