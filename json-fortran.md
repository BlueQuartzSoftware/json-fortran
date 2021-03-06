project: JSON-Fortran
favicon: ./media/json-fortran-32x32.png
project_dir: ./src
output_dir: ./doc
media_dir: ./media
project_github: https://github.com/jacobwilliams/json-fortran
project_download: https://github.com/jacobwilliams/json-fortran/releases/latest
summary: JSON-Fortran -- A Fortran 2008 JSON API
author: Jacob Williams
github: https://github.com/jacobwilliams
website: http://degenerateconic.com
twitter: https://twitter.com/degenerateconic
predocmark_alt: >
predocmark: <
docmark_alt:
docmark: !
exclude_dir: tests
exclude_dir: introspection
display: public
         protected
         private
source: true
extra_mods: iso_fortran_env:https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fFORTRAN_005fENV.html
md_extensions: markdown.extensions.toc
               markdown.extensions.smarty(smart_quotes=False)

[TOC]

# Brief description

A user-friendly and object-oriented API for reading and writing JSON files, written in
modern Fortran (Fortran 2003+).  The source code is a single Fortran
module file
([json_module.F90](|url|/sourcefile/json_module.f90.html)).

# License

The JSON-Fortran source code and related files and documentation are
distributed under a permissive free software license (BSD-style).  See
the
[LICENSE](|url|/page/development-resources/LICENSE.html)
file for more details.

# Official Releases

The **current stable release** is **{!__VERSION__!}** and can be [downloaded
on GitHub](https://github.com/jacobwilliams/json-fortran/releases/latest)
or installed with [Homebrew](http://brew.sh) on Mac OSX. The
documentation for the current version, **{!__VERSION__!}**, can be
found [here](|url|/page/releases/{!__VERSION__!}/index.html)[^1], and a
list of changes from the previous version are
[here](|url|/page/releases/index.html#change-log).

A list of all past releases, links to their documentation, and the
chage log can be found on the
[releases page](|url|/page/releases/index.html).

# Miscellaneous

* For more information about JSON, see: <http://www.json.org/>

*[API]: Application Programming Interface--a set of routines, protocols, and tools for building software applications
*[JSON]: JavaScript Object Notation--A human friendly syntax for storing and exchanging data
*[current stable release]: {!__VERSION__!}

[^1]:
    Documentation for a particular release does not contain links
    back to *general* documentation; use the browser's back button to
    navigate back to <https://jacobwilliams.github.io/json-fortran/>
