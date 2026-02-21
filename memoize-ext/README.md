$Id: README.md 11661 2026-02-21 00:55:52Z cfrees $

# memoize-ext

Automatic handling of additional kinds of material by or during memoization i
with Memoize.

- Memoize content in tagged PDFs.
    - TikZ pictures tagged with alt, actualtext or artifact are handled 
    automatically. 
    - Support can be added for other kinds of content by creating and assigning
      plugs to the provided sockets.
- Memoize content in ltx-talk. 
    - Supports the same key-value options as Memoize provides for Beamer, but
    the implementation is modified to accommodate differences in the
    implementation of overlays and opacity.
- Automatic detection of expl3 syntax zones.
- Auto-replication of expl3 functions without ‘weird’ arguments.
    - Inspired by Memoize's support for macros created with \NewDocumentCommand
    et al., so `args` need not be specified.
- Auto-memoization of l3draw pictures. 
    - This serves as a demonstration of the support for expl3 functions, which
    it uses to replicate code required for tagging.

The code is arranged into interdependent modules. Activation may be customised 
at load time.

## Licence

Copyright 2025-2026 Clea F. Rees

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3c
of this license or (at your option) any later version.
The latest version of this license is in
https://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2008-05-04 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is Clea F. Rees.

This file may only be distributed together with a copy of the package
memoize-ext. 

This work consists of all files listed in manifest.txt.

## Features

## Code Repositories

Code for the package is hosted at 
  https://codeberg.org/cfr/prooftrees
For convenience, the repository is mirrored at
  https://github.com/cfr42/prooftrees

## Contact Details

Bug reports, feature requests etc. should be filed at
  https://codeberg.org/cfr/prooftrees/issues


Clea F. Rees
Version 0.0
0000-00-00

vim: et:tw=80:ts=2:
