---
title: BioJava:CookBook:AAPROP:averagehydropathyvalue
---

### How is Average Hydropathy computed?

It is computed simply by the sum of hydrophobicity of individual amino
acid divide by the length of the protein sequence (exclusive of
non-standard amino acid characters).  
Hydrophobicity values of individual amino acids can be found
[here](http://web.expasy.org/protscale/pscale/Hphob.Doolittle.html).

Note: If a character in the protein sequence is not of the 20 standard
amino acid, it will not be included in the computation. i.e. the length
will also be adjusted such that only standard amino acid characters are
considered.
