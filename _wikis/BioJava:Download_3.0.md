---
title: BioJava:Download 3.0
---

This page offers downloads for the <b>BioJava 3.0 release</b>.

BioJava 3.0 requires <b>Java 1.6</b> or later.

About
-----

*BioJava* 3.0 has been released and is available using Maven from
[<http://biojava.org/download/maven/>
<http://biojava.org/download/maven/>](http://biojava.org/download/maven/)

Over the last year *BioJava* has undergone a major re-write. It has been
modularized into small, re-usable components and a number of new
features have been added. The new approach, modeled after the apache
commons, minimizes dependencies and allows for easier contribution of
new components.

View the <BioJava:Modules> page for a list of current modules.

Maven Download
--------------

BioJava 3.0 requires [Maven](http://maven.apache.org/) for the build
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

| Module                 | Binary Jar                                                                                                                                | Source Jar                                                                                                                                                | Javadoc Jar                                                                                                                                               |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| biojava3-core          | [biojava3-core-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0/biojava3-core-3.0.jar)                            | [biojava3-core-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0/biojava3-core-3.0-sources.jar)                            | [biojava3-core-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-core/3.0/biojava3-core-3.0-javadoc.jar)                            |
| biojava3-alignment     | [biojava3-alignment-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0/biojava3-alignment-3.0.jar)             | [biojava3-alignment-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0/biojava3-alignment-3.0-sources.jar)             | [biojava3-alignment-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-alignment/3.0/biojava3-alignment-3.0-javadoc.jar)             |
| biojava3-genome        | [biojava3-genome-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0/biojava3-genome-3.0.jar)                      | [biojava3-genome-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0/biojava3-genome-3.0-sources.jar)                      | [biojava3-genome-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-genome/3.0/biojava3-genome-3.0-javadoc.jar)                      |
| biojava3-structure     | [biojava3-structure-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0/biojava3-structure-3.0.jar)             | [biojava3-structure-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0/biojava3-structure-3.0-sources.jar)             | [biojava3-structure-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure/3.0/biojava3-structure-3.0-javadoc.jar)             |
| biojava3-structure-gui | [biojava3-structure-gui-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0/biojava3-structure-gui-3.0.jar) | [biojava3-structure-gui-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0/biojava3-structure-gui-3.0-sources.jar) | [biojava3-structure-gui-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-structure-gui/3.0/biojava3-structure-gui-3.0-javadoc.jar) |
| biojava3-phylo         | [biojava3-phylo-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0/biojava3-phylo-3.0.jar)                         | [biojava3-phylo-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0/biojava3-phylo-3.0-sources.jar)                         | [biojava3-phylo-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-phylo/3.0/biojava3-phylo-3.0-javadoc.jar)                         |
| biojava3-protmod       | [biojava3-protmod-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0/biojava3-protmod-3.0.jar)                   | [biojava3-protmod-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0/biojava3-protmod-3.0-sources.jar)                   | [biojava3-protmod-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-protmod/3.0/biojava3-protmod-3.0-javadoc.jar)                   |
| biojava3-ws            | [biojava3-ws-3.0.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0/biojava3-ws-3.0.jar)                                  | [biojava3-ws-3.0-sources.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0/biojava3-ws-3.0-sources.jar)                                  | [biojava3-ws-3.0-javadoc.jar](http://biojava.org/download/maven/org/biojava/biojava3-ws/3.0/biojava3-ws-3.0-javadoc.jar)                                  |

Browse API docs
---------------

You can also browse the documentation at [BioJava 3.0
api](http://www.biojava.org/docs/api3.0/)

Release Date
------------

BioJava 3.0 has been released on December 28th, 2010.

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
-   Older releases of BioJava can be found in the [download
    area](http://www.biojava.org/download/).

