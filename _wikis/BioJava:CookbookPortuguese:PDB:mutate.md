---
title: BioJava:CookbookPortuguese:PDB:mutate
---

### Como eu posso mutar um residuo?

<java>

`// mutar uma estrutura de proteina`  
`// e salvar para arquivo`  
  
`String filename   =  "5pti.pdb" ;`  
`String outputfile =  "mutated.pdb" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    System.out.println(struc);`  
  
  
`    String chainId = " ";`  
`    String pdbResnum = "3";`  
`    String newType = "ARG";`  
  
`    // muta a estrutura original e cria uma nova.`  
`    // deixa ponto de corrente lateral na mesma direção, mas só usa átomo Cb`  
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
