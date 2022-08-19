# BSDDOG vimrc
## The best vimrc in the Universe
Both .vimrc and .exrc config files work on OpenBSD, Windows & Linux. They work on FreeBSD, NetBSD, Mac and ATARI 2600 too. You bet.

## OpenBSD Vim configuration
vimrc works for vim and gvim, and exrc for vi and nvi.

## Background
First, it was OpenBSD only. But I wanted a single config file. I had different .vimrc and .exrc files for different OSes. It wasn't okay! Thus I've mixed them up in one single file. As a result, some of the configurations may not be your cup of tee(1). So, fill free to ditch them out! There are two versions of each files (both vimrc and exrc) with and without comment. I prefer the latter, and to RTFM and STFW.

## Features

### vimrc OpenBSD
* 72 CPL (character per line).
* Indentation is an 8 character tab.

### Language swtich (LTR and RTL)
* LTR <-> LTR, e.g. English, Russian, etc.
* RTL <-> LTR, e.g. Persian, etc.

### Shortkeys/functions for
* `[F1]` Save.
* `[F2]` Disabling automatic indentation for external pasting.
* `[F3]` LTR language swtich.
* `[F4]` RTL language swtich.
* `[F5]` Reset to default, after F6 (OpenBSD), and F7/F8 (FDP).
* `[F6]` OpenBSD `style(9)`.
* `[F7]` FreeBSD FDP: replace spaces with tabs.
* `[F8]` FreeBSD FDP: rewrap paragraphs.

### Additional Features
* A beautiful Status Bar.
* CLI and GUI compatible.
* Windows compatible (gvim).
* Solves MS Windows (Cygwin, Msys2, WSL) auto-INSERT problem in start-up.

### Misc
* Custom directories for backup, temporary and runtimes files.
* Incremental search (rounded & highlighted) and the cindent.
* Disable beep, visual bell and special characters, e.g. `^I`.
* Syntax highlighting and highlight matching.
* Ruler, line number and padding.
* Backspace and `@@@` settings.
* Clipboard, history and undo.
* `wildmenu` and encoding.
* etc.

## About Function and Function Keys
* You can change default Function keys, via `nnoremap` & `inoremap`.
* If you don't need a Function or Functions, just delete them.

## OpenBSD, Linux, FreeBSD, and the rest.
Rename the `vimrc` and/or `exrc` files and the `vim` folder to `.vimrc`, `.exrc` and `.vim`.

## About Custom Directories
I prefer to use
* `~/.vim/tmp` for *backup*.
* `~/.vim/swp` for *swap*.
* `~/.vim/add` for *plugins*.
But you can change them, or use the vim defaults.

## Windows Tip
Rename `.vimrc` to `_vimrc` and copy/move it to the `%USERPROFILE%`.
