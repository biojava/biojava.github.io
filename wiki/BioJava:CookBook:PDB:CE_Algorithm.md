---
title: BioJava:CookBook:PDB:CE Algorithm
---

CE Algorithm
============

The upcoming BioJava 3 release will provide a BioJava version of the
**Combinatorial Extension Algorithm** (CE), originally developed by
Shindyalov and Bourne.
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

Local Execution
===============

**Required modules**: *biojava3-structure, alignment*

Using BioJava3 it is possible to align any set of atoms with the CE
algorithm. This example demonstrates how to align two protein chains and
edit some of the parameters.

<java>

`  public static void main(String[] args){`  
`      `  
`      String pdbFilePath="/tmp/";`  
`      `  
`      boolean isSplit = true;`  
`           `  
`      String name1 = "1cdg.A";`  
`      String name2 = "1tim.B";`  
`      `  
`      AtomCache cache = new AtomCache(pdbFilePath, isSplit);`  
`              `  
`      Structure structure1 = null;`  
`      Structure structure2 = null;`

`      try {`

`         StructureAlignment algorithm  = StructureAlignmentFactory.getAlgorithm(CeMain.algorithmName);`  
`         `  
`          structure1 = cache.getStructure(name1);`  
`          structure2 = cache.getStructure(name2);`  
`          `  
`          Atom[] ca1 = StructureTools.getAtomCAArray(structure1);`  
`          Atom[] ca2 = StructureTools.getAtomCAArray(structure2);`  
`          `  
`          // get default parameters`  
`          CeParameters params = new CeParameters();`  
`          `  
`          // add more print`  
`          params.setShowAFPRanges(true);`  
`          `  
`          // set the maximum gap size to unlimited `  
`          params.setMaxGapSize(-1);`  
`          `  
`          AFPChain afpChain = algorithm.align(ca1,ca2,params);            `

`          afpChain.setName1(name1);`  
`          afpChain.setName2(name2);`

`          // flexible original results:`  
`          System.out.println(afpChain.toFatcat(ca1,ca2));`  
`          `  
`          // print rotation matrices`  
`          System.out.println(afpChain.toRotMat());`  
`          //System.out.println(afpChain.toCE(ca1, ca2));`  
`          `  
`          // print XML representation`  
`          //System.out.println(AFPChainXMLConverter.toXML(afpChain,ca1,ca2));`  
`                       `  
`          StructureAlignmentDisplay.display(afpChain, ca1, ca2);`  
`          `  
`      } catch (Exception e) {`  
`          e.printStackTrace();`  
`          return;`  
`      }`  
`  }`

</java>
