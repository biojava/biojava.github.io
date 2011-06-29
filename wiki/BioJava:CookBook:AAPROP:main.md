---
title: BioJava:CookBook:AAPROP:main
---

### How can I compute physiochemical properties?

BioJava provides a set of APIs to generate some commonly used
physiochemical properties. They are

-   [Molecular
    Weight](http://biojava.org/wiki/BioJava:CookBook:AAPROP:netcharge)
-   Absorbance
-   Extinction Coefficient
-   Instability Index
-   Apliphatic Index
-   Average Hydropathy Value
-   Isoelectric Point
-   Net Charge at pH 7
-   Composition of specified amino acid
-   Composition of the 20 standard amino acid

The class providing the core functionality for this is the
IPeptideProperties class.

Short Example: the quickest way to read a local file
----------------------------------------------------

<java>

`// also works for gzip compressed files`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`

`try{`

`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`} catch (Exception e){`  
`    e.printStackTrace();`  
`}`

</java>
