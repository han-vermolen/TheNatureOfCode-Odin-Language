# NoC-odin

A port of Daniel Shiffman's [**The Nature of Code**](https://natureofcode.com/) to Odin, rendered with Raylib. I'm using it to learn Odin manual memory, pointers, data-oriented layout etc. instead of just reading about it.
Same simulations and visual results as the book (for the most part), but built the way Odin wants things built, not a straight OO port of the p5.js originals.

This is a learning project rather than a library or formal tutorial, but every completed sketch is self-contained and runnable.

Though I own a hardcopy of the book, I am using the online version so I can easily update my code as the book is updated.

## Status

`PROGRESS.md` has a one-line "what I'm doing right now" pointer, and `doc/roadmap.md` has the full breakdown every sketch, mapped to a book chapter, with a status.

## Running a sketch

Each sketch is its own Odin package, for example:

```
odin run ch00_random/walk
```

Formatting:

```
odinfmt ch00_random/walk -w
```

You need a working Odin install (Raylib bindings ship with the compiler), no separate dependency to fetch.
One gotcha worth knowing. Some distro packages (CachyOS's `odin` package, at least as of this writing) 
ship the vendored Raylib libraries as unresolved Git LFS pointer files instead of the actual compiled `.a`/`.so`. 
If `odin run` fails at the link step with something like `file format not recognized; treating as linker script`, 
that's what's going on. The fix is pulling the real binaries into the compiler's own `vendor/raylib/<platform>/` 
directory (e.g. `/usr/lib/odin/vendor/raylib/linux/` on Linux), not anything broken in this repo.

## Secret scanning

This repo is public, so commits and pushes are scanned for accidentally committed
credentials by [betterleaks](https://github.com/betterleaks/betterleaks).
The hooks live in `.githooks/` (tracked, unlike `.git/hooks/`), so after cloning
you need one command to wire them up:

```
git config core.hooksPath .githooks
```

And the scanner itself, which is not in the Arch repos. Grab the release binary:

```
curl -sL -O https://github.com/betterleaks/betterleaks/releases/download/v1.8.1/betterleaks_1.8.1_linux_x64.tar.gz
curl -sL -O https://github.com/betterleaks/betterleaks/releases/download/v1.8.1/checksums.txt
sha256sum -c --ignore-missing checksums.txt
tar xzf betterleaks_1.8.1_linux_x64.tar.gz
install -Dm755 betterleaks ~/.local/bin/betterleaks
```

`go install github.com/betterleaks/betterleaks@latest` works too. There is an AUR
package, but as of this writing its `PKGBUILD` builds from the repo HEAD and
resolves its version through a live GitHub API call, so it is not reproducible.

Two hooks, catching different mistakes:

- `pre-commit` scans the staged diff. This is the one that matters, because once
  a secret is in a commit, removing it means rewriting history, not just deleting
  a line.
- `pre-push` scans the commits about to leave the machine. Backstop for anything
  committed with `--no-verify`, or committed before the hooks existed.

Both fail closed: if `betterleaks` is not installed they refuse the operation
rather than passing silently. Rule configuration and how to record a false
positive are in `.betterleaks.toml`.

**What this does and does not catch.** Spot-checked against betterleaks 1.8.1:
`sk-ant-api03-...`, `ghp_...`, an AWS secret access key and a plain
`password := "hunter2"` are all caught. An AWS access key *id* (`AKIA...`) is
not, which is defensible since the id is an identifier and not the credential.
Detection keys off shape, keyword context and entropy, so it is a safety net
under the actual rule, not a replacement for it: credentials should never enter
the working tree in the first place.

GitHub's own push protection is a second layer, enabled per repo under
Settings -> Code security. It only knows provider-registered token formats, but
unlike a local hook it cannot be skipped with `--no-verify`.

## Layout

- `ch00_random/`, and one more `chNN_topic/` directory per chapter as they get built, see `doc/roadmap.md` for the planned set.
- `doc/roadmap.md` — per-sketch status, in strict book chapter order.
- `doc/use_of_ai.md` — what AI is and isn't allowed to do in this repo.
- `PROGRESS.md` — current pointer, one paragraph.
- `.githooks/` — secret-scanning pre-commit and pre-push hooks. (Taken from other repos and possibly AI generated)
- `.betterleaks.toml` — scanner rules and false-positive exceptions. (Taken from other repos and possibly AI generated)

## Why Odin instead of just running the book's own p5.js code

Because the point was never to finish the book fast, it's to learn a new language.
Odin plus Raylib gets me "pixels on screen" cheaply enough that I can spend my attention on allocators, slices, and struct layout things the book's own Processing/JS code never has to think about once.

---

*This README was drafted with AI assistance, per the policy in `doc/use_of_ai.md`. No code in this repo was.*

