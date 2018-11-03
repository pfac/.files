# pfac's home

Home is where I have all my toys, configurations and shortcuts ready for me to
play with. And that's what this repository is, it makes a home in the systems I
use.


## Install these configurations

Simply clone this repository into your computer and copy/link whatever files
you want to use to the locations each tool expects.


### With a script (work-in-progress)

Simply paste this in a terminal prompt and let the magic :sparkles: happen:

    curl -fsSL https://raw.githubusercontent.com/pfac/.files/master/bin/install | /bin/sh

It is only a placeholder yet, so you should only see an hello world message.


### How do I know that script is safe?

It is [open-source](https://github.com/pfac/.files/blob/master/bin/install),
which means you can actually see what it does. It should be fairly readable.


## Included configurations

Here's a quick gist of what you should find in this repository:

- A couple of (probably) useful tools to be placed in `~/.local`;
- Generic shell, [Bash][bash] and [Zsh][zsh] configurations (I tend to prefer the latter);
- Terminal emulators configurations and color schemes;
- [Git][git] configurations;
- [Sublime Text 3][sublime-text] preferences (deprecated in favor of Vim);
- [Tmux][tmux] configurations;
- [Vim][vim] and [NeoVim][neovim] configurations;
- And probably some more stuff lying around.


## License

This project is published under the [GNU General Public License v3.0][license].


### Why GPL 3.0?

Because it is a highly permissive usage license which forces others using this
project to publish their derivative works with the same license, thus allowing
others to learn from them.

I hope using such a license serves the purpose of encouraging others to share
their knowledge.


[awk]: https://github.com/onetrueawk/awk
[bash]: https://www.gnu.org/software/bash/
[git]: https://git-scm.com/
[license]: /LICENSE.txt
[neovim]: https://neovim.io/
[sublime-text]: https://www.sublimetext.com/
[tmux]: https://github.com/tmux/tmux
[vim]: https://www.vim.org/
[zsh]: http://www.zsh.org/
