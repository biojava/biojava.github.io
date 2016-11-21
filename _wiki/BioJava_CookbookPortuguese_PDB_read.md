---
title: BioJava:CookbookPortuguese:PDB:read
permalink: wikis/BioJava%3ACookbookPortuguese%3APDB%3Aread
---

### Como eu leio um arquivo PDB?

```java

`// também funciona com arquivos compactados com gzip`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    System.out.println(struc);`  
`} catch (Exception e) {`  
`    e.printStackTrace();`  
`}`

```
