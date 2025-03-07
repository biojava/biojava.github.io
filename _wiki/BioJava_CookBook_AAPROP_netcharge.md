---
title: BioJava:CookBook:AAPROP:netcharge
permalink: wiki/BioJava%3ACookBook%3AAAPROP%3Anetcharge
---

### How is Net Charge computed?

The Net Charge of a protein sequence at a certain pH is computed using
the following formulae.

![](NetChargeFormulae.png "NetChargeFormulae.png")

In BioJava, the default pH used is 7.0.

pKa values used can be chosen between the following two sources with
ExPASy being the default one.

1) ExPASy - ProtParam [1](http://web.expasy.org/protparam/)

OR

2) A.Lehninger, Principles of Biochemistry, 4th Edition (2005), Chapter
3, page 78, Table 3-1.
[2](http://www.innovagen.se/custom-peptide-synthesis/peptide-property-calculator/peptide-property-calculator.asp)
