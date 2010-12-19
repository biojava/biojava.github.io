---
title: BioJava:CookBook:PDB:read3.0
---

### How do I read a PDB file?

BioJava provides a PDB file parser, that reads the content of a PDB file
into a flexible data model for managing protein structural data. It is
possible to

-   parse individual PDB files, or
-   work with local PDB file installations.

The class providing the core functionality for this is the
[PDBFileReader](http://www.biojava.org/docs/api/index.html?org/biojava/bio/structure/io/PDBFileReader.html)
class.

Short Example: the quickest way to read a local file
----------------------------------------------------

<java>

`// also works for gzip compressed files`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`

`try{`

`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`} catch (Exception e){`  
`    e.printStackTrace();`  
`}`

</java>

Example: How to work with a local installation of PDB
-----------------------------------------------------

BioJava can work with local installations of PDB files. It can also
automatically download and install missing PDB files. Here an example
for how to do that:

<java>

public void basicLoad(String pdbId){

`     try {`

`        PDBFileReader reader = new PDBFileReader();`

`        // the path to the local PDB installation`  
`        reader.setPath("/tmp");`

`        // are all files in one directory, or are the files split,`  
`        // as on the PDB ftp servers?`  
`        reader.setPdbDirectorySplit(true);`

`        // should a missing PDB id be fetched automatically from the FTP servers?`  
`        reader.setAutoFetch(true);`

`        // configure the parameters of file parsing`  
`        `  
`        FileParsingParameters params = new FileParsingParameters();`  
`        `  
`        // should the ATOM and SEQRES residues be aligned when creating the internal data model?`  
`        params.setAlignSeqRes(true);`

`        // should secondary structure get parsed from the file`  
`        params.setParseSecStruc(false);`

`        params.setLoadChemCompInfo(true);`  
`        `  
`        reader.setFileParsingParameters(params);`  
`        `  
`        Structure structure = reader.getStructureById(pdbId);`  
`        `  
`        System.out.println(structure);`  
`        `  
`        for (Chain c: structure.getChains()){`  
`           System.out.println("Chain " + c.getName() + " details:");`  
`           System.out.println("Atom ligands: " + c.getAtomLigands());`  
`           System.out.println(c.getSeqResSequence());`  
`        }`  
`        `

`     } catch (Exception e){`  
`        e.printStackTrace();`  
`     }`

`}`

</java>

Will give this output:

    structure  4HHB Authors: G.FERMI,M.F.PERUTZ IdCode: 4HHB Classification: OXYGEN TRANSPORT DepDate: Wed Mar 07 00:00:00 PST 1984 Technique: X-RAY DIFFRACTION  Resolution: 1.74 ModDate: Tue Feb 24 00:00:00 PST 2009 Title: THE CRYSTAL STRUCTURE OF HUMAN DEOXYHAEMOGLOBIN AT 1.74 ANGSTROMS RESOLUTION 
     chains:
    chain 0: >A< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 141 length ATOM: 198 aminos: 141 hetatms: 57 nucleotides: 0
    chain 1: >B< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 146 length ATOM: 205 aminos: 146 hetatms: 59 nucleotides: 0
    chain 2: >C< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 141 length ATOM: 201 aminos: 141 hetatms: 60 nucleotides: 0
    chain 3: >D< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 146 length ATOM: 197 aminos: 146 hetatms: 51 nucleotides: 0
    DBRefs: 4
    DBREF  4HHB A    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB B    1   146  UNP    P68871   HBB_HUMAN        1    146
    DBREF  4HHB C    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB D    1   146  UNP    P68871   HBB_HUMAN        1    146
    Molecules: 
    Compound: 1 HEMOGLOBIN (DEOXY) (ALPHA CHAIN) Chains: ChainId: A C Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 
    Compound: 2 HEMOGLOBIN (DEOXY) (BETA CHAIN) Chains: ChainId: B D Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 

    Chain A details:
    Atom ligands: [Hetatom 142 HEM true atoms: 43]
    VLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR
    Chain B details:
    Atom ligands: [Hetatom 147 PO4 true atoms: 1, Hetatom 148 HEM true atoms: 43]
    VHLTPEEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQRFFESFGDLSTPDAVMGNPKVKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVCVLAHHFGKEFTPPVQAAYQKVVAGVANALAHKYH
    Chain C details:
    Atom ligands: [Hetatom 142 HEM true atoms: 43]
    VLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR
    Chain D details:
    Atom ligands: [Hetatom 147 PO4 true atoms: 1, Hetatom 148 HEM true atoms: 43]
    VHLTPEEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQRFFESFGDLSTPDAVMGNPKVKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVCVLAHHFGKEFTPPVQAAYQKVVAGVANALAHKYH

Caching of structure data
-------------------------

If you are running a script that is frequently re-using the same PDB
structures, there is a new utility class that keeps an in-memory cache
of the files for quicker access, the AtomCache. The cache is a
soft-cache, this means it won't cause out of memory exceptions, but
garbage collects the data if the Java virtual machine needs to free up
space. The AtomCache is thread-safe.

<java> public void loadStructureFromCache(){

`     String pdbId = "4hhb";`  
`     String chainName = "4hhb.A";`  
`     String entityName = "4hhb:0";`

`     // split PDB file installation?`  
`     boolean isPdbDirectorySplit = true;`

`     String pdbFilePath = "/tmp/";`

`     // we can set a flag if the file should be cached in memory`  
`     // this will enhance IO massively if the same files have to be accessed over and over again.`  
`     // since this is a soft cache, no danger of memory leak`  
`     // this is actually not necessary to provide, since this will be set automatically by the Atom Cache.  `  
`     // The  default is "true" if the AtomCache is being used.`  
`     System.setProperty(InputStreamProvider.CACHE_PROPERTY, "true");`

`     AtomCache cache = new AtomCache(pdbFilePath,isPdbDirectorySplit);`

`     try {`  
`        System.out.println("======================");`  
`        Structure s = cache.getStructure(pdbId);`

`        System.out.println("Full Structure:" + s);`

`        Atom[] ca = cache.getAtoms(chainName);`  
`        System.out.println("got " + ca.length + " CA atoms");`

`        Structure firstEntity = cache.getStructure(entityName);`  
`        System.out.println("First entity: " + firstEntity);`

`     } catch (Exception e){`  
`        e.printStackTrace();`  
`     }`

`  }`

</java>

Example: How to parse a local file
----------------------------------

This example shows how to read a PDB file from your file system, obtain
a [Structure
object](http://www.biojava.org/docs/api/org/biojava/bio/structure/Structure.html)
and iterate over the
[Groups](http://www.biojava.org/docs/api/org/biojava/bio/structure/Group.html)
that are contained in the file. For more examples of how to access the
[Atoms](http://www.biojava.org/docs/api/org/biojava/bio/structure/Atom.html)
please go to <BioJava:CookBook:PDB:atoms>. For more info on how the
parser deals with SEQRES and ATOM records please see
<BioJava:CookBook:PDB:seqres> <java>

`// also works for gzip compressed files`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`

`// configure the parameters of file parsing`

`FileParsingParameters params = new FileParsingParameters();`

`// parse the C-alpha atoms only, default = false`  
`params.setParseCAOnly(false);`

`// align the SEQRES and ATOM records, default = true   `  
`// slows the parsing speed slightly down, so if speed matters turn it off.`  
`params.setAlignSeqRes(true);`

`// the parser can read the secondary structure`  
`// assignment from the PDB file header and add it to the amino acids`  
`params.setParseSecStruc(true);`  
`        `  
`reader.setFileParsingParameters(params);`

`// download missing PDB files automatically from EBI ftp server, default = false`  
`pdbreader.setAutoFetch(false);`

`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`    System.out.println(struc);`

`    GroupIterator gi = new GroupIterator(struc);`

`    while (gi.hasNext()){`

`          Group g = (Group) gi.next();`  
`         `  
`          if ( g instanceof AminoAcid ){`  
`              AminoAcid aa = (AminoAcid)g;`  
`              Map sec = aa.getSecStruc();`  
`              Chain  c = g.getParent();`  
`              System.out.println(c.getName() + " " + g + " " + sec);`  
`          }                `  
`    }`

`} catch (Exception e) {`  
`    e.printStackTrace();`  
`}`

</java>

To learn how to serialize a Structure object to a database see
<BioJava:CookBook:PDB:hibernate>

Next: <BioJava:CookBook:PDB:atoms> - How to access atoms.
