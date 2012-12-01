---
title: BioJava:Download 3.0.5
---

This page offers downloads for the <b>BioJava 3.0.5 release</b>.

BioJava 3.0.5 requires <b>Java 1.6</b> or later.

About
-----

*BioJava* 3.0.5 has been released and is available using Maven from
[<http://biojava.org/download/maven/>](http://biojava.org/download/maven/)

### New Features

`- New parser for CATH classification`  
`- New parser for Stockholm file format`  
`- Significantly improved representation of biological assemblies of protein structures. Now can re-create biological assembly from asymmetric unit`  
`- Several bug fixes.`

View the <BioJava:Modules> page for a list of current modules.

Maven Download
--------------

BioJava 3.0.5 requires [Maven](http://maven.apache.org/) for the build
process. We are providing a BioJava specific Maven repository at
<http://biojava.org/download/maven/> .

You can add the BioJava repository by adding the following XML to your
project pom.xml file:

            <dependencies>
                    ...
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava3-core</artifactId>
                            <version>3.0.5</version>
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
[biojava-3.0.5-all](http://biojava.org/download/bj3.0.5/biojava-3.0.5-all.tar.gz)

| Module                    | Binary Jar                                                                                                                                               | Source Jar                                                                                                                                                               | Javadoc Jar                                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| biojava3-core             | [biojava3-core-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.5/biojava3-core-3.0.5.jar)                                     | [biojava3-core-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.5/biojava3-core-3.0.5-sources.jar)                                     | [biojava3-core-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.5/biojava3-core-3.0.5-javadoc.jar)                                     |
| biojava3-alignment        | [biojava3-alignment-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.5/biojava3-alignment-3.0.5.jar)                      | [biojava3-alignment-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.5/biojava3-alignment-3.0.5-sources.jar)                      | [biojava3-alignment-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.5/biojava3-alignment-3.0.5-javadoc.jar)                      |
| biojava3-genome           | [biojava3-genome-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.5/biojava3-genome-3.0.5.jar)                               | [biojava3-genome-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.5/biojava3-genome-3.0.5-sources.jar)                               | [biojava3-genome-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.5/biojava3-genome-3.0.5-javadoc.jar)                               |
| biojava3-structure        | [biojava3-structure-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.5/biojava3-structure-3.0.5.jar)                      | [biojava3-structure-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.5/biojava3-structure-3.0.5-sources.jar)                      | [biojava3-structure-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.5/biojava3-structure-3.0.5-javadoc.jar)                      |
| biojava3-structure-gui    | [biojava3-structure-gui-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.5/biojava3-structure-gui-3.0.5.jar)          | [biojava3-structure-gui-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.5/biojava3-structure-gui-3.0.5-sources.jar)          | [biojava3-structure-gui-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.5/biojava3-structure-gui-3.0.5-javadoc.jar)          |
| biojava3-phylo            | [biojava3-phylo-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.5/biojava3-phylo-3.0.5.jar)                                  | [biojava3-phylo-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.5/biojava3-phylo-3.0.5-sources.jar)                                  | [biojava3-phylo-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.5/biojava3-phylo-3.0.5-javadoc.jar)                                  |
| biojava3-modfinder        | [biojava3-modfinder-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/3.0.5/biojava3-modfinder-3.0.5.jar)                      | [biojava3-modfinder-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/3.0.5/biojava3-modfinder-3.0.5-sources.jar)                      | [biojava3-modfinder-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-modfinder/3.0.5/biojava3-modfinder-3.0.5-javadoc.jar)                      |
| biojava3-ws               | [biojava3-ws-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.5/biojava3-ws-3.0.5.jar)                                           | [biojava3-ws-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.5/biojava3-ws-3.0.5-sources.jar)                                           | [biojava3-ws-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.5/biojava3-ws-3.0.5-javadoc.jar)                                           |
| biojava3-aa-prop          | [biojava3-aa-prop-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/3.0.5/biojava3-aa-prop-3.0.5.jar)                            | [biojava3-aa-prop-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/3.0.5/biojava3-aa-prop3.0.5-sources.jar)                             | [biojava3-aa-prop-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-aa-prop/3.0.5/biojava3-aa-prop-3.0.5-javadoc.jar)                            |
| biojava3-protein-disorder | [biojava3-protein-disorder-3.0.5.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/3.0.5/biojava3-protein-disorder-3.0.5.jar) | [biojava3-protein-disorder-3.0.5-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/3.0.5/biojava3-protein-disorder-3.0.5-sources.jar) | [biojava3-protein-disorder-3.0.5-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-protein-disorder/3.0.5/biojava3-protein-disorder-3.0.5-javadoc.jar) |

Browse API docs
---------------

You can also browse the documentation at [BioJava 3.0.5
api](http://www.biojava.org/docs/api3.0.5/)

Release Date
------------

BioJava 3.0.5 has been released on November 30th 2012

Getting older versions
----------------------

-   The legacy release of 3.0.4 can be found
    [here](BioJava:Download 3.0.4 "wikilink") (requires Java 1.6+)
-   The legacy release of 3.0.3 can be found
    [here](BioJava:Download 3.0.3 "wikilink") (requires Java 1.6+)
-   The legacy release of 3.0.2 can be found
    [here](BioJava:Download 3.0.2 "wikilink") (requires Java 1.6+)
-   The legacy release of 3.0.1 can be found
    [here](BioJava:Download 3.0.1 "wikilink") (requires Java 1.6+)
-   The legacy release of 3.0 can be found
    [here](BioJava:Download 3.0 "wikilink") (requires Java 1.5+)
-   The legacy release of 1.8 can be found
    [here](BioJava:Download 1.8 "wikilink") (requires Java 1.5+)
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

