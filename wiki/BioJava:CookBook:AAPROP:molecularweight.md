---
title: BioJava:CookBook:AAPROP:molecularweight
---

### How is Molecular Weight computed?

Molecular Weight is computed as the sum of the mass of each amino acid
plus a water molecule.  
The mass of the water molecule is 17.0073(OH) + 1.0079(H).  
The default mass of each amino acid is using the average mass from table
2 of this [website](http://web.expasy.org/findmod/findmod_masses.html).

More advance users who would like to define the mass of each amino acid
can do so via XML files.  
For more details, please check out the examples given
[here](http://biojava.org/wiki/BioJava:CookBook:AAPROP:main).
