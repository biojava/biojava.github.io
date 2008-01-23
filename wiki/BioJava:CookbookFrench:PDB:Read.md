---
title: BioJava:CookbookFrench:PDB:Read
---

Comment faire pour lire un fichier de type PDB?
-----------------------------------------------

La [*Protein Data Bank*](http://www.pdb.org) est la principale source de
données struturales disponible sur l'Internet. Contrairement aux
fichiers de type GenBank ou EMBL qui contiennent des donnés de séquence,
les fichiers PDB contiennent plutôt des données de position d'atomes au
sein d'une structure 3D. BioJava contient un modèle flexible permettant
la gestion des données de structure contenues dans un fichier PDB.
L'exemple ci-dessous montre comment faire la lecture d'un fichier PDB à
partir d'un système de fichiers local, obtenir un objet de type
Structure et d'itérer sur les Groupes contenus dans ce fichier.

L'accè aux informations de chaque Atome contenu dans le fichier se fait
plutôt de cette manière.

<java>

`// fonctionne egalement avec les fichiers`  
`// compresses par zip`  
`String filename =  "parcours/vers/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`// optionel: le lecteur peut aussi lire les structure secondaires `  
`// tel que decrites dans l'en-tet du fichier PDB pour les ajouter`  
`// aux acides amines`  
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
