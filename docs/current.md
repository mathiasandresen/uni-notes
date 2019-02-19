# Current State
Currently the network consists of three different types of units, that are configured through undocumented bash- php- and python scripts.

### Core
A single server acting as a firewall, router and webserver.

*Note: It is bad practice to run a webserver bare-metal on your firewall/router.*

### Switch
Many managed switches are deployed to isolate each apartments network though VLAN tagging.

### Access Points
Acces points are deployed to give residents WiFi-acces thoughout the residence.

## Scope

### Wired internet

- Deliver a fast (??/?? Mbit/s), low latency (?? ms) internet connection to each apartment
- Isolate each apartments connection

### Wireless internet

- Deliver a usable (?/?) internet connection (via WiFi) to each apartment

### Website

- Provide information about ABK at a custom domain.
