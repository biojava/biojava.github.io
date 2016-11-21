---
title: BioJava:CookBook:PDB:atoms
permalink: wikis/BioJava%3ACookBook%3APDB%3Aatoms
---

### How can I access the atoms in a structure?

BioJava provides a flexible data structure for managing protein
structural data. The
[Structure](http://www.biojava.org/docs/api/org/biojava/bio/structure/Structure.html)
class is the main container.

A Structure has a hierarchy of sub-objects:

    Structure
       |
       Model(s)
            |
            Chain(s)
                |
                 Group(s)
                     |
                     Atom(s)

Different ways are provided how to access the data contained in a
[Structure](http://www.biojava.org/docs/api/org/biojava/bio/structure/Structure.html).
If you want to directly access an array of
[Atoms](http://www.biojava.org/docs/api/org/biojava/bio/structure/Atom.html)
you can use the
[StructureTools](http://www.biojava.org/docs/api/org/biojava/bio/structure/StructureTools.html)

```java

// get all Calpha atoms in the structure Atom[] caAtoms =
StructureTools.getAtomArray(structure,new String[] {"CA"});

```

Another possibility is to use one of the iterators to iterate over
[Atoms](http://www.biojava.org/docs/api/org/biojava/bio/structure/Atom.html)
or
[Groups](http://www.biojava.org/docs/api/org/biojava/bio/structure/Group.html).

```java public static int getNrAtoms(Structure s){

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

```

```java

`       AtomIterator iter = new AtomIterator(structure) ;`  
`       while (iter.hasNext()) {`  
`           Atom atom = (Atom) iter.next() ;`  
`           Calc.rotate(atom,rotationmatrix);`  
`       }`

```

Next: <BioJava:CookBook:PDB:atomsCalc> - How to do calculations on
atoms.
