---
title: BioJava:Download 4.0.0
---

` `*`This` `page` `is` `a` `draft` `for` `an` `upcoming` `release`*

This page offers downloads for the <b>BioJava 4.0.0 release</b>.

BioJava 4.0.0 is compatible with <b>Java 6, 7, and 8</b>.

About
-----

*BioJava* 4.0.0 has been released and is available using Maven from
[<http://biojava.org/download/maven/>](http://biojava.org/download/maven/)

### New Features

BioJava 4.0.0 is a major release, with many new features as well as core
API changes. In accordance with [semantic
versioning](http://semver.org/) nomenclature, the jump to 4.x.x
indicates that existing applications may need to be modified (e.g. due
to the removal of deprecated methods). In most cases there should be a
clearly documented replacement method.

New Features:

-   New Genbank parser
-   Consistent error logging. SLF4J is used for logging and provides
    adaptors for all major logging implementations.
-   ...

View the <BioJava:Modules> page for a list of current modules.

Maven Download
--------------

BioJava 4.0.0 requires [Maven](http://maven.apache.org/) for the build
process. We are providing a BioJava specific Maven repository at
<http://biojava.org/download/maven/> .

You can add the BioJava repository by adding the following XML to your
project pom.xml file:

            <dependencies>
                    ...
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava3-core</artifactId>
                            <version>4.0.0</version>
                    </dependency>
                    <!-- other biojava jars as needed -->
            </dependencies>
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

.tar.gz containing all jars, source and javadocs:
[biojava-4.0.0-all](http://biojava.org/download/bj4.0.0/biojava-4.0.0-all.tar.gz)

| Module                    | Binary Jar                                                                                                                                               | Source Jar                                                                                                                                                               | Javadoc Jar                                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| biojava3-core             | [biojava3-core-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/4.0.0/biojava3-core-4.0.0.jar)                                     | [biojava3-core-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/4.0.0/biojava3-core-4.0.0-sources.jar)                                     | [biojava3-core-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/4.0.0/biojava3-core-4.0.0-javadoc.jar)                                     |
| biojava3-alignment        | [biojava3-alignment-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/4.0.0/biojava3-alignment-4.0.0.jar)                      | [biojava3-alignment-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/4.0.0/biojava3-alignment-4.0.0-sources.jar)                      | [biojava3-alignment-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/4.0.0/biojava3-alignment-4.0.0-javadoc.jar)                      |
| biojava3-genome           | [biojava3-genome-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/4.0.0/biojava3-genome-4.0.0.jar)                               | [biojava3-genome-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/4.0.0/biojava3-genome-4.0.0-sources.jar)                               | [biojava3-genome-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/4.0.0/biojava3-genome-4.0.0-javadoc.jar)                               |
| biojava3-structure        | [biojava3-structure-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/4.0.0/biojava3-structure-4.0.0.jar)                      | [biojava3-structure-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/4.0.0/biojava3-structure-4.0.0-sources.jar)                      | [biojava3-structure-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/4.0.0/biojava3-structure-4.0.0-javadoc.jar)                      |
| biojava3-structure-gui    | [biojava3-structure-gui-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/4.0.0/biojava3-structure-gui-4.0.0.jar)          | [biojava3-structure-gui-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/4.0.0/biojava3-structure-gui-4.0.0-sources.jar)          | [biojava3-structure-gui-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/4.0.0/biojava3-structure-gui-4.0.0-javadoc.jar)          |
| biojava3-phylo            | [biojava3-phylo-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/4.0.0/biojava3-phylo-4.0.0.jar)                                  | [biojava3-phylo-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/4.0.0/biojava3-phylo-4.0.0-sources.jar)                                  | [biojava3-phylo-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/4.0.0/biojava3-phylo-4.0.0-javadoc.jar)                                  |
| biojava3-modfinder        | [biojava3-modfinder-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/4.0.0/biojava3-modfinder-4.0.0.jar)                      | [biojava3-modfinder-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/4.0.0/biojava3-modfinder-4.0.0-sources.jar)                      | [biojava3-modfinder-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/4.0.0/biojava3-modfinder-4.0.0-javadoc.jar)                      |
| biojava3-ws               | [biojava3-ws-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/4.0.0/biojava3-ws-4.0.0.jar)                                           | [biojava3-ws-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/4.0.0/biojava3-ws-4.0.0-sources.jar)                                           | [biojava3-ws-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/4.0.0/biojava3-ws-4.0.0-javadoc.jar)                                           |
| biojava3-aa-prop          | [biojava3-aa-prop-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/4.0.0/biojava3-aa-prop-4.0.0.jar)                            | [biojava3-aa-prop-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/4.0.0/biojava3-aa-prop-4.0.0-sources.jar)                            | [biojava3-aa-prop-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/4.0.0/biojava3-aa-prop-4.0.0-javadoc.jar)                            |
| biojava3-protein-disorder | [biojava3-protein-disorder-4.0.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/4.0.0/biojava3-protein-disorder-4.0.0.jar) | [biojava3-protein-disorder-4.0.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/4.0.0/biojava3-protein-disorder-4.0.0-sources.jar) | [biojava3-protein-disorder-4.0.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/4.0.0/biojava3-protein-disorder-4.0.0-javadoc.jar) |

Browse API docs
---------------

You can also browse the documentation at [BioJava 4.0.0
api](http://www.biojava.org/docs/api4.0.0/)

Release Date
------------

BioJava 4.0.0 has been released on Xxxx 00th, 2015

Getting older versions
----------------------

-   The release of 3.1.0 can be found
    [here](BioJava:Download 3.1.0 "wikilink") (requires Java 1.6 or 1.7)
-   The release of 3.0.8 can be found
    [here](BioJava:Download 3.0.8 "wikilink") (requires Java 1.6+)
-   The release of 3.0.7 can be found
    [here](BioJava:Download 3.0.7 "wikilink") (requires Java 1.6+)
-   The release of 3.0.6 can be found
    [here](BioJava:Download 3.0.6 "wikilink") (requires Java 1.6+)
-   The release of 3.0.5 can be found
    [here](BioJava:Download 3.0.5 "wikilink") (requires Java 1.6+)
-   The release of 3.0.4 can be found
    [here](BioJava:Download 3.0.4 "wikilink") (requires Java 1.6+)
-   The release of 3.0.3 can be found
    [here](BioJava:Download 3.0.3 "wikilink") (requires Java 1.6+)
-   The release of 3.0.2 can be found
    [here](BioJava:Download 3.0.2 "wikilink") (requires Java 1.6+)
-   The release of 3.0.1 can be found
    [here](BioJava:Download 3.0.1 "wikilink") (requires Java 1.6+)
-   The release of 3.0 can be found
    [here](BioJava:Download 3.0 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.9.1 can be found
    [here](BioJava:Download 1.9.1 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.9.0 can be found
    [here](BioJava:Download 1.9.0 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.8.5 can be found
    [here](BioJava:Download 1.8.5 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.8.4 can be found
    [here](BioJava:Download 1.8.4 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.8.2 can be found
    [here](BioJava:Download 1.8.2 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.8.1 can be found
    [here](BioJava:Download 1.8.1 "wikilink") (requires Java 1.5+)
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
-   Older releases of BioJava can be found in the [download
    area](http://www.biojava.org/download/).

