Docker role
===========

[![Read about Docker in the ArchLinux Wiki](https://img.shields.io/badge/-ArchWiki-informational)][archlinux-wiki]

[Docker][docker] is a utility to pack, ship and run any application as a
lightweight container.


## Included tasks

- [x] Install Docker;
- [x] Reload SystemD daemons;
- [x] Enable `docker` service (to start on system start-up);
- [x] Start `docker` service;
- [x] Change storage driver to `overlay2`.


## Use cases

- Pack applications in a contained virtual system so that they stop polluting
  my system with all the garbage they need.


## Dependencies

None.


## Required for

Nothing.


## Supported systems

- [x] [ArchLinux][archlinux];


[archlinux]: https://www.archlinux.org/
[archlinux-wiki]: https://wiki.archlinux.org/index.php/Docker
[docker]: https://www.docker.com/
