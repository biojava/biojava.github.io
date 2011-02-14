---
title: BioJava:Download 3.0.1
---

This page offers downloads for the <b>BioJava 3.0.1 release</b>.

BioJava 3.0.1 requires <b>Java 1.6</b> or later.

About
-----

*BioJava* 3.0.1 has been released and is available using Maven from
[<http://biojava.org/download/maven/>](http://biojava.org/download/maven/)

Over the last year *BioJava* has undergone a major re-write. It has been
modularized into small, re-usable components and a number of new
features have been added. The new approach, modeled after the apache
commons, minimizes dependencies and allows for easier contribution of
new components.

The 3.0.1 release is mainly a bug fixing release for the recent 3.0
released which provided a major rewrite of the biojava code base.

View the <BioJava:Modules> page for a list of current modules.

Maven Download
--------------

BioJava 3.0.1 requires [Maven](http://maven.apache.org/) for the build
process. We are providing a BioJava specific Maven repository at
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

bundel containing all jars, source and javadocs:
[biojava3.0.1-all](http://biojava.org/download/bj3.0.1/biojava3.0.1/biojava3.0.1-all.tar.gz)

| Module                 | Binary Jar                                                                                                                                      | Source Jar                                                                                                                                                      | Javadoc Jar                                                                                                                                                     |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| biojava3-core          | [biojava3-core-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.1/biojava3-core-3.0.1.jar)                            | [biojava3-core-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.1/biojava3-core-3.0.1-sources.jar)                            | [biojava3-core-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0.1/biojava3-core-3.0.1-javadoc.jar)                            |
| biojava3-alignment     | [biojava3-alignment-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.1/biojava3-alignment-3.0.1.jar)             | [biojava3-alignment-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.1/biojava3-alignment-3.0.1-sources.jar)             | [biojava3-alignment-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0.1/biojava3-alignment-3.0.1-javadoc.jar)             |
| biojava3-genome        | [biojava3-genome-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.1/biojava3-genome-3.0.1.jar)                      | [biojava3-genome-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.1/biojava3-genome-3.0.1-sources.jar)                      | [biojava3-genome-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0.1/biojava3-genome-3.0.1-javadoc.jar)                      |
| biojava3-structure     | [biojava3-structure-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.1/biojava3-structure-3.0.1.jar)             | [biojava3-structure-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.1/biojava3-structure-3.0.1-sources.jar)             | [biojava3-structure-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0.1/biojava3-structure-3.0.1-javadoc.jar)             |
| biojava3-structure-gui | [biojava3-structure-gui-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.1/biojava3-structure-gui-3.0.1.jar) | [biojava3-structure-gui-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.1/biojava3-structure-gui-3.0.1-sources.jar) | [biojava3-structure-gui-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0.1/biojava3-structure-gui-3.0.1-javadoc.jar) |
| biojava3-phylo         | [biojava3-phylo-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.1/biojava3-phylo-3.0.1.jar)                         | [biojava3-phylo-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.1/biojava3-phylo-3.0.1-sources.jar)                         | [biojava3-phylo-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0.1/biojava3-phylo-3.0.1-javadoc.jar)                         |
| biojava3-protmod       | [biojava3-protmod-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0.1/biojava3-protmod-3.0.1.jar)                   | [biojava3-protmod-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0.1/biojava3-protmod-3.0.1-sources.jar)                   | [biojava3-protmod-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0.1/biojava3-protmod-3.0.1-javadoc.jar)                   |
| biojava3-ws            | [biojava3-ws-3.0.1.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.1/biojava3-ws-3.0.1.jar)                                  | [biojava3-ws-3.0.1-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.1/biojava3-ws-3.0.1-sources.jar)                                  | [biojava3-ws-3.0.1-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0.1/biojava3-ws-3.0.1-javadoc.jar)                                  |

Browse API docs
---------------

You can also browse the documentation at [BioJava 3.0.1
api](http://www.biojava.org/docs/api3.0/)

Release Date
------------

BioJava 3.0.1 has been released on February 13th, 2010.

Legacy Code
-----------

Not every feature of the BioJava 1.X code base was migrated over to
BioJava 3.0.1. A modularized version of the 1.X sources is available as
a new "biojava-legacy" project in SVN. The current legacy builds are at
version 1.8. (also available via Maven)

Getting older versions
----------------------

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

