CUPS role
==========

[![Read about CUPS in the ArchLinux Wiki](https://img.shields.io/badge/-ArchWiki-informational)][archlinux-wiki]

[CUPS][cups] is the open-source printing system for macOS and UNIX-like
operating systems (including Linux).


## Included tasks

- [x] Install CUPS;
- [x] Reload SystemD daemons;
- [x] Start `org.cups.cupsd.socket` (to start the CUPS service on demand);
- [x] Enable `org.cups.cupsd.socket` (to start on system start-up).


## Use cases

- Printing stuff.


## Dependencies

None.


## Required for

- Setting up [printers](../printers).


[cups]: https://www.cups.org/
[archlinux-wiki]: https://wiki.archlinux.org/index.php/CUPS
