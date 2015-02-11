---
title: BioJava:CookBook:PDB:seqres
---

SEQRES and ATOM information from PDB files
------------------------------------------

The SEQRES records in a PDB file contain the amino acid or nucleic acid
sequence of residues in each chain of the macromolecule that was
studied. The ATOM records provide the coordinates for those residues
that were possible to observe. In order to join this information,
Biojava aligns the SEQRES and the ATOM records for each chain. This is
optional and can be enabled or disabled by using the
[PDBFileReader.setAlignSeqRes()](http://www.biojava.org/docs/api/org/biojava/bio/structure/io/PDBFileReader.html)
method. By default this alignment will be calculated.

Access to the ATOM groups is possible via
[Chain.getAtomGroups()](http://www.biojava.org/docs/api/org/biojava/bio/structure/Chain.html).
Access to the SEQRES groups is possible via
[Chain.getSeqResGroups()](http://www.biojava.org/docs/api/org/biojava/bio/structure/Chain.html).
Groups derived from SEQRES groups will be empty (i.e. they will not
contain Atoms), unless they could be mapped to the ATOM records, in
which case the full ATOM information can be accessed.

Example: <java> import java.util.List; import
org.biojava.nbio.structure.Chain; import
org.biojava.nbio.structure.Group; import
org.biojava.nbio.structure.GroupType; import
org.biojava.nbio.structure.Structure; import
org.biojava.nbio.structure.io.FileParsingParameters; import
org.biojava.nbio.structure.io.PDBFileReader; import
org.biojava.nbio.structure.io.LocalPDBDirectory.FetchBehavior;

public class SeqResCookBook {

`   public static void main(String[] args) throws Exception {`  
`       `  
`       String code =  "1aoi";`  
  
`       PDBFileReader pdbreader = new PDBFileReader();`  
`       FileParsingParameters params = new FileParsingParameters();`  
`       params.setParseSecStruc(true);// parse the secondary structure information from PDB file`  
`       params.setAlignSeqRes(true);  // align SEQRES and ATOM records`  
`       pdbreader.setFileParsingParameters(params);`  
`       `  
`       pdbreader.setFetchBehavior(FetchBehavior.FETCH_FILES);   // fetch PDB files from web if they can't be found locally`

`       Structure struc = pdbreader.getStructureById(code);`

`       System.out.println("The SEQRES and ATOM information is available via the chains:");`

`       int modelnr = 0 ; // also is 0 if structure is an XRAY structure.`

`       List`<Chain>` chains = struc.getChains(modelnr);`  
`       for (Chain cha:chains){`  
`           List`<Group>` agr = cha.getAtomGroups(GroupType.AMINOACID);`  
`           List`<Group>` hgr = cha.getAtomGroups(GroupType.HETATM);`  
`           List`<Group>` ngr = cha.getAtomGroups(GroupType.NUCLEOTIDE);`

`           System.out.print("chain: >"+cha.getChainID()+"<");`  
`           System.out.print(" length SEQRES: " +cha.getSeqResLength());`  
`           System.out.print(" length ATOM: " +cha.getAtomLength());`  
`           System.out.print(" aminos: " +agr.size());`  
`           System.out.print(" hetatms: "+hgr.size());`  
`           System.out.println(" nucleotides: "+ngr.size());  `  
`       }`

`   }`

}

</java>

gives this output:

    The SEQRES and ATOM information is available via the chains:
    chain: >I< length SEQRES: 146 length ATOM: 153 aminos: 0 hetatms: 7 nucleotides: 146
    chain: >J< length SEQRES: 146 length ATOM: 154 aminos: 0 hetatms: 8 nucleotides: 146
    chain: >A< length SEQRES: 116 length ATOM: 98 aminos: 98 hetatms: 0 nucleotides: 0
    chain: >B< length SEQRES: 87 length ATOM: 84 aminos: 83 hetatms: 1 nucleotides: 0
    chain: >C< length SEQRES: 116 length ATOM: 115 aminos: 115 hetatms: 0 nucleotides: 0
    chain: >D< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0
    chain: >E< length SEQRES: 116 length ATOM: 117 aminos: 116 hetatms: 1 nucleotides: 0
    chain: >F< length SEQRES: 87 length ATOM: 89 aminos: 87 hetatms: 2 nucleotides: 0
    chain: >G< length SEQRES: 116 length ATOM: 108 aminos: 108 hetatms: 0 nucleotides: 0
    chain: >H< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0

Next: <BioJava:CookBook:PDB:align> - How to align two protein structures
