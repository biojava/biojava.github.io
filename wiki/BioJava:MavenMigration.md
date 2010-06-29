---
title: BioJava:MavenMigration
---

BioJava Maven migration and modularization
==========================================

Progress
--------

The new modularized code has been moved to the biojava-live/trunk.

`The BioJava Maven repository that contains snapshot builds is available from `[[`http://www.biojava.org/download/maven/`](http://www.biojava.org/download/maven/)](http://www.biojava.org/download/maven/)

We are providing SNAPSHOT builds of the latest BioJava code base. For
more information see [ the installation
instructions](CVS_to_SVN_Migration "wikilink").


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

`- find solution for what to do with docs (move to relevant module or wiki)`  
`- add '`[`svn:ignore`](svn:ignore)` target' properties to all the module top-level folders`  
`- signing: re-enable the digital signature for jars`  
`- update cruisecontrol to use maven instead of ant`  
`- figure out the easiest way to install sequence-blastxml on netbeans (resolve jaxb dependcy problem)`

Procedure
---------

-   declare code freeze (done, code freeze is over now)

<!-- -->

-   I will refactor the code into the modules and commit the new version
    at a new location in the SVN. (done)

<!-- -->

-   Documentation will be updated to reflect the new organization (in
    the process)

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
