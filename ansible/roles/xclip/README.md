# xclip

- Source: https://github.com/astrand/xclip

Command-line tool to copy and paste content into and from the system's
clipboard for systems using an X11 implementation. Similar to `pbcopy`/`pbpaste`
in OSX.

## Usage

Copy standard input to clipboard:

```
xclip -sel clip
```

Paste from clipboard to standard output:

```
xclip -sel clip -o
```

## Caveats

There are 3 selections (a.k.a clipboards) available in X11 implementations.

**The PRIMARY selection is the last selected thing**. You select some random
text somewhere, bam, PRIMARY is set to it.

SECONDARY is useless. Most applications won't know what to do with it, and
there's no standard way of setting it, so we simply ignore it.

**CLIPBOARD selection is the Windows/Mac equivalent of a clipboard**, and works
just like it, by being set whenever the user explicitly copies something there.

**PRIMARY is pasted with the middle-mouse button**, reason why we have to
disable it in Firefox, for instance, so that we can use it to drag ourselves
around canvas applications like Figma.

By default `xclip` will use PRIMARY, so we have to explicitly tell it to use
CLIPBOARD every single time.

For more information, see
https://specifications.freedesktop.org/clipboards-spec/clipboards-latest.txt.
