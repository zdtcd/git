Git for Windows
===============

[![Build status](https://github.com/git-for-windows/git/workflows/CI/PR/badge.svg)](https://github.com/git-for-windows/git/actions?query=branch%3Amaster+event%3Apush)
[![Build Status (Windows/macOS/Linux)](https://dev.azure.com/git-for-windows/git/_apis/build/status/git-for-windows.git)](https://dev.azure.com/git-for-windows/git/_build/latest?definitionId=17)
[![Join the chat at https://gitter.im/git-for-windows/git](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/git-for-windows/git?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is [Git for Windows](http://git-for-windows.github.io/), the Windows port
of [Git](http://git-scm.com/).

The Git for Windows project is run using a [governance
model](http://git-for-windows.github.io/governance-model.html). If you
encounter problems, you can report them as [GitHub
issues](https://github.com/git-for-windows/git/issues), discuss them on Git
for Windows' [Google Group](http://groups.google.com/group/git-for-windows),
and [contribute bug
fixes](https://github.com/git-for-windows/git/wiki/How-to-participate).

Git - fast, scalable, distributed revision control system
=========================================================

Git is a fast, scalable, distributed revision control system with an
unusually rich command set that provides both high-level operations
and full access to internals.

Git is an Open Source project covered by the GNU General Public
License version 2 (some parts of it are under different licenses,
compatible with the GPLv2). It was originally written by Linus
Torvalds with help of a group of hackers around the net.

Please read the file [INSTALL][] for installation instructions.

Many Git online resources are accessible from <https://git-scm.com/>
including full documentation and Git related tools.

See [Documentation/gittutorial.txt][] to get started, then see
[Documentation/giteveryday.txt][] for a useful minimum set of commands, and
`Documentation/git-<commandname>.txt` for documentation of each command.
If git has been correctly installed, then the tutorial can also be
read with `man gittutorial` or `git help tutorial`, and the
documentation of each command with `man git-<commandname>` or `git help
<commandname>`.

CVS users may also want to read [Documentation/gitcvs-migration.txt][]
(`man gitcvs-migration` or `git help cvs-migration` if git is
installed).

The user discussion and development of core Git take place on the Git
mailing list -- everyone is welcome to post bug reports, feature
requests, comments and patches to git@vger.kernel.org (read
[Documentation/SubmittingPatches][] for instructions on patch submission).
To subscribe to the list, send an email with just "subscribe git" in
the body to majordomo@vger.kernel.org. The mailing list archives are
available at <https://lore.kernel.org/git/>,
<http://marc.info/?l=git> and other archival sites.
The core git mailing list is plain text (no HTML!).

Issues which are security relevant should be disclosed privately to
the Git Security mailing list <git-security@googlegroups.com>.

The maintainer frequently sends the "What's cooking" reports that
list the current status of various development topics to the mailing
list.  The discussion following them give a good reference for
project status, development direction and remaining tasks.

The name "git" was given by Linus Torvalds when he wrote the very
first version. He described the tool as "the stupid content tracker"
and the name as (depending on your mood):

 - random three-letter combination that is pronounceable, and not
   actually used by any common UNIX command.  The fact that it is a
   mispronunciation of "get" may or may not be relevant.
 - stupid. contemptible and despicable. simple. Take your pick from the
   dictionary of slang.
 - "global information tracker": you're in a good mood, and it actually
   works for you. Angels sing, and a light suddenly fills the room.
 - "goddamn idiotic truckload of sh*t": when it breaks

[INSTALL]: INSTALL
[Documentation/gittutorial.txt]: Documentation/gittutorial.txt
[Documentation/giteveryday.txt]: Documentation/giteveryday.txt
[Documentation/gitcvs-migration.txt]: Documentation/gitcvs-migration.txt
[Documentation/SubmittingPatches]: Documentation/SubmittingPatches
