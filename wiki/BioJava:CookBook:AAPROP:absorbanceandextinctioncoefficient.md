---
title: BioJava:CookBook:AAPROP:absorbanceandextinctioncoefficient
---

### How are Absorbance and Extinction Coefficient computed?

Extinction Coefficient
----------------------

Extinct(Prot) = (Tyr count)\*Ext(Tyr) + (Trp count)\*Ext(Trp) + (Cys
count)\*Ext(Cys) where Ext(Tyr) = 1490, Ext(Trp) = 5500, Ext(Cys) = 125

Absorbance
----------

Absorb(Prot) = Extinct(Prot) / Molecular\_Weight

There is a boolean parameter to be set - assumeCysReduced.  
If assumeCysReduced is set to true, (Cys count) will always be 0.  
If assumeCysReduced is set to false, Every pair of Cystine will be
counted as 1.  
This approach is based on
[here](http://web.expasy.org/protparam/protparam-doc.html).
