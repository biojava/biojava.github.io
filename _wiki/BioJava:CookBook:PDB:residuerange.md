---
title: BioJava:CookBook:PDB:residuerange
---

### How to calculate the true length of a range of residues

Insertion codes pose a problem when calculating length--the number of
residues between two residues in the same chain. For example, the
following method may return an incorrect result; <java> int
getLength(String string) {

`   Atom[] ca = cache.getAtoms(string);`  
`   int start = ca[0].getGroup().getResidueNumber().getSeqNum();`  
`   int end = ca[ca.length-1].getGroup().getResidueNumber().getSeqNum();`  
`   return end - start;`

} </java>

Instead, use
[AtomPositionMap](http://www.biojava.org/docs/api/org/biojava/bio/structure/AtomPositionMap)
and
[ResidueRange](http://www.biojava.org/docs/api/org/biojava/bio/structure/ResidueRange):
<java> int getLength(String string) {

`   AtomPositionMap map = AtomPositionMap.ofAminoAcids(cache.getAtoms(string));`  
`   ResidueRange range = ResidueRange.parse(string, map);`  
`   System.out.println(range.getLength()); // will print the correct length`

} </java>

The above method won't give the best performance if you're calling it
for multiple structures from the same PDB Id. Instead, it is better to
reuse, creating only one AtomPositionMap per PDB Id.
