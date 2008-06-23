---
title: BioJava:Performance:AlignMyoHemo
---

Align two protein structures
============================

This source code is run in the [example that calculates the structure
alignment](BioJava:Performance "wikilink") of Myoglobin and Hemoglobin.
See <BioJava:CookBook:PDB:align> for more information on how to
calculate protein structure alignments. <java>

`           Structure s1 = getStructureFromFile(fileName1);`  
`           Structure s2 = getStructureFromFile(fileName2);`  
`           `  
`           StructurePairAligner aligner = new StructurePairAligner();`

`           aligner.align(s1, s2);`

</java>
