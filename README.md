# iocage-plugin-transmission
- Fast and lightweight BitTirrent client.

Artifact file(s) for iocage transmission plugin.

## To install this Plugin
Download the plugin manifest file to your local file system.
```
fetch https://raw.githubusercontent.com/dlcisme/iocage-my-plugins/master/transmission.json
```
Install the plugin.  Adjust host interface and IP address as needed.  
```
iocage fetch -P -n transmission.json ip4_addr="em0|192.168.0.100"
```
Plugin has interface pre-defined for DHCP in properties
```
iocage fetch -P transmission.json -n transmission
```
