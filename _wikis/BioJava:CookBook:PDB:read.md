---
title: BioJava:CookBook:PDB:read
---

### How do I read a PDB file?

     // also works for gzip compressed files
     String filename =  "path/to/pdbfile.ent" ;
     
     PDBFileReader pdbreader = new PDBFileReader();
     
     try{
         Structure struc = pdbreader.getStructure(filename);
         System.out.println(struc);
     } catch (Exception e) {
         e.printStackTrace();
     }
