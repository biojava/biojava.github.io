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

    Fetching ftp://ftp.wwpdb.org/pub/pdb/data/structures/all/pdb/pdb4hhb.ent.gz
    writing to /tmp/hh/pdb4hhb.ent.gz
    structure  4HHB Authors: G.FERMI,M.F.PERUTZ Resolution: 1.74 Technique: X-RAY DIFFRACTION  Classification: OXYGEN TRANSPORT DepDate: Wed Mar 07 00:00:00 PST 1984 IdCode: 4HHB Title: THE CRYSTAL STRUCTURE OF HUMAN DEOXYHAEMOGLOBIN AT 1.74 ANGSTROMS RESOLUTION ModDate: Tue Feb 24 00:00:00 PST 2009 
     chains:
    chain 0: >A< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 0 length ATOM: 198 aminos: 141 hetatms: 57 nucleotides: 0
    chain 1: >B< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 0 length ATOM: 205 aminos: 146 hetatms: 59 nucleotides: 0
    chain 2: >C< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 0 length ATOM: 201 aminos: 141 hetatms: 60 nucleotides: 0
    chain 3: >D< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 0 length ATOM: 197 aminos: 146 hetatms: 51 nucleotides: 0
    DBRefs: 4
    DBREF  4HHB A    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB B    1   146  UNP    P68871   HBB_HUMAN        1    146
    DBREF  4HHB C    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB D    1   146  UNP    P68871   HBB_HUMAN        1    146
    Molecules: 
    Compound: 1 HEMOGLOBIN (DEOXY) (ALPHA CHAIN) Chains: ChainId: A C Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 
    Compound: 2 HEMOGLOBIN (DEOXY) (BETA CHAIN) Chains: ChainId: B D Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 

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

`// the following parameters are optional: `

`//the parser can read the secondary structure`  
`// assignment from the PDB file header and add it to the amino acids`  
`pdbreader.setParseSecStruc(true);`

`// align the SEQRES and ATOM records, default = true   `  
`// slows the parsing speed slightly down, so if speed matters turn it off.`  
`pdbreader.setAlignSeqRes(true);`  
` `  
`// parse the C-alpha atoms only, default = false`  
`pdbreader.setParseCAOnly(false);`

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
