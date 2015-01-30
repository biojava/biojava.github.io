---
title: BioJava:Download 4.0.0
---

` `*`This` `page` `is` `a` `draft` `for` `an` `upcoming` `release`*

This page offers downloads for the <b>BioJava 4.0.0 release</b>.

BioJava 4.0.0 is compatible with <b>Java 6, 7, and 8</b>.

About
-----

*BioJava* 4.0.0 has been released and is available using Maven from
Maven Central as well as manual download (see below).

This release contains over
[<https://github.com/biojava/biojava/compare/10046d889888be9fe9de458140ff092367dda2de>...master
500] commits from 17 authors:

[@andreasprlic](https://www.github.com/andreasprlic)
[@benjamintboyle](https://www.github.com/benjamintboyle)
[@christiam](https://www.github.com/christiam)
[@dmyersturnbull](https://www.github.com/dmyersturnbull)
[@Elinow](https://www.github.com/Elinow)
[@emckee2006](https://www.github.com/emckee2006)
[@jgrzebyta](https://www.github.com/jgrzebyta)
[@josemduarte](https://www.github.com/josemduarte)
[@kevinwu1](https://www.github.com/kevinwu1)
[@pibizza](https://www.github.com/pibizza)
[@heuermh](https://www.github.com/heuermh)
[@paolopavan](https://www.github.com/paolopavan)
[@parit](https://www.github.com/parit)
[@pwrose](https://www.github.com/pwrose)
[@sbliven](https://www.github.com/sbliven)
[@sroughley](https://www.github.com/sroughley)
[@willishf](https://www.github.com/willishf)

### New Features

BioJava 4.0.0 is a major release, with many new features as well as core
API changes. In accordance with [semantic
versioning](http://semver.org/) nomenclature, the jump to 4.x.x
indicates that existing applications may need to be modified (e.g. due
to the removal of deprecated methods). In most cases there should be a
clearly documented replacement method. See below for details on how to
upgrade.

New Features:

-   General
    -   Consistent error logging. SLF4J is used for logging and provides
        adaptors for all major logging implementations. (many
        contributors, including @benjamintboyle and @josemduarte)
    -   Improved handling of exceptions
    -   Removed deprecated methods
    -   Expanded the [BioJava
        tutorial](https://github.com/biojava/biojava3-tutorial/)
        (@andreasprlic, @josemduarte, and @sbliven)
    -   Updated dependencies where applicable
    -   Available on Maven Central (@andreasprlic and @heuermh)
-   biojava3-core
    -   Improved Genbank parser, including support for feature records,
        qualifiers, and nested locations. (@paolopavan and @jgrzebyta)
-   biojava3-structure
    -   Better support for crystallographic information, including
        crystallographic operators, unit cells, and protein-protein
        interfaces. (@josemduarte)
    -   Better organization of downloaded structure files (set using the
        PDB\_DIR and PDB\_CACHE\_DIR environmental variables) (@sbliven)
    -   Better command-line tools for structure alignment (@sbliven)
    -   New algorithm for symmetry detection in biological assemblies
        (@pwrose)
    -   New algorithm for fast contact calculation, both intra-chain and
        inter-chain (@josemduarte)
    -   Support for Accessible Surface Area (ASA) calculation through
        and implementation of the Shrake & Rupley algorithm, both
        single-thread and parallel (memory permitting) (@josemduarte)
    -   Support for large structures (memory permitting) and
        multi-character chain IDs.
    -   Default to mmCIF file format, as recommended by the wwPDB

View the <BioJava:Modules> page for a list of current modules.

How to Upgrade
--------------

Since we renamed all package names to be consistent across the whole
project, there will be import errors when upgrading to the latest
version of the jars. These can automatically get resolved by IDEs such
as Eclipse or IntelliJ by selecting the **Optimize Import** menu item.

The changed namespaces are:

-   Package namespace: all packages have been renamed to
    `org.biojava.nbio.modulename.*`. This is for all modules including
    **structure** and **structure-gui**
-   Module names and maven artifacts: all prefixed with `biojava-`, e.g.
    `biojava-core`, `biojava-alignment`

Maven Download
--------------

BioJava 4.0.0 requires [Maven](http://maven.apache.org/) for the build
process. All BioJava jar files are available via Maven Central as of
this release.

You can create a BioJava dependency by adding the following XML to your
project pom.xml file:

            <dependencies>
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava-core</artifactId>
                            <version>4.0.0</version>
                    </dependency>
                    <!-- other biojava jars as needed -->
            </dependencies> 

Manual Download
---------------

.tar.gz containing all jars, source and javadocs:
[biojava-4.0.0-all](http://biojava.org/download/bj4.0.0/biojava-4.0.0-all.tar.gz)

| Module                   | Binary Jar                                                                                                                                         | Source Jar                                                                                                                                                         | Javadoc Jar                                                                                                                                                        |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| biojava-core             | [biojava-core-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-core/4.0.0/biojava-core-4.0.0.jar)                                     | [biojava-core-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-core/4.0.0/biojava-core-4.0.0-sources.jar)                                     | [biojava-core-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-core/4.0.0/biojava-core-4.0.0-javadoc.jar)                                     |
| biojava-alignment        | [biojava-alignment-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-alignment/4.0.0/biojava-alignment-4.0.0.jar)                      | [biojava-alignment-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-alignment/4.0.0/biojava-alignment-4.0.0-sources.jar)                      | [biojava-alignment-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-alignment/4.0.0/biojava-alignment-4.0.0-javadoc.jar)                      |
| biojava-genome           | [biojava-genome-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-genome/4.0.0/biojava-genome-4.0.0.jar)                               | [biojava-genome-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-genome/4.0.0/biojava-genome-4.0.0-sources.jar)                               | [biojava-genome-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-genome/4.0.0/biojava-genome-4.0.0-javadoc.jar)                               |
| biojava-structure        | [biojava-structure-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure/4.0.0/biojava-structure-4.0.0.jar)                      | [biojava-structure-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure/4.0.0/biojava-structure-4.0.0-sources.jar)                      | [biojava-structure-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure/4.0.0/biojava-structure-4.0.0-javadoc.jar)                      |
| biojava-structure-gui    | [biojava-structure-gui-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure-gui/4.0.0/biojava-structure-gui-4.0.0.jar)          | [biojava-structure-gui-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure-gui/4.0.0/biojava-structure-gui-4.0.0-sources.jar)          | [biojava-structure-gui-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-structure-gui/4.0.0/biojava-structure-gui-4.0.0-javadoc.jar)          |
| biojava-phylo            | [biojava-phylo-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-phylo/4.0.0/biojava-phylo-4.0.0.jar)                                  | [biojava-phylo-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-phylo/4.0.0/biojava-phylo-4.0.0-sources.jar)                                  | [biojava-phylo-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-phylo/4.0.0/biojava-phylo-4.0.0-javadoc.jar)                                  |
| biojava-modfinder        | [biojava-modfinder-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-modfinder/4.0.0/biojava-modfinder-4.0.0.jar)                      | [biojava-modfinder-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-modfinder/4.0.0/biojava-modfinder-4.0.0-sources.jar)                      | [biojava-modfinder-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-modfinder/4.0.0/biojava-modfinder-4.0.0-javadoc.jar)                      |
| biojava-ws               | [biojava-ws-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ws/4.0.0/biojava-ws-4.0.0.jar)                                           | [biojava-ws-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ws/4.0.0/biojava-ws-4.0.0-sources.jar)                                           | [biojava-ws-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ws/4.0.0/biojava-ws-4.0.0-javadoc.jar)                                           |
| biojava-aa-prop          | [biojava-aa-prop-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-aa-prop/4.0.0/biojava-aa-prop-4.0.0.jar)                            | [biojava-aa-prop-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-aa-prop/4.0.0/biojava-aa-prop-4.0.0-sources.jar)                            | [biojava-aa-prop-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-aa-prop/4.0.0/biojava-aa-prop-4.0.0-javadoc.jar)                            |
| biojava-ontology         | [biojava-ontology-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ontology/4.0.0/biojava-ontology-4.0.0.jar)                         | [biojava-ontology-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ontology/4.0.0/biojava-ontology-4.0.0-sources.jar)                         | [biojava-ontology-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-ontology/4.0.0/biojava-ontology-4.0.0-javadoc.jar)                         |
| biojava-survival         | [biojava-survival-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-survival/4.0.0/biojava-survival-4.0.0.jar)                         | [biojava-survival-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-survival/4.0.0/biojava-survival-4.0.0-sources.jar)                         | [biojava-survival-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-survival/4.0.0/biojava-survival-4.0.0-javadoc.jar)                         |
| biojava-protein-disorder | [biojava-protein-disorder-4.0.0.jar](https://repo1.maven.org/maven2/org/biojava/biojava-protein-disorder/4.0.0/biojava-protein-disorder-4.0.0.jar) | [biojava-protein-disorder-4.0.0-sources.jar](https://repo1.maven.org/maven2/org/biojava/biojava-protein-disorder/4.0.0/biojava-protein-disorder-4.0.0-sources.jar) | [biojava-protein-disorder-4.0.0-javadoc.jar](https://repo1.maven.org/maven2/org/biojava/biojava-protein-disorder/4.0.0/biojava-protein-disorder-4.0.0-javadoc.jar) |

Browse API docs
---------------

You can also browse the documentation at [BioJava 4.0.0
api](http://www.biojava.org/docs/api4.0.0/)

Release Date
------------

BioJava 4.0.0 has been released on January 30th, 2015

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

