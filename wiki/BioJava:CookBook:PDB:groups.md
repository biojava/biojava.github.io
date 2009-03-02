---
title: BioJava:CookBook:PDB:groups
---

### Groups

The Group interface defines all methods common to a group of atoms.
There are 3 types of Groups:

-   [AminoAcid](http://www.biojava.org/docs/api/org/biojava/bio/structure/AminoAcid.html)
-   [Nucleotide](http://www.biojava.org/docs/api/org/biojava/bio/structure/NucleotideImpl.html)
-   [Hetatom](http://www.biojava.org/docs/api/org/biojava/bio/structure/HetatomImpl.html)

In order to get all amino acids that have been observed in a PDB chain,
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

In a similar way you can access all nucleotide groups by <java>

`           chain.getAtomGroups("nucleotide");`

</java>

The Hetatom groups are access in a similar fashion: <java>

`           chain.getAtomGroups("hetatm");`

</java>

Since all 3 types of groups are implementing the Group interface, you
can also iterate over all groups and check for the instance type:

<java>

`           List`<Group>` allgroups = chain.getAtomGroups();`  
`           for (Group group : groups) {`  
`               if ( group instanceof AminoAcid) {`  
`                   AminoAcid aa = (AminoAcid) group;`  
`                   System.out.println(aa.getSecStruc());`  
`               }`  
`           }`

</java>

Next: <BioJava:CookBook:PDB:header> - How to access the header
information
