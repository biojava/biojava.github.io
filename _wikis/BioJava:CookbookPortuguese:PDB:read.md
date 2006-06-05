---
title: BioJava:CookbookPortuguese:PDB:read
---

### Como eu leio um arquivo PDB?

<java>

`// também funciona par arquivos comprimidos com gzip`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    System.out.println(struc);`  
`} catch (Exception e) {`  
`    e.printStackTrace();`  
`}`

</java>
