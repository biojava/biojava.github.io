---
title: BioJava:CookBook:PDB:align
---

### How can I calculate a structure alignment?

The structure alignment algorithm contained in BioJava is based on a
variation of the PSC++ algorithm provided by Peter Lackner, Univ.
Salzburg (personal communication)

<java>

` public static void main(String[] args){`

`           PDBFileReader pdbr = new PDBFileReader();          `  
`           pdbr.setPath("/Path/To/My/PDBFiles/");`  
`           `  
`           `  
`           String pdb1 = "1buz";`  
`           String pdb2 = "1ali";            `  
`           String outputfile = "/somewhere/alig_"+pdb1+"_"+pdb2+".pdb";`  
`         `

`           // NO NEED TO DO CHANGE ANYTHING BELOW HERE...`  
`           `  
`           StructurePairAligner sc = new StructurePairAligner();            `  
`           `  
`           // step1 : read molecules`  
`           `  
`           System.out.println("aligning " + pdb1 + " vs. " + pdb2);`  
`           `  
`           Structure s1 = pdbr.getStructureById(pdb1);`  
`           Structure s2 = pdbr.getStructureById(pdb2);                       `  
`         `  
`           // step 2 : do the calculations`  
`           sc.align(s1,s2);`

`           // if you want more control over the alignment parameters`  
`           // use the StrucAligParameters`  
`           //StrucAligParameters params = new StrucAligParameters();`  
`           //params.setFragmentLength(8);      `  
`           //sc.align(s1,s2,params); `

`           AlternativeAlignment[] aligs = sc.getAlignments();`  
`           `  
`           //cluster similar results together `  
`           ClusterAltAligs.cluster(aligs);`  
`           `  
`          // print the result:`  
`          // the AlternativeAlignment object gives  access to rotation matrices / shift vectors.`  
`          for (int i=0 ; i< aligs.length; i ++){`  
`              AlternativeAlignment aa = aligs[i];`  
`              System.out.println(aa);              `  
`          }`  
`           `  
`                     `  
`           // convert AlternativeAlignemnt 1 to PDB file, so it can be opened with a viewer of your choice`  
`           //(e.g. Jmol, Rasmol)`  
`           `  
`           if ( aligs.length > 0) {`  
`               AlternativeAlignment aa1 =aligs[0];`  
`               String pdbstr = aa1.toPDB(s1,s2);`  
`               `  
`               System.out.println("writing alignment to " + outputfile);`  
`               FileOutputStream out= new FileOutputStream(outputfile); `  
`               PrintStream p =  new PrintStream( out );`  
`       `  
`               p.println (pdbstr);`

`               p.close();`  
`               out.close();`  
`           }`  
`           `  
`                      `  
`       } catch (Exception e){`  
`           e.printStackTrace();`  
`       }`

} </java>
