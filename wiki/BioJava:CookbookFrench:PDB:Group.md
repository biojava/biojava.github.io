---
title: BioJava:CookbookFrench:PDB:Group
---

L'interface <b>Group</b> regroupe toutes les méthodes communes à un
groupe d'atomes. On défini trois types de groupes d'atomes:

-   [AminoAcid](http://www.biojava.org/docs/api/org/biojava/bio/structure/AminoAcid.html)
-   [Nucleotide](http://www.biojava.org/docs/api/org/biojava/bio/structure/NucleotideImpl.html)
-   [Hetatom](http://www.biojava.org/docs/api/org/biojava/bio/structure/HetatomImpl.html)

Par exemple, pour obtenir la liste de tous les acides aminés observé
dans une chaîne polypeptidique d'un fichier PDB, vous pouvez utiliser la
méthode suivante:

<java> Chain chain = s.getChainByPDB("A"); List<Group> groups =
chain.getAtomGroups("amino");

for (Group group : groups){

`  AminoAcid aa = (AminoAcid) group;`

`  // faite quelque chose de tres proteine-specifique, `  
`  // par exemple: afficher l'assignation de structure secondaire`  
`  System.out.println(aa + " " + aa.getSecStruc());`

} </java>

De la même manière, vous pouvez accéder aux groupes de nucléotides ou au
groupes d'hétéroatomes:

<java> chain.getAtomGroups("nucleotide"); </java>

<java> chain.getAtomGroups("hetatm"); </java>

Puisque les trois types de groupe implémentent l'interface <b>Group</b>,
vous pouvez aussi faire une itération sur une liste de groupes afin d'en
obtenir le type:

<java> List<Group> allgroups = chain.getAtomGroups();

for (Group group : groups){

`  if ( group instanceof AminoAcid){`  
`   AminoAcid aa = (AminoAcid) group;`  
`   System.out.println(aa.getSecStruc());`  
`  }`

} </java>
