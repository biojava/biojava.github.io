---
title: BioJava:CookBook:PDB:mutate
---

### How can I mutate a residue

<java>

`// mutate a protein structure`  
`// and save to file`  
  
`String filename   =  "5pti.pdb" ;`  
`String outputfile =  "mutated.pdb" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    System.out.println(struc);`  
  
  
`    String chainId = "A";`  
`    String pdbResnum = "3";`  
`    String newType = "ARG";`  
  
`    // mutate the original structure and create a new one.`  
`    // lets side chain point into the same direction, but only uses Cb atom`  
`     Mutator m = new Mutator();`

`     Structure newstruc = m.mutate(struc,chainId,pdbResnum,newType);`  
` `  
`     FileOutputStream out= new FileOutputStream(outputfile); `  
`     PrintStream p =  new PrintStream( out );`  
` `  
`     p.println (newstruc.toPDB());`  
` `  
`     p.close();`  
` `  
` `  
` } catch (Exception e) {`  
`     e.printStackTrace();`  
` } `

</java>
