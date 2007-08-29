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
PDBFileReader.setAlignSeqRes() method. By default this alignment will be
calculated.

Example: <java>

public static void main(String[] args){

`       String code =  "1aoi";`

`       PDBFileReader pdbreader = new PDBFileReader();`  
`       pdbreader.setPath("/Path/To/PDBFiles/");`  
`       pdbreader.setParseSecStruc(true);// parse the secondary structure information from PDB file`  
`       pdbreader.setAlignSeqRes(true);  // align SEQRES and ATOM records`  
`       pdbreader.setAutoFetch(true);    // fetch PDB files from web if they can't be found locally`

`       try{`  
`           Structure struc = pdbreader.getStructureById(code);`  
`           `  
`           System.out.println("The SEQRES and ATOM information is available via chains:");`

`           int modelnr = 0 ; // also is 0 if structure is an XRAY structure.`

`           List`<Chain>` chains = struc.getChains(modelnr);`  
`           for (Chain cha:chains){`  
`               List`<Group>` agr = cha.getAtomGroups("amino");`  
`               List`<Group>` hgr = cha.getAtomGroups("hetatm");`  
`               List`<Group>` ngr = cha.getAtomGroups("nucleotide");`

`               System.out.print("chain: >"+cha.getName()+"<");`  
`               System.out.print(" length SEQRES: " +cha.getLengthSeqRes());`  
`               System.out.print(" length ATOM: " +cha.getAtomLength());`  
`               System.out.print(" aminos: " +agr.size());`  
`               System.out.print(" hetatms: "+hgr.size());`  
`               System.out.println(" nucleotides: "+ngr.size());  `  
`           }`

`       } catch (Exception e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`

</java>

gives this output:

    The SEQRES and ATOM information is available via the chains:
    chain: >A< length SEQRES: 116 length ATOM: 98 aminos: 98 hetatms: 0 nucleotides: 0
    chain: >B< length SEQRES: 87 length ATOM: 83 aminos: 83 hetatms: 0 nucleotides: 0
    chain: >C< length SEQRES: 116 length ATOM: 115 aminos: 115 hetatms: 0 nucleotides: 0
    chain: >D< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0
    chain: >E< length SEQRES: 116 length ATOM: 116 aminos: 116 hetatms: 0 nucleotides: 0
    chain: >F< length SEQRES: 87 length ATOM: 87 aminos: 87 hetatms: 0 nucleotides: 0
    chain: >G< length SEQRES: 116 length ATOM: 108 aminos: 108 hetatms: 0 nucleotides: 0
    chain: >H< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0
    chain: >I< length SEQRES: 0 length ATOM: 146 aminos: 0 hetatms: 0 nucleotides: 146
    chain: >J< length SEQRES: 0 length ATOM: 146 aminos: 0 hetatms: 0 nucleotides: 146
    chain: > < length SEQRES: 0 length ATOM: 19 aminos: 0 hetatms: 19 nucleotides: 0

Next: <BioJava:CookBook:PDB:align> - How to align two protein structures
