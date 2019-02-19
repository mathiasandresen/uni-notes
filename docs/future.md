# Future State

## Scope (up for discussion)
Since people of varying skill levels come and go, **maintainability** should be the first priority and ABK-NET should never rely on a single person.

Thus the network should be well documented, this includes, but is not limited to explaining:

- Contributing
- Updating
- Troubleshooting
- Disaster Recovery
- Network structure
- Rationale behind decicions

### Wired internet

- Deliver a fast (??/?? Mbit/s), low latency (?? ms) internet connection to each apartment
- Isolate each apartments connection

### Wireless internet

- Deliver a usable (?/?) internet connection (via WiFi) to each apartment

### Website

- Provide information about ABK at abk-aalborg.dk

## Network Structure (up for discussion)
This will depend on the scope.

## Suggested hardware (up for discussion)

## Suggested Tools (up for discussion)
This will depend on the structure of the network.

### Firewall and router

 - **[pfSense]**: A [FreeBSD]-based ([what is BSD?]) firewall and router with a web GUI.

[FreeBSD]: https://www.freebsd.org/
[what is BSD?]: https://www.freebsd.org/doc/en_US.ISO8859-1/articles/explaining-bsd/article.html
[pfSense]: https://www.pfsense.org/

### Website

 - **[Gitlab Pages]** and **[MkDocs]**: Very easy and free (free as in freedom and as in free beer) websites with different themes available. It is what this site uses.

[Gitlab Pages]: https://docs.gitlab.com/ee/user/project/pages/
[MkDocs]: https://www.mkdocs.org/
[themes]: https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes
