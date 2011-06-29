---
title: BioJava:CookBook:AAPROP:main
---

### How can I compute physiochemical properties?

BioJava provides a set of APIs to generate some commonly used
physiochemical properties. They are

-   [Molecular
    Weight](http://biojava.org/wiki/BioJava:CookBook:AAPROP:molecularweight)
-   [Absorbance](http://biojava.org/wiki/BioJava:CookBook:AAPROP:absorbanceandextinctioncoefficient)
-   [Extinction
    Coefficient](http://biojava.org/wiki/BioJava:CookBook:AAPROP:absorbanceandextinctioncoefficient)
-   [Instability
    Index](http://biojava.org/wiki/BioJava:CookBook:AAPROP:instabilityindex)
-   [Apliphatic
    Index](http://biojava.org/wiki/BioJava:CookBook:AAPROP:apliphaticindex)
-   [Average Hydropathy
    Value](http://biojava.org/wiki/BioJava:CookBook:AAPROP:averagehydropathyvalue)
-   [Isoelectric
    Point](http://biojava.org/wiki/BioJava:CookBook:AAPROP:isoelectricpoint)
-   [Net Charge at pH
    7](http://biojava.org/wiki/BioJava:CookBook:AAPROP:netcharge)
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
