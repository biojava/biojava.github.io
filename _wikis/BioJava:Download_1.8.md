---
title: BioJava:Download 1.8
---

This page offers downloads for the <b>BioJava Legacy 1.8.2 release</b>.

BioJava Legacy 1.8.2 requires <b>Java 1.5</b> or later.

About
-----

BioJava legacy 1.8.2 has been released and is available using Maven from
<http://biojava.org/download/maven/>

Over the last year BioJava has undergone a major re-write. A new code
base has been started under the codename [BioJava
3](BioJava:Download "wikilink"). The old BioJava code (or BioJava 1 or
BioJava Legacy) has been modularized into small, re-usable components
and is available for download on this page.

Maven Download
--------------

BioJava Legacy 1.8.2 requires [Maven](http://maven.apache.org/) for the
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

**Download the entire project at once:**

| Description                          | Archive                                                                                                          | SHA1 checksum                                                                                                              | PGP signature                                                                                                            |
|--------------------------------------|------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Binary distribution, tar.gz format   | [biojava-legacy-1.8.2.tar.gz](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.tar.gz)                   | [biojava-legacy-1.8.2.tar.gz.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.tar.gz.sha1)                   | [biojava-legacy-1.8.2.tar.gz.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.tar.gz.asc)                   |
| Binary distribution, zip format      | [biojava-legacy-1.8.2.zip](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.zip)                         | [biojava-legacy-1.8.2.zip.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.zip.sha1)                         | [biojava-legacy-1.8.2.zip.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2.zip.asc)                         |
| Source distribution, tar.gz format   | [biojava-legacy-1.8.2-src.tar.gz](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.tar.gz)           | [biojava-legacy-1.8.2-src.tar.gz.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.tar.gz.sha1)           | [biojava-legacy-1.8.2-src.tar.gz.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.tar.gz.asc)           |
| Source distribution, zip format      | [biojava-legacy-1.8.2-src.zip](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.zip)                 | [biojava-legacy-1.8.2-src.zip.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.zip.sha1)                 | [biojava-legacy-1.8.2-src.zip.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-src.zip.asc)                 |
| Javadoc documentation, tar.gz format | [biojava-legacy-1.8.2-javadocs.tar.gz](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.tar.gz) | [biojava-legacy-1.8.2-javadocs.tar.gz.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.tar.gz.sha1) | [biojava-legacy-1.8.2-javadocs.tar.gz.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.tar.gz.asc) |
| Javadoc documentation, zip format    | [biojava-legacy-1.8.2-javadocs.zip](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.zip)       | [biojava-legacy-1.8.2-javadocs.zip.sha1](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.zip.sha1)       | [biojava-legacy-1.8.2-javadocs.zip.asc](http://biojava.org/download/bj1.8.2/biojava-legacy-1.8.2-javadocs.zip.asc)       |

**Or each module individually:** (faster if you just want the jars)

| Module     | Binary Jar                                                                                                  | Source Jar                                                                                                                  | Javadoc Jar                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| alignment  | [alignment-1.8.2.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.2/alignment-1.8.2.jar)    | [alignment-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.2/alignment-1.8.2-sources.jar)    | [alignment-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8.2/alignment-1.8.2-javadoc.jar)    |
| biosql     | [biosql-1.8.2.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.2/biosql-1.8.2.jar)             | [biosql-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.2/biosql-1.8.2-sources.jar)             | [biosql-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/biosql/1.8.2/biosql-1.8.2-javadoc.jar)             |
| blast      | [blast-1.8.2.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.2/blast-1.8.2.jar)                | [blast-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.2/blast-1.8.2-sources.jar)                | [blast-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/blast/1.8.2/blast-1.8.2-javadoc.jar)                |
| bytecode   | [bytecode-1.8.2.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.2/bytecode-1.8.2.jar)       | [bytecode-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.2/bytecode-1.8.2-sources.jar)       | [bytecode-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/bytecode/1.8.2/bytecode-1.8.2-javadoc.jar)       |
| core       | [core-1.8.2.jar](http://biojava.org/download/maven/org/biojava/core/1.8.2/core-1.8.2.jar)                   | [core-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/core/1.8.2/core-1.8.2-sources.jar)                   | [core-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/core/1.8.2/core-1.8.2-javadoc.jar)                   |
| das        | [das-1.8.2.jar](http://biojava.org/download/maven/org/biojava/das/1.8.2/das-1.8.2.jar)                      | [das-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/das/1.8.2/das-1.8.2-sources.jar)                      | [das-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/das/1.8.2/das-1.8.2-javadoc.jar)                      |
| gui        | [gui-1.8.2.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.2/gui-1.8.2.jar)                      | [gui-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.2/gui-1.8.2-sources.jar)                      | [gui-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/gui/1.8.2/gui-1.8.2-javadoc.jar)                      |
| phylo      | [phylo-1.8.2.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.2/phylo-1.8.2.jar)                | [phylo-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.2/phylo-1.8.2-sources.jar)                | [phylo-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/phylo/1.8.2/phylo-1.8.2-javadoc.jar)                |
| sequencing | [sequencing-1.8.2.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.2/sequencing-1.8.2.jar) | [sequencing-1.8.2-sources.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.2/sequencing-1.8.2-sources.jar) | [sequencing-1.8.2-javadoc.jar](http://biojava.org/download/maven/org/biojava/sequencing/1.8.2/sequencing-1.8.2-javadoc.jar) |

Browse API docs
---------------

You can also browse the documentation at [BioJava Legacy 1.8.2
api](http://www.biojava.org/docs/api1.8.2/)

Release Dates
-------------

BioJava 1.8 has been released on December 28th, 2010.

BioJava 1.8.2 has been released on March 22th, 2012.

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
-   guava-11.0.1.jar: Required for sequencing module
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

