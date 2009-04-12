---
title: BioJava:Make release
---

How to make a BioJava release
-----------------------------

This page is intended for BioJava release managers.

This is how I released BioJava 1.7 --[Andreas](User:Andreas "wikilink")
15:14, 12 April 2009 (UTC)

Prior to release:

-   Announce release deadlines on mailing list

On release date:

-   Make sure code is ready for release. Check last minute commits
    (there usually are some).
-   Make sure the auto-build page (cruisecontrol) does not report any
    problems
-   Run

`ant-clean; ant runtests;`

-   make sure there are no broken tests being reported

If this all fine up to here, we are ready for release.

-   Branch and tag the svn directories.

`svn copy the trunk to the corresponding directories in the /branches and /tags directories of the svn repository.`

-   edit the build.xml file and change the **version** field to the
    number of the current release.
-   Run

`ant-clean; ant dist;`

-   check that the javadocs have been built ok, first page should show
    the number of the current release/

`open `[`file:///path/to/your/local/dir/biojava-live/dist/biojava-1.7/doc/biojava/index.html`](file:///path/to/your/local/dir/biojava-live/dist/biojava-1.7/doc/biojava/index.html)

-   prepare the biojava-all.jar bundle

`enter the /dist subdirectory of your biojava`

-   do a

`jar cvf biojava-1.7-all.jar`

-   copy file to

`scp biojava-1.7-all.jar username@portal.open-bio.org:/home/websites/biojava.org/html/static/download/bj17/`
