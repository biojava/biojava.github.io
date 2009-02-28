---
title: BioJava:CookBook:PDB:atomsCalc
---

### How can I do calculations with Atoms?

The
[Calc](http://www.biojava.org/docs/api/org/biojava/bio/structure/Calc.html)
class provides a set of methods that can be used for calculations.

<java> public double getPhi(Group a, Group b)

`   throws StructureException`  
`   {`  
`       `  
`       if ( ! Calc.isConnected(a,b)){`  
`           throw new StructureException("can not calc Phi - AminoAcids are not connected!") ;`  
`       } `  
`       `  
`       Atom a_C  = a.getAtom("C");`  
`       Atom b_N  = b.getAtom("N");`  
`       Atom b_CA = b.getAtom("CA");`  
`       Atom b_C  = b.getAtom("C");`  
`       `  
`       double phi = Calc.torsionAngle(a_C,b_N,b_CA,b_C);`  
`       return phi ;`  
`   }`

</java>

BioJava contains a protein structure superimposition algorithm that is
implemented using the BioJava structure API. To learn more about
aligning protein structures go to <BioJava:CookBook:PDB:align>

Next: <BioJava:CookBook:PDB:groups> - How to work with Groups
(AminoAcids,Nucleotides, Hetatom)
