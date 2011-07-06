---
title: BioJava:CookBook:AAPROP:xmlfiles
---

### How should I define the XML files to customize mass of Amino Acids in the computation of Molecular Weight?

There are two XML files which you would need to define in order to
customize mass of Amino Acids.

1) ElementMass - This file should define the name and mass of elements
and isotopes.

2) AminoAcidComposition - This file should define all the elements and
isotopes that are contained for each Amino Acid.

### Required Attributes in XML files

-   AminoAcidComposition
    -   "symbol" - Single character and case-insensitive but must not be
        repeated.
    -   "name" - Case-sensitive and must be defined in the ElementMass
        XML file.
    -   "count" - Must be greater than 0.

<!-- -->

-   ElementMass

### Standard

For ease of use, the <b>standard</b> mass of elements and isotopes are
already saved in
[ElementMass.xml](BioJava:CookBook:AAPROP:ElementMass.xml "wikilink").  
Likewise, the <b>standard</b> composition of amino acids are also stored
in
[AminoAcidComposition.xml](BioJava:CookBook:AAPROP:AminoAcidComposition.xml "wikilink").

### Minimum

Also, for ease of understanding and manipulation, we have also defined
another two files which are the <b>minimum</b> requirements for the
above two files.  
[MinElementMass.xml](BioJava:CookBook:AAPROP:MinElementMass.xml "wikilink")
and
[MinAminoAcidComposition.xml](BioJava:CookBook:AAPROP:MinAminoAcidComposition.xml "wikilink").
