---
title: BioJava:CookBook:PDB:FATCAT Algorithm
---

FATCAT Algorithm
================

Biojava 3+ provides a BioJava version of the **FATCAT** algorithm,
originally developed by Yuzhen Ye and A. Godzik.
[http://www.ncbi.nlm.nih.gov/pubmed/14534198 original
publication](http://www.ncbi.nlm.nih.gov/pubmed/14534198 original publication "wikilink").

User Interface
==============

**Required modules**: *biojava-structure, biojava-structure-gui,
alignment*

A user interface for running structure alignments manually is available
through the biojava-structure-gui modules. <java> public static void
main(String[] args) {

`       System.setProperty("PDB_DIR","/tmp/");`  
`   `  
`       AlignmentGui.getInstance();`

} </java>

The *PDB\_DIR* property allows to specify the path, where in the local
file system PDB files are stored.

Local Execution
===============

**Required modules**: *biojava-structure, alignment*

Using BioJava it is possible to align any set of atoms with the FATCAT
algorithm. This example demonstrates how to align two protein chains and
edit some of the parameters.

<java>

`  public static void main(String[] args){`  
`      `  
`      String pdbFilePath="/tmp/";`  
`      `  
`      boolean isSplit = true;`  
`      `  
`      String name1 = "1cdg.A";`  
`      String name2 = "1tim.B";`  
`          `  
`      AtomCache cache = new AtomCache(pdbFilePath, isSplit);`  
`             `  
`      Structure structure1 = null;`  
`      Structure structure2 = null;`

`      try {`

`         // To run FATCAT in the flexible variant say`  
`         // FatCatFlexible.algorithmName below`  
`         StructureAlignment algorithm  = StructureAlignmentFactory.getAlgorithm(FatCatRigid.algorithmName);`  
`         `  
`          structure1 = cache.getStructure(name1);`  
`          structure2 = cache.getStructure(name2);`  
`          `  
`          Atom[] ca1 = StructureTools.getAtomCAArray(structure1);`  
`          Atom[] ca2 = StructureTools.getAtomCAArray(structure2);`  
`          `  
`          // get default parameters`  
`          FatCatParameters params = new FatCatParameters();`  
`         `  
`          `  
`          AFPChain afpChain = algorithm.align(ca1,ca2,params);            `

`          afpChain.setName1(name1);`  
`          afpChain.setName2(name2);`

`          // show original FATCAT output:`  
`          System.out.println(afpChain.toFatcat(ca1,ca2));`  
`          `  
`          // show a nice summary print`  
`          System.out.println(AfpChainWriter.toWebSiteDisplay(afpChain, ca1, ca2));`  
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
