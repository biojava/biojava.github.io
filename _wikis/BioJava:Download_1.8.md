---
title: BioJava:Download 1.8
---

This page offers downloads for the <b>BioJava Legacy 1.8.1 release</b>.

BioJava Legacy 1.8.1 requires <b>Java 1.5</b> or later.

About
-----

BioJava legacy 1.8.1 has been released and is available using Maven from
<http://biojava.org/download/maven/>

Over the last year BioJava has undergone a major re-write. A new code
base has been started under the codename [BioJava
3](BioJava:Download "wikilink"). The old BioJava code (or BioJava 1 or
BioJava Legacy) has been modularized into small, re-usable components
and is available for download on this page.

Maven Download
--------------

BioJava Legacy 1.8.1 requires [Maven](http://maven.apache.org/) for the
build process. We are providing a BioJava specific Maven repository at
<http://biojava.org/download/maven/> .

You can add the BioJava repository by adding the following XML to your
project .pom file:

        <repositories>
            ...
            <repository>
                <id>biojava-maven-repo</id>
                <name>BioJava repository</name>
                <url>http://www.biojava.org/download/maven/</url>           
            </repository>
        </repositories>

Manual Download
---------------

| Module     | Binary Jar                                                                                                  | Source Jar                                                                                                                  | Javadoc Jar                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| alignment  | [alignment-1.8.1.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.1/alignment-1.8.1.jar)    | [alignment-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.1/alignment-1.8.1-sources.jar)    | [alignment-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.1/alignment-1.8.1-javadoc.jar)    |
| biosql     | [biosql-1.8.1.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.1/biosql-1.8.1.jar)             | [biosql-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.1/biosql-1.8.1-sources.jar)             | [biosql-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.1/biosql-1.8.1-javadoc.jar)             |
| blast      | [blast-1.8.1.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.1/blast-1.8.1.jar)                | [blast-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.1/blast-1.8.1-sources.jar)                | [blast-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.1/blast-1.8.1-javadoc.jar)                |
| bytecode   | [bytecode-1.8.1.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.1/bytecode-1.8.1.jar)       | [bytecode-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.1/bytecode-1.8.1-sources.jar)       | [bytecode-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.1/bytecode-1.8.1-javadoc.jar)       |
| core       | [core-1.8.1.jar](http://biojava.org/download/maven/org/biojava/core/1.8.1/core-1.8.1.jar)                   | [core-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/core/1.8.1/core-1.8.1-sources.jar)                   | [core-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/core/1.8.1/core-1.8.1-javadoc.jar)                   |
| das        | [das-1.8.1.jar](http://biojava.org/download/maven/org/biojava/das/1.8.1/das-1.8.1.jar)                      | [das-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/das/1.8.1/das-1.8.1-sources.jar)                      | [das-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/das/1.8.1/das-1.8.1-javadoc.jar)                      |
| gui        | [gui-1.8.1.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.1/gui-1.8.1.jar)                      | [gui-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.1/gui-1.8.1-sources.jar)                      | [gui-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.1/gui-1.8.1-javadoc.jar)                      |
| phylo      | [phylo-1.8.1.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.1/phylo-1.8.1.jar)                | [phylo-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.1/phylo-1.8.1-sources.jar)                | [phylo-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.1/phylo-1.8.1-javadoc.jar)                |
| sequencing | [sequencing-1.8.1.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.1/sequencing-1.8.1.jar) | [sequencing-1.8.1-sources.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.1/sequencing-1.8.1-sources.jar) | [sequencing-1.8.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.1/sequencing-1.8.1-javadoc.jar) |

Browse API docs
---------------

You can also browse the documentation at [BioJava Legacy 1.8
api](http://www.biojava.org/docs/api1.8/)

Release Dates
-------------

BioJava 1.8 has been released on December 28th, 2010.

BioJava 1.8.1 has been released on February 13th, 2011.

Support libraries
-----------------

Necessary libraries are available in maven repositories

-   commons-cli.jar: Only required to compile and use some of the demos
-   commons-collections-2.1.jar: only required for some demos and BioSQL
    access (and building biojava.jar)
-   commons-dbcp-1.1.jar: Only required for legacy BioSQL access (and
    building biojava.jar)
-   commons-pool-1.1.jar: Only required for legacy BioSQL access (and
    building biojava.jar)
-   jgrapht-jdk1.5.jar: Only required for NEXUS file parsing (and
    building biojava.jar)

Getting older versions
----------------------

-   The legacy release of 1.7.1 can be found
    [here](BioJava:Download 1.7.1 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.7 can be found
    [here](BioJava:Download 1.7 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.6 can be found
    [here](BioJava:Download 1.6 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.5 can be found
    [here](BioJava:Download 1.5 "wikilink") (requires Java 1.4.2+)
-   The legacy release of 1.4 can be found
    [here](BioJava:Download 1.4 "wikilink")
-   The legacy release 1.3 can be found
    [here](BioJava:Download 1.3 "wikilink").

Getting BioJava 3
-----------------

-   BioJava 3 can be found in the [download
    area](http://www.biojava.org/download/).

