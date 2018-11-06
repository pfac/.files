# pfac's home

[![Build Status](https://travis-ci.org/pfac/.files.svg?branch=master)](https://travis-ci.org/pfac/.files)
[![Build Status](https://semaphoreci.com/api/v1/pfac/files/branches/master/shields_badge.svg)](https://semaphoreci.com/pfac/files)

Home is where I have all my toys, configurations and shortcuts ready for me to
play with. And that's what this repository is, it makes a home in the systems I
use.


## Batteries included

Here's a quick gist of what you should find in this repository:

- A couple of (probably) useful tools to be placed in `~/.local`;
- Generic shell, [Bash][bash] and [Zsh][zsh] configurations (I tend to prefer the latter);
- Terminal emulators configurations and color schemes;
- [Git][git] configurations;
- [Tmux][tmux] configurations;
- [Vim][vim] and [NeoVim][neovim] configurations;
- And probably some more stuff lying around.


## Installation

Simply clone this repository into your computer and copy/link whatever files
you want to use to the locations each tool expects.


### With a script (work-in-progress)

Simply paste this in a terminal prompt and let the magic :sparkles: happen:

    curl -fsSL https://raw.githubusercontent.com/pfac/.files/master/bin/install | /bin/sh

Or, if you already cloned the repository, just run:

    bin/install

Here's what this idempotent script will do:

1. Checks the system for a package manager, and installs one if not found;
2. Checks the system for installations of [Ansible][ansible] and [Git][git], and uses the package manager to install them if not found;
3. Clones the repository into `~/Developer/pfac/.files`;
4. Runs `bin/provision`, which will use Ansible to provision the system.


### How do I know that script is safe?

It is [open-source](https://github.com/pfac/.files/blob/master/bin/install),
which means you can actually see what it does. It should be fairly readable.


## Provisioning

For now, most of the provisioning process is manual. You're in charge of copying
the relevant files to their expected locations.


### With a script (work-in-progress)

    bin/provision

This script will use [Ansible][ansible] to provision the current system with
these preferences.

**NOTE:** Only macOS is supported currently. Linux support coming soon.

Here's what Ansible will do to the system:

1. Update the package manager cache, and upgrade all installed packages;
2. That's it! :tada: More coming soon.


## License

This project is published under the [GNU General Public License v3.0][license].


### Why GPL 3.0?

Because it is a highly permissive usage license which forces others using this
project to publish their derivative works with the same license, thus allowing
others to learn from them.

I hope using such a license serves the purpose of encouraging others to share
their knowledge.


[ansible]: https://www.ansible.com/
[bash]: https://www.gnu.org/software/bash/
[git]: https://git-scm.com/
[license]: /LICENSE.txt
[neovim]: https://neovim.io/
[tmux]: https://github.com/tmux/tmux
[vim]: https://www.vim.org/
[zsh]: http://www.zsh.org/
