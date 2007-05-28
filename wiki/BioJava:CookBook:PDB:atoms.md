---
title: BioJava:CookBook:PDB:atoms
---

### How can I access the atoms in a structure?

If you want an array of Atoms you can do something like this:

<java> Atom[] caAtoms = StructureTools.getAtomArray(structure,"CA");
</java>

The Structure object has a hierarchy of sub-objects:

    Structure
            |
            Chain(s)
                |
                 Group(s)
                     |
                     Atom(s)

Different Iterators allow you to iterate over Atoms or all Groups.

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

<java>

`       AtomIterator iter = new AtomIterator(structure) ;`  
`       while (iter.hasNext()) {`  
`           Atom atom = (Atom) iter.next() ;`  
`           Calc.rotate(atom,rotationmatrix);`  
`       }`

</java>
