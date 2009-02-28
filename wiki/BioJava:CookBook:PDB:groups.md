---
title: BioJava:CookBook:PDB:groups
---

### Groups

The Group interface defines all methods common to a group of atoms.
There are 3 tyes of Groups

-   [AminoAcid](http://www.biojava.org/docs/api/org/biojava/bio/structure/AminoAcid.html)
-   [Nucleotide](http://www.biojava.org/docs/api/org/biojava/bio/structure/NucleotideImpl.html)
-   [Hetatom](http://www.biojava.org/docs/api/org/biojava/bio/structure/HetatomImpl.html)

In order to get all amino acids that have been observed in a PDB chain
you can use the following utility method:

<java>

`           Chain chain = s.getChainByPDB("A");`  
`           List`<Group>` groups = chain.getAtomGroups("amino");`  
`           for (Group group : groups) {`  
`               AminoAcid aa = (AminoAcid) group;`

`               // do something amino acid specific, e.g. print the secondary structure assignment`  
`               System.out.println(aa + " " + aa.getSecStruc());`  
`           }`

</java>

Next: <BioJava:CookBook:PDB:header> - How to access the header
information
