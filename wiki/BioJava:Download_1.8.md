---
title: BioJava:Download 1.8
---

This page offers downloads for the <b>BioJava Legacy 1.8 release</b>.

BioJava Legacy 1.8 requires <b>Java 1.5</b> or later.

About
-----

BioJava legacy 1.8 has been released and is available using Maven from
<http://biojava.org/download/maven/>

Over the last year BioJava has undergone a major re-write. A new code
base has been started under the codename [BioJava
3](BioJava:Download "wikilink"). The old BioJava code (or BioJava 1 or
BioJava Legacy) has been modularized into small, re-usable components
and is available for download on this page.

Maven Download
--------------

BioJava Legacy 1.8 requires [Maven](http://maven.apache.org/) for the
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

| Module    | Binary Jar                                                                                         | Source Jar                                                                                                         | Javadoc Jar                                                                                                        |
|-----------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| alignment | [alignment-1.8.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8/alignment-1.8.jar) | [alignment-1.8-sources.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8/alignment-1.8-sources.jar) | [alignment-1.8-javadoc.jar](http://biojava.org/download/maven/org/biojava/alignment/1.8/alignment-1.8-javadoc.jar) |
| biosql    | [biosql-1.8.jar](http://http://biojava.org/download/maven/org/biojava/biosql/1.8/biosql-1.8.jar)   | [biosql-1.8-sources.jar](http://http://biojava.org/download/maven/org/biojava/biosql/1.8/biosql-1.8-sources.jar)   | [biosql-1.8-javadoc.jar](http://http://biojava.org/download/maven/org/biojava/biosql/1.8/biosql-1.8-javadoc.jar)   |

### Support libraries

-   [bytecode.jar](http://www.biojava.org/download/bj171/support-jars/bytecode.jar):
    Required to run biojava
-   [commons-cli.jar](http://www.biojava.org/download/bj171/support-jars/commons-cli.jar):
    Only required to compile and use some of the demos
-   [commons-collections-2.1.jar](http://www.biojava.org/download/bj171/support-jars/commons-collections-2.1.jar):
    only required for some demos and BioSQL access (and building
    biojava.jar)
-   [commons-dbcp-1.1.jar](http://www.biojava.org/download/bj171/support-jars/commons-dbcp-1.1.jar):
    Only required for legacy BioSQL access (and building biojava.jar)
-   [commons-pool-1.1.jar](http://www.biojava.org/download/bj171/support-jars/commons-pool-1.1.jar):
    Only required for legacy BioSQL access (and building biojava.jar)
-   [jgrapht-jdk1.5.jar](http://www.biojava.org/download/bj171/support-jars/jgrapht-jdk1.5.jar):
    Only required for NEXUS file parsing (and building biojava.jar)

Source download
---------------

The jar file containing the source code is available from
[biojava-1.7.1-src.jar](http://www.biojava.org/download/bj171/src/biojava-1.7.1-src.jar)
(6.1Mb). This provides the same directory structure as is available from
a SVN checkout of the project, including .jar file dependencies.

Documentation
-------------

Documentation is available via
[biojava-1.7.1-doc.jar](http://www.biojava.org/download/bj171/doc/biojava-1.7.1-doc.jar)
(11Mb) that includes the javadocs for the API, demos and apps. For some
browsers, right click and select "Save Link As".

You can also browse the documentation at [BioJava 1.7.1
api](http://www.biojava.org/docs/api171/)

Release Date
------------

BioJava 1.7.1 has been released on January 15th, 2008.

Getting older versions
----------------------

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
-   Older releases of BioJava can be found in the [download
    area](http://www.biojava.org/download/).

