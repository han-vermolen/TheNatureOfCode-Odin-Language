# NoC-odin

A port of Daniel Shiffman's [**The Nature of Code**](https://natureofcode.com/) to Odin, rendered with Raylib. I'm using it to learn Odin manual memory, pointers, data-oriented layout etc. instead of just reading about it.
Same simulations and visual results as the book (for the most part), but built the way Odin wants things built, not a straight OO port of the p5.js originals.

This isn't trying to be a library or a tutorial for anyone else. It's me working through the book, chapter by chapter, at whatever pace I actually read it at.

Though I own a hardcopy of the book, I am using the online version so I can easily update my code as the book is updated.

## Status

Chapter 0's random walk is done. Everything else is still ahead. `PROGRESS.md` has a one-line "what I'm doing right now" pointer, and `doc/roadmap.md` has the full breakdown every sketch, mapped to a book chapter, with a status.

## Running a sketch

Each sketch is its own Odin package:

```
odin run ch00_random/walk
```

Formatting:

```
odinfmt ch00_random/walk -w
```

You just need a working Odin install (Raylib bindings ship with the compiler), no separate dependency to fetch.
One gotcha worth knowing. Some distro packages (CachyOS's `odin` package, at least as of this writing) 
ship the vendored Raylib libraries as unresolved Git LFS pointer files instead of the actual compiled `.a`/`.so`. 
If `odin run` fails at the link step with something like `file format not recognized; treating as linker script`, 
that's what's going on. The fix is pulling the real binaries into the compiler's own `vendor/raylib/<platform>/` 
directory (e.g. `/usr/lib/odin/vendor/raylib/linux/` on Linux), not anything broken in this repo.

## Layout

- `ch00_random/`, and one more `chNN_topic/` directory per chapter as they get built, see `doc/roadmap.md` for the planned set.
- `doc/roadmap.md` — per-sketch status, in strict book chapter order.
- `doc/use_of_ai.md` — what AI is and isn't allowed to do in this repo.
- `PROGRESS.md` — current pointer, one paragraph.

## Why Odin instead of just running the book's own p5.js code

Because the point was never to finish the book fast, it's to learn a new language.
Odin plus Raylib gets me "pixels on screen" cheaply enough that I can spend my attention on allocators, slices, and struct layout things the book's own Processing/JS code never has to think about once.

---

*This README was drafted with AI assistance, per the policy in `doc/use_of_ai.md`. No code in this repo was.*
