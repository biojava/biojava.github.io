---
title: BioJava:MavenMigration
---

BioJava Maven migration and modularization
==========================================

BioJava is currently in the process of getting migrated to Maven and
split up into sub-modules. A code freeze on this SVN trunk has been
declared for

**Thursday August 27th 23:00 GMT**.

After this the code base will be re-factored and future development will
happen on a new location in SVN. New SVN checkout instructions will be
provided as soon as the modularization has reached a state that is
stable enough.

Procedure
---------

-   declare code freeze

<!-- -->

-   I will refactor the code into the modules and commit the new version
    at a new location in the SVN.

<!-- -->

-   Documentation will be updated to reflect the new organization

<!-- -->

-   All developers should obtain a new checkout

<!-- -->

-   We need to identify leaders for the development of the sub-modules.
    View the current [list of defined
    modules](BioJava:Modules "wikilink")

<!-- -->

-   Continue development on the new modules

<!-- -->

-   Finalize the new version of BioJava at the upcoming Hackaton

<!-- -->

-   release!

--[Andreas](User:Andreas "wikilink") 03:08, 24 August 2009 (UTC)

Progress
--------

The new SVN location is emerging at:

`svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live/biojava`

or in your browser:

[`http://code.open-bio.org/svnweb/index.cgi/biojava/browse/biojava-live/biojava`](http://code.open-bio.org/svnweb/index.cgi/biojava/browse/biojava-live/biojava)

Anonymous checkouts are possible via:

[`svn://code.open-bio.org/biojava/biojava-live/biojava`](svn://code.open-bio.org/biojava/biojava-live/biojava)

So far several new modules have been created and it is time for more
eyes to take a look.


    [INFO] ------------------------------------------------------------------------
    [INFO] biojava ............................................... SUCCESS [1.543s]
    [INFO] core .................................................. SUCCESS [16.352s]
    [INFO] alignment ............................................. SUCCESS [4.123s]
    [INFO] blast ................................................. SUCCESS [29.427s]
    [INFO] structure ............................................. SUCCESS [22.653s]
    [INFO] das ................................................... SUCCESS [27.339s]
    [INFO] biojava ............................................... SUCCESS [0.174s]
    [INFO] sequence-core ......................................... SUCCESS [1.161s]
    [INFO] sequence-dna .......................................... SUCCESS [0.778s]
    [INFO] sequence-rna .......................................... SUCCESS [0.701s]
    [INFO] sequence-biosql ....................................... SUCCESS [0.661s]
    [INFO] sequence-fasta ........................................ SUCCESS [0.739s]
    [INFO] sequence-blastxml ..................................... SUCCESS [0.362s]
    [INFO] sequencing ............................................ SUCCESS [1.840s]
    [INFO] phylo ................................................. SUCCESS [1.889s]
    [INFO] biosql ................................................ SUCCESS [1.997s]
    [INFO] gui ................................................... SUCCESS [1.923s]
    [INFO] ------------------------------------------------------------------------

TODO List
---------

The following things still need to be done:

`- move the bytecode.jar from the jars folder in core into its own module`  
`- find solution for what to do with docs (move to relevant module or wiki)`  
`- add '`[`svn:ignore`](svn:ignore)` target' properties to all the module top-level folders`  
`- signing: re-enable the digital signature for jars`  
`- update cruisecontrol to use maven instead of ant`  
`- figure out the easiest way to install sequence-blastxml on netbeans (resolve jaxb dependcy problem)`
