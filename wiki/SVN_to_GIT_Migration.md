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
Access](http://biojava.org/w/index.php?title=Developer_Code_Access&oldid=5082),
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

Developers
----------

### Linking SVN to GIT

As an open source project we want to make sure that contributors are
fairly acknowledged. Moving to github requires using github accounts to
identify developers. This means linking old SVN account names to a
github account so that past and future contributions are linked to the
same person.

1.  Wherever possible, map SVN accounts to Github accounts. Most active
    developers have already added themselves to the google spreadsheet
    to enable this (see mailing list)
2.  If no Github account is known, associate SVN account with their
    email address. Developers can link this email to a github account at
    a future time, which will automatically tie them to past commits
3.  If no email address is known, or the email is no longer accessible,
    commits will be credited to their SVN account name only.

### User permissions

We currently have two classes of SVN permissions:

1.  *Developers.* Full write access to any Biojava project through the
    developer SVN.
2.  *Users.* Read-only access to the anonymous mirrors.

The decentralized nature of GIT will allow a third class of users:

1.  *Developers.* Members of the [Biojava Github
    organization](https://github.com/biojava?tab=members). Can configure
    push access on a project-specific level.
2.  *Contributors.* Github users who are not part of the biojava
    organization, but maintain a personal fork of the project & submit
    push requests
3.  *Users.* General users who clone the code & don't submit push
    requests.

Current developers may find it easier to submit push requests rather
than join the Biojava organization. However, frequent contributors
should join so that the burden of accepting pull requests does not
become too high for the administrators.

Migration Plan
--------------

On some date TBD:

1.  Generate authors file for svn2git based on known github accounts or
    email addresses
2.  Set SVN to read-only
3.  Delete the existing git repository. All forks of the current repo
    will become incompatible.
4.  Use svn2git tool to create a new git repository, converting author
    information along the way
5.  All developers checkout git repositories & begin pushing changes to
    github

It is unfortunate that the 12 existing forks (plus local clones) will be
incompatible, but none of the public forks have diverged significantly
from the trunk so this should be acceptable.

Projects
--------

Unlike SVN, each project will have a separate repository under the
BioJava organization. Only actively developed projects will be moved to
github, with inactive projects (eg DASRepository) remaining on the
read-only SVN server. Specifically, the following projects will be moved
to github:

-   biojava-live, renamed to biojava
-   biojava-legacy
-   RCSB\_SequenceViewer, renamed to RCSB-SequenceViewer
-   RCSB Viewers, renamed to RCSB-Viewers

Repository Layout
-----------------

The github repository for each project will contain the following
branches, based on a variant of the [git-flow
model](http://nvie.com/posts/a-successful-git-branching-model/):

1.  **dev** Current development branch, corresponding to SVN trunk. All
    active developers are free to make commits directly to this branch,
    as well as merging feature branches and pull requests
2.  **release** By definition, any commit to this branch counts as a
    release. Each commit should be tagged with a new version number, eg
    'v3.1.0', and should result in a new set of jar files getting
    uploaded to the wiki. Only project leads should commit to this
    branch.

Additionally, any number of feature branches may be present should
developers wish to collaborate on specific features. The **release**
branch will be marked as the default branch, so that casual users can
get the latest stable version via a simple

` git clone `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)

This does mean that developers with push permission need to be very
careful that they are committing to the **dev** branch, since otherwise
they are implicitly releasing untested code to the public. Hopefully the
lack of a **master** branch will force people to think twice about where
they are committing.

Specific branches for each release (eg a release-3.1.0 branch containing
only bugfixes) could also be used. However, past releases have mostly
not had significant bug fixes during testing, so this may be unnecessary
complexity.

References
----------

<references/>

[1] Github blog. [Announcing SVN
support](https://github.com/blog/626-announcing-svn-support). Accessed
2013-03-18

[2] Github blog. [Collaborating on Github with
Subversion](https://github.com/blog/1178-collaborating-on-github-with-subversion).
Accessed 2013-03-18
