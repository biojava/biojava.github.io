---
title: BioJava:CookBook4.0
---

BioJava Cookbook for release 4.\*
---------------------------------

BioJava 3+ is a major re-write of BioJava 1. As such many things work
differently. This cookbook provides examples how to work with the new
codebase.

The page was inspired by various programming cookbooks and follows a
"How do I...?" type approach. Each "How do I?" is linked to some example
code that does what you want and sometimes more. Basically if you find
the code you want and copy and paste it into your program you should be
up and running quickly. I have endeavoured to over document the code to
make it more obvious what I am doing so some of the code might look a
bit bloated.

If you have any suggestions, questions or comments contact the [biojava
mailing list](mailto:biojava-l@biojava.org). To subscribe to this list
go [here](http://biojava.org/mailman/listinfo/biojava-l)

**Please cite:**

Tutorial
--------

Many topics are also covered in the [BioJava
tutorial](https://github.com/biojava/biojava-tutorial).

How Do I....?
-------------

### Core Module - Working with Sequences

**Required modules**: *biojava-core*

-   [Overview of biojava-core?](/wikis/BioJava:CookBook:Core:Overview "wikilink")
-   [How are sequences created?](/wikis/BioJava:CookBook:Core:Sequences "wikilink")
-   [How do I compare two DNA Sequences and create a consensus sequence?](/wikis/BioJava:CookBook:Core:SequenceCompare "wikilink")
-   [How do I read or write Fasta files?](/wikis/BioJava:CookBook:Core:FastaReadWrite "wikilink")
-   [How do I read Genbank files?](/wikis/BioJava:CookBook:Core:GenbankRead "wikilink")
-   [How do I view Features on a sequence?](/wikis/BioJava:CookBook:Core:SequenceFeaturePanel "wikilink")

### Protein Structure

**Required modules**: *biojava-structure, biojava-alignment* **Optional
module** : *biojava-structure-gui* for the 3D visualisation **Optional
external library** : *JmolApplet.jar* for the 3D visualisation

-   [How can I parse a PDB
    file?](/wikis/BioJava:CookBook:PDB:read3.0 "wikilink")
-   [How can I parse a .mmcif
    file?](/wikis/BioJava:CookBook:PDB:mmcif "wikilink")
-   [What is the BioJava structure
    datamodel?](/wikis/BioJava:CookBook:PDB:datamodel "wikilink")
-   [How can I do calculations on
    atoms?](/wikis/BioJava:CookBook:PDB:atomsCalc "wikilink")
-   [How can I access the header information of a PDB
    file?](/wikis/BioJava:CookBook:PDB:header "wikilink")
-   [How does BioJava deal with SEQRES and ATOM
    groups?](/wikis/BioJava:CookBook:PDB:seqres "wikilink")
-   [How can I mutate a
    residue?](/wikis/BioJava:CookBook:PDB:mutate "wikilink")
-   [How can I calculate a structure
    alignment?](/wikis/BioJava:CookBook:PDB:align "wikilink")
-   [How can I use a simple GUI to calculate an
    alignment?](/wikis/BioJava:CookBook:PDB:alignGUI "wikilink")
-   [How can I interact with
    Jmol?](/wikis/BioJava:CookBook:PDB:Jmol "wikilink")
-   [How can I serialize to a
    database?](/wikis/BioJava:CookBook:PDB:hibernate "wikilink")
-   [How can I load data from the SCOP
    classification?](/wikis/BioJava:CookBook:PDB:SCOP "wikilink")
-   [How can I work with the Berkeley version of
    SCOP?](/wikis/BioJava:CookBook:PDBP:BerkeleySCOP "wikilink")
-   [How can I find residues binding a
    ligand?](/wikis/BioJava:CookBook:PDB:ligands "wikilink")
-   [How to work with biological assemblies of
    proteins](/wikis/BioJava:CookBook:PDB:bioassembly "wikilink")
-   [How to get information using RCSB's RESTful
    services](/wikis/BioJava:CookBook:PDB:restful "wikilink")
-   [How do I calculate the true length of a
    structure?](/wikis/BioJava:CookBook:PDB:restful "wikilink")

### Pairwise and Multiple Sequence Alignment

**Required modules**: *biojava-alignment, biojava-core, biojava-phylo*
**Required external library**: *forester.jar*

-   [How can I read a Sequence Alignment in Stockholm format](/wikis/BioJava:CookBook3:Stockholm "wikilink")? (Pfam, Rfam)
-   [How can I calculate a Pairwise Sequence Alignment](/wikis/BioJava:CookBook3:PSA "wikilink")? (Smith Waterman, Needleman Wunsch)
-   [How can I calculate a Pairwise Sequence Alignment with DNA sequences](/wikis/BioJava:CookBook3:PSA_DNA "wikilink")?
-   [How can I create a Multiple Sequence Alignment](/wikis/BioJava:CookBook3:MSA "wikilink")?
-   [How can I profile the time and memory requirements of a Multiple Sequence Alignment](/wikis/BioJava:CookBook3:MSAProfiler "wikilink")?

### Genome

**Required modules**: *biojava-genome*

-   [Overview of
    biojava-genome?](/wikis/BioJava:CookBook:genome:Overview "wikilink")

### Sequencing

**Required modules**: *biojava-core*,*biojava-sequencing* **Required
external library**: *guava-11.0.1.jar*

-   [How do I work with nextgen sequencing reads in FASTQ
    format?](/wikis/BioJava:CookBook3:FASTQ "wikilink")

### Phylogenetic tree

**Required modules**: ''biojava-core **Required external library**:
*forester.jar*

-   [Overview of
    biojava-phylo?](/wikis/BioJava:CookBook:Phylo:Overview "wikilink")

<!-- -->

-   [How do I convert Profile object into Multiple Sequence Alignment
    object to be use in the
    TreeConstructor](/wikis/BioJava:CookBook:Phylo:ProfileToMSA "wikilink")

### Physico-Chemical Properties Computation

**Required modules**: *biojava-aa-prop, biojava-structure and
biojava-core*

-   [How can I compute physico-chemical properties via
    APIs?](/wikis/BioJava:CookBook:AAPROP:main "wikilink")
-   [How can I compute physico-chemical properties using Command
    Prompt?](/wikis/BioJava:CookBook:AAPROP:commandprompt "wikilink")
-   [How can I compute PROFEAT properties via
    APIs?](/wikis/BioJava:CookBook:AAPROP:profeat "wikilink")

### Protein Disorder

**Required modules**: *biojava-protein-disorder*

-   [How can I predict disordered regions of the protein using its
    sequence?](/wikis/BioJava:CookBook3:ProteinDisorder "wikilink")
-   [Can I use the predictor from the command
    line?](/wikis/BioJava:CookBook3:ProteinDisorderCLI "wikilink")

### Protein Modification Identification

**Required modules**: *biojava-modfinder, biojava-structure*

-   [How can I identify protein modifications in a 3D
    structure?](/wikis/BioJava:CookBook3:ModFinder "wikilink")
-   [How can I get the list of supported protein
    modifications?](/wikis/BioJava:CookBook3:SupportedProtMod "wikilink")
-   [How can I define and register a new protein
    modification?](/wikis/BioJava:CookBook3:AddProtMod "wikilink")

### Remote Web Service Calls

**Required modules**: *biojava-core, biojava-ws*

-   [How can I use NCBI's QBlast service
    ?](/wikis/BioJava:CookBook3:NCBIQBlastService "wikilink")
-   [How can I use Blast XML Output in my
    program?](/wikis/BioJava:CookBook3:ParsingBlastXMLOutput "wikilink")
-   [How can I get Pfam annotations for a protein sequence using the
    Hmmer3 service?](/wikis/BioJava:CookBook3:HmmerService "wikilink")

Legacy 1.8.x CookBook
---------------------

The CookBook for the legacy 1.8.x code base is available from
<BioJava:CookBookLegacy>.
