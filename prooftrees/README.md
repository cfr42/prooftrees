$Id: README.md 11540 2026-01-19 06:46:23Z cfrees $

[![Automatic
Checks](https://github.com/cfr42/prooftrees/actions/workflows/main.yml/badge.svg)](https://github.com/cfr42/prooftrees/actions/workflows/main.yml)
[![Automatic
Checks](https://github.com/cfr42/prooftrees/actions/workflows/main.yml/badge.svg?branch=devel)](https://github.com/cfr42/prooftrees/actions/workflows/main.yml)

# prooftrees

A LaTeX package for drawing logical tableaux.

## Licence

Copyright 2016-2024 Clea F. Rees

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
prooftrees. You may however distribute the package prooftrees without
such generated files.

This work consists of all files listed in manifest.txt.

## Features

This package supports drawing tableaux (proof trees) of the kind often used in
introductory logic classes, especially those aimed at students without strong
mathemtical backgrounds. Hodges (1991) is one example of a text which uses
this system. When teaching such a system it is especially useful to annotate
the tree with line numbers, justifications and explanations of branch
closures. 

prooftrees provides a single environment - either prooftree or tableau - and a
variety of tools for annotating, customising and highlighting such trees. A 
cross-referencing system is provided for trees which cite line numbers in 
justifications for proof lines or branch closures.

prooftrees is based on Forest and, hence, TikZ. The package requires version
2.1+ of Forest for expected results and will not work with version 1.

Version 0.9 adds out-of-the-box support for externalisation of tableaux using
memoize.

## Code Repositories

Code for the package is hosted at 
	https://codeberg.org/cfr/prooftrees
For convenience, the repository is mirrored at
  https://github.com/cfr42/prooftrees

## Contact Details

Bug reports, feature requests etc. should be filed at
  https://codeberg.org/cfr/prooftrees/issues


Clea F. Rees
Version 0.9.2
2026-01-19

vim: et:tw=80:
