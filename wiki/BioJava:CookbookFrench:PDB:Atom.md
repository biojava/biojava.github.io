---
title: BioJava:CookbookFrench:PDB:Atom
---

Comment obtenir les informations sur les atomes présent dans un fichier PDB?
----------------------------------------------------------------------------

BioJava possède un structure très flexible pour gérer des données
sructurales de protéines. La classe Structure
([javadocs](http://www.biojava.org/docs/api16/org/biojava/bio/structure/Structure.html))
vous procure le conteneur principal à partir du quel vous pouvez accéder
à toutes les données.

Un objet Structure contient la hiérarchie suivante de sous-objets:

    Structure
       |
       Model(s)
          |
          Chain(s)
             |
             Group(s)
                |
                Atom(s)

Il existe différentes manières d'accéder aux données contenues dans un
objet Structure. Par exemple, si vous voulez obtenir directement un
tableau d'Atomes, utilisez le code suivant:

<java>

// pour obtenir tous les atomes de type Calpha dans la structure Atom[]
caAtoms = StructureTools.getAtomArray(structure, new String[]{"CA")};

</java>

Une autre façon de faire est d'utiliser des itérateurs pour parcourir
les Atoms et les Groups.

<java> public static int getNrAtoms(Structure s){

`       int nrAtoms = 0;`  
`       `  
`       Iterator iter = new GroupIterator(s);`  
`       `  
`       while ( iter.hasNext()){`  
`           Group g = (Group) iter.next();`  
`           nrAtoms += g.size();`  
`       }`  
`       `  
`       return nrAtoms;`  
`   }`

</java>

Ou comme ça:

<java>

`       AtomIterator iter = new AtomIterator(structure) ;`  
`       while (iter.hasNext()) {`  
`           Atom atom = (Atom) iter.next() ;`  
`           Calc.rotate(atom,rotationmatrix);`  
`       }`

</java>
