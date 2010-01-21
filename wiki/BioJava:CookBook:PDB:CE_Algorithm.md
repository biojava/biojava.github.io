---
title: BioJava:CookBook:PDB:CE Algorithm
---

CE Algorithm
============

The upcoming BioJava 3 release will provide a BioJava version of the
**Combinatorial Extension Algorithm** (CE), originally developed by
Shindalov and Bourne.
[http://peds.oxfordjournals.org/cgi/content/short/11/9/739 original
manuscript](http://peds.oxfordjournals.org/cgi/content/short/11/9/739 original manuscript "wikilink").

User Interface
==============

**Required modules**: *biojava3-structure, biojava3-structure-gui,
alignment*

A user interface for running structure alignments manually is available
through the biojava3-structure-gui modules. <java> public static void
main(String[] args) {

`       System.setProperty("PDB_DIR","/Users/andreas/WORK/PDB/");`  
`   `  
`       AlignmentGui.getInstance();`

} </java>

The *PDB\_DIR* property allows to specify the path, where in the local
file system PDB files are stored.
