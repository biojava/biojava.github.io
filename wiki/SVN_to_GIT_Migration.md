---
title: SVN to GIT Migration
---

At the end of March 2013, BioJava will move from SVN to GIT for version
control.

Benefits of the move
--------------------

-   Use branches in your daily workflow without merge terror
-   Track buggy/untested code without breaking the build for everyone
    else
-   Collaborate within a small team before sharing the finished feature
-   Simple, well integrated bug tracking
-   Accept contributions from the public via pull requests

Current Situation
-----------------

The primary BioJava SVN repository requires an ssh account for each
developer. As described in [Developer Code
Access](http://biojava.org/w/index.php?title=Developer_Code_Access&oldid=5082)),
the repository url is

` svn co svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live/trunk/`

There are also two read-only mirrors which permit anonymous access. The
recommended public access point for SVN is

` svn co `[`http://code.open-bio.org/repos/biojava/biojava-live/trunk`](http://code.open-bio.org/repos/biojava/biojava-live/trunk)

A commit hook is used to update a github mirror after each commit. This
repository is read-only (by policy). Although it is possible to develop
from a GIT clone & submit push-requests with new code, none such
requests are accepted. Github repositories can be accessed using either
GIT (recommended) or SVN[1][2]

` git clone `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)

` svn co --depth empty `[`https://github.com/biojava/biojava`](https://github.com/biojava/biojava)  
` svn up biojava/trunk`  
` `

Neither of these methods are recommended, although they have been
suggested to work around open-bio.org server problems.

Users
-----

Migration Plan
--------------

References
----------

<references/>

[1] Github blog. [Announcing SVN
support](https://github.com/blog/626-announcing-svn-support). Accessed
2013-03-18

[2] Github blog. [Collaborating on Github with
Subversion](https://github.com/blog/1178-collaborating-on-github-with-subversion).
Accessed 2013-03-18
