---
title: BioJava:CookBook:PDB:read
---

### How do I read a PDB file?

<java>

`// also works for gzip compressed files`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`

`// optional: the parser can read the secondary structure`  
`// assignment from the PDB file header and add it to the amino acids`  
`pdbread.setParseSecStruc(true);     `

`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`    System.out.println(struc);`

`    GroupIterator gi = new GroupIterator(struc);`

`    while (gi.hasNext()){`

`          Group g = (Group) gi.next();`  
`         `  
`          if ( g instanceof AminoAcid ){`  
`              AminoAcid aa = (AminoAcid)g;`  
`              Map sec = aa.getSecStruc();`  
`              Chain  c = g.getParent();`  
`              System.out.println(c.getName() + " " + g + " " + sec);`  
`          }                `  
`    }`

`} catch (Exception e) {`  
`    e.printStackTrace();`  
`}`

</java>
