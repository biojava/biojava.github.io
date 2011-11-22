---
title: BioJava:CookBook:AAPROP:netcharge
---

### How is Net Charge computed?

The Net Charge of a protein sequence at a certain pH is computed using
the following formulae.

![](NetChargeFormulae.png "NetChargeFormulae.png")

In BioJava, the default pH used is 7.0.

pKa values used can be chosen between the following two websites with
ExPASy being the default one.

1) ExPASy - ProtParam [1](http://web.expasy.org/protparam/)

OR

2) Innovagen -
[2](http://www.innovagen.se/custom-peptide-synthesis/peptide-property-calculator/peptide-property-calculator-notes.asp#PI).  
Do note that the pKa values referenced by Innovagen are based on
Lehninger Principles of Biochemistry, Third Edition.  
Currently in the process of updating to 4th Edition.  

