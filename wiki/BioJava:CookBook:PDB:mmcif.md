---
title: BioJava:CookBook:PDB:mmcif
---

How to parse mmCIF files using BioJava
======================================

What is mmCIF?
--------------

The Protein Data Bank (PDB) has been distributing its archival files as
PDB files for a long time. The PDB file format is based on
"punchcard"-style rules how to store data in a flat file. With the
increasing complexity of macromolecules that have are being resolved
experimentally, this file format can not be used any more to represent
some or the more complex structures. As such, the wwPDB recently
announced the transition from PDB to mmCIF/PDBx as the principal
deposition and dissemination file format (see
[here](http://www.wwpdb.org/news/news_2013.html#22-May-2013) and
[here](http://wwpdb.org/workshop/wgroup.html)).

The mmCIF file format has been around for some time (see
[1](#westbrook2000 "wikilink"),[2](#westbrook2003 "wikilink") )
[BioJava](http://www.biojava.org) has been supporting mmCIF already for
several years. This tutorial is meant to provide a quick introduction
into how to parse mmCIF files using [BioJava](http://www.biojava.org)

The basics
----------

BioJava provides you with both a mmCIF parser and a data model that
reads PDB and mmCIF files into a biological and chemically meaningful
data model. If you don't want to use that data model, you can still use
BioJava's file parsers, and more on that later, let's start first with
the most basic way of loading a protein structure.

Quick Installation
------------------

Before we start, just one quick paragraph of how to get access to
BioJava.

BioJava is open source and you can get the code from
[Github](https://github.com/biojava/biojava), however it might be easier
this way:

BioJava uses [Maven](http://maven.apache.org/) as a build and
distribution system. If you are new to Maven, take a look at the
[Getting Started with
Maven](http://maven.apache.org/guides/getting-started/index.html) guide.

We are providing a BioJava specific Maven repository at
(http://biojava.org/download/maven/) .

You can add the BioJava repository by adding the following XML to your
project pom.xml file:

            <repositories>
            ...
            <repository>
                <id>biojava-maven-repo</id>
                <name>BioJava repository</name>
                <url>http://www.biojava.org/download/maven/</url>           
            </repository>
        </repositories>

            <dependencies>
                    ...
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava3-structure</artifactId>
                            <version>3.0.7-SNAPSHOT</version>
                    </dependency>
                    <!-- other biojava jars as needed -->
            </dependencies>
        

If you run 'mvn package' on your project, the BioJava dependencies will
be automatically downloaded and installed for you.

First steps
-----------

The simplest way to load a PDB file is by using the
[StructureIO](http://www.biojava.org/docs/api/org/biojava3/structure/StructureIO.html)
class.

        Structure structure = StructureIO.getStructure("4HHB");
        // and let's print out how many atoms are in this structure
        System.out.println(StructureTools.getNrAtoms(structure));

BioJava automatically downloaded the PDB file for hemoglobin
[4HHB](http://www.rcsb.org/pdb/explore.do?structureId=4HHB) and copied
it into a temporary location. This demonstrates two things:

-   BioJava can automatically download and install files locally
-   BioJava by default writes those files into a temporary location (The
    system temp directory "java.io.tempdir").

If you already have a local PDB installation, you can configure where
BioJava should read the files from by setting the PDB\_DIR system
property

        -DPDB_DIR=/wherever/you/want/

From PDB to mmCIF
-----------------

By default BioJava is using the PDB file format for parsing data. In
order to switch it to use mmCIF, we can take control over the underlying
<a href="http://www.biojava.org/docs/api/org/biojava/bio/structure/align/util/AtomCache.html">AtomCache</a>
which manages your PDB (and btw. also SCOP, CATH) installations.

            AtomCache cache = new AtomCache();
                
            cache.setUseMmCif(true);
                
            // if you struggled to set the PDB_DIR property correctly in the previous step, 
            // you could set it manually like this:
            cache.setPath("/tmp/");
                
            StructureIO.setAtomCache(cache);
                
            Structure structure = StructureIO.getStructure("4HHB");
                        
            // and let's count how many chains are in this structure.
            System.out.println(structure.getChains().size());

As you can see, the AtomCache will again download the missing mmCIF file
for 4HHB in the background.

Low level access
----------------

By default the file content will be loaded into the BioJava data
structures. The parser contains a built-in event model, which allows to
load your own, custom data structures. For this you will require to
implement the [MMcifConsumer
interface](http://www.biojava.org/docs/api/org/biojava/bio/structure/io/mmcif/MMcifConsumer.html)

<java> @since 1.7

`   public static void main(String[] args){`

`       String fileName = args[0];`  
`       `  
`       InputStream inStream =  new FileInputStream(fileName);`  
`       `  
`       MMcifParser parser = new SimpleMMcifParser();`

`       SimpleMMcifConsumer consumer = new SimpleMMcifConsumer();`

`       // The Consumer builds up the BioJava - structure object.`  
`               // you could also hook in your own and build up you own data model.          `  
`       parser.addMMcifConsumer(consumer);`

`       try {`  
`           parser.parse(new BufferedReader(new InputStreamReader(inStream)));`  
`       } catch (IOException e){`  
`           e.printStackTrace();`  
`       }`

`               // now get the protein structure.`  
`       Structure cifStructure = consumer.getStructure();`  
`                     `

}

</java>

The parser operates similar to a XML parser by triggering "events". The
[SimpleMMcifConsumer](http://www.biojava.org/docs/api/org/biojava/bio/structure/io/mmcif/SimpleMMcifConsumer.html)
listens to new categories being read from the file and then builds up
the BioJava data model.

To re-use the parser for your own datamodel, just implement the
[MMcifConsumer](http://www.biojava.org/docs/api/org/biojava/bio/structure/io/mmcif/MMcifConsumer.html)
interface and add it to the
[SimpleMMcifParser](http://www.biojava.org/docs/api/org/biojava/bio/structure/io/mmcif/SimpleMMcifParser.html).

            parser.addMMcifConsumer(myOwnConsumerImplementation);

Parse into custom data structures
---------------------------------

By default the file content will be loaded into the BioJava data
structures. The parser contains a built-in event model, which allows to
load your own, custom data structures. For this you will require to
implement the [MMcifConsumer
interface](http://www.spice-3d.org/public-files/javadoc/biojava/org/biojava/bio/structure/io/mmcif/MMcifConsumer.html)
If you don;t have that, just use the SimpleMMcifConsumer

<java> @since 1.7

`   public static void main(String[] args){`

`       String fileName = args[0];`  
`       `  
`       InputStream inStream =  new FileInputStream(fileName);`  
`       `  
`       MMcifParser parser = new SimpleMMcifParser();`

`       SimpleMMcifConsumer consumer = new SimpleMMcifConsumer();`

`       // The Consumer builds up the BioJava - structure object.`  
`               // you could also hook in your own and build up you own data model.          `  
`       parser.addMMcifConsumer(consumer);`

`       try {`  
`           parser.parse(new BufferedReader(new InputStreamReader(inStream)));`  
`       } catch (IOException e){`  
`           e.printStackTrace();`  
`       }`

`               // now get the protein structure.`  
`       Structure cifStructure = consumer.getStructure();`  
`                     `

}

</java>

For more info on how to work with the BioJava structure data model see
<BioJava:CookBook:PDB:atoms>.

References
----------

<biblio>

1.  westbrook2000 pmid=10842738
2.  westbrook2003 pmid=12647386

</biblio>
