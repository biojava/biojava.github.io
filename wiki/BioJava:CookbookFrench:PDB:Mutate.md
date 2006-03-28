---
title: BioJava:CookbookFrench:PDB:Mutate
---

Comment faire une mutation dans un fichier PDB
----------------------------------------------

<java>

`// muter la structure de la proteine`  
`// pour sauver en fichier`  
  
`String filename   =  "5pti.pdb" ;`  
`String outputfile =  "mutated.pdb" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    System.out.println(struc);`  
  
  
`    String chainId = " ";`  
`    String pdbResnum = "3";`  
`    String newType = "ARG";`  
  
`    // muter la structure originale pour en creer une nouvelle.`  
`    // laissons la chaine laterale pointee dans la meme direction`  
`    // en utilisant seulement les atomes Cb.`  
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
