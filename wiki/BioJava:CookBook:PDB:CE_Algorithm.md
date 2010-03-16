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

`       System.setProperty("PDB_DIR","/tmp/");`  
`   `  
`       AlignmentGui.getInstance();`

} </java>

The *PDB\_DIR* property allows to specify the path, where in the local
file system PDB files are stored.

Local Execution
===============

**Required modules**: *biojava3-structure, alignment*

**Optional module** : *biojava3-structure-gui* for the 3D visualisation

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
`          // The results are stored in an AFPChain object           `  
`          AFPChain afpChain = algorithm.align(ca1,ca2,params);            `

`          afpChain.setName1(name1);`  
`          afpChain.setName2(name2);`

`           // show a nice summary print`  
`          System.out.println(AfpChainWriter.toWebSiteDisplay(afpChain, ca1, ca2));`  
`          `  
`          // print rotation matrices`  
`          System.out.println(afpChain.toRotMat());`  
`          //System.out.println(afpChain.toCE(ca1, ca2));`  
`          `  
`          // print XML representation`  
`          //System.out.println(AFPChainXMLConverter.toXML(afpChain,ca1,ca2));`  
`                       `  
`          // This line requires the biojava3-structure-gui module   `  
`          StructureAlignmentDisplay.display(afpChain, ca1, ca2);`  
`          `  
`      } catch (Exception e) {`  
`          e.printStackTrace();`  
`          return;`  
`      }`  
`  }`

</java>

CE Parameters
=============

This CE implementation allows to specify a couple of custom parameters.

1.  int winSize : (default 8) The window size used for the calculation
    of the initial Aligned Fragment Pairs
2.  double rmsdThr; (default 3.0) RMSD threshold used while tracing the
    AFP fragments
3.  double rmsdThrJoin; (default 4.0) RMSD threshold used to decide if
    two AFPs should be joined
4.  String[] alignmentAtoms; (default CA) allows to configure which
    atoms to use. At the present only supports "CA" and "CA","CB"
    settings
5.  private int maxGapSize; (default 30) The Max gap size parameter G ,
    which was described to have been obtained empirically in the CE
    paper. the larger the max gap size, the longer the compute time, but
    in same cases drastically improved results. (e.g. 1CDG.A vs. 1TIM.A)
    For NO LIMIT set it to -1.
6.  boolean showAFPRanges; (default false) A print flag that allows to
    view the ranges of the inital AFPs, prior to alignment optimization.
7.  boolean checkCircular; (defaul false) A flag that determines if CE
    should check for Circular Permutations (CP). Increases calculation
    time significantly, but can detect CPs.

back to <BioJava:CookBook:PDB:align>
