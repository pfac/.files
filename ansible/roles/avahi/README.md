Avahi role
==========

[![Read about Avahi in the ArchLinux Wiki](https://img.shields.io/badge/-ArchWiki-informational)][archlinux-wiki]

[Avahi][avahi] is a free zeroconf implementation, including a system for
multicast DNS/DNS-SD service discovery.


## Included tasks

- [x] Install Avahi;
- [x] Reload SystemD daemons;
- [ ] Enable `.local` hostname resolution in configuration (See
  [caveats](#Caveats);
- [x] Enable `avahi-daemon` service (to start on system start-up);
- [x] Start `avahi-daemon` service;


## Use cases

- Automatic discovery of printers shared in the local network.


## Dependencies

None.


## Required for

- Setting up [printers](../printers).


## Supported systems

- [x] [ArchLinux][archlinux];


## Caveats

*This role currently does not enable `.local` hostname resolution*. This is
because doing so requires changing the [Name Service Switch
configuration][nsswitch-conf] file, and there does not seem to exist any tool
or command to change this configuration in any other way.

To be future-proof, customizing this configuration should be done in an another
file that not `/etc/nsswitch.conf`, which a package may change on an update.

Since we apparently have to change this file, I do not want to have a
configuration file in this repository to overwrite the package contents (as it
may include necessary stuff). I would rather have a tool capable of parsing the
contents of the file, and performing the minimal change for this to work,
idempotently.

Until I either get a tool for managing this config and/or change this file, or
get a different file for our customizations, *this process is manual*.

See the [ArchLinux's wiki for further
details](https://wiki.archlinux.org/index.php/Avahi#Hostname_resolution).


[archlinux]: https://www.archlinux.org/
[archlinux-wiki]: https://wiki.archlinux.org/index.php/Avahi
[avahi]: http://avahi.org/
[nsswitch-conf]: http://man7.org/linux/man-pages/man5/nsswitch.conf.5.html
