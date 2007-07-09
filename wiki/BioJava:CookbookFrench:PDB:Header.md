---
title: BioJava:CookbookFrench:PDB:Header
---

### Comment accéder aux informations contenues dans l'en-tête d'un fichier PDB?

Tout comme un fichier GenBank ou EMBL, un fichier PDF contient dans son
en-tête des éléments d'information souvent très utiles. La recette
suivante vous permet d'y accéder.

<java>

`   public static void main (String[] args){`  
`       try {`  
`           `  
`           PDBFileReader pdbr = new PDBFileReader();          `  
`           pdbr.setPath("/chemin/vers/vos/PDB/");`  
`           `  
`           String pdbCode = "5pti";`  
`           `  
`           Structure struc = pdbr.getStructureById(pdbCode);`  
`         `  
`           Map m = struc.getHeader();`  
`                    `  
`           `  
`           Set keys = m.keySet();`  
`           Iterator iter = keys.iterator();`  
`           while (iter.hasNext()){`  
`               String key = (String) iter.next();`  
`               System.out.println(key +": " +  m.get(key));`  
`           }`  
`           `  
`           `  
`       } catch (Exception e){`  
`           e.printStackTrace();`  
`       }`  
`   }`

</java>

fournira la sortie suivante:

    title: STRUCTURE OF BOVINE PANCREATIC TRYPSIN INHIBITOR. RESULTS OF JOINT NEUTRON AND X-RAY REFINEMENT OF CRYSTAL FORM /II$ 
    technique: NEUTRON DIFFRACTION, X-RAY DIFFRACTION 
    classification: PROTEINASE INHIBITOR (TRYPSIN)
    depDate: 05-OCT-84
    modDate: 11-NOV-03
    idCode: 5PTI
    resolution: 1.8
