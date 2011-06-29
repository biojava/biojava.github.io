---
title: BioJava:CookBook:AAPROP:main
---

### How can I compute physiochemical properties?

BioJava provides a set of APIs to generate some commonly used
physiochemical properties. They are

-   [Molecular
    Weight](http://biojava.org/wiki/BioJava:CookBook:AAPROP:molecularweight)
-   [Absorbance](http://biojava.org/wiki/BioJava:CookBook:AAPROP:absorbanceandextinctioncoefficient)
-   [Extinction
    Coefficient](http://biojava.org/wiki/BioJava:CookBook:AAPROP:absorbanceandextinctioncoefficient)
-   [Instability
    Index](http://biojava.org/wiki/BioJava:CookBook:AAPROP:instabilityindex)
-   [Apliphatic
    Index](http://biojava.org/wiki/BioJava:CookBook:AAPROP:apliphaticindex)
-   [Average Hydropathy
    Value](http://biojava.org/wiki/BioJava:CookBook:AAPROP:averagehydropathyvalue)
-   [Isoelectric
    Point](http://biojava.org/wiki/BioJava:CookBook:AAPROP:isoelectricpoint)
-   [Net Charge at pH
    7](http://biojava.org/wiki/BioJava:CookBook:AAPROP:netcharge)
-   Composition of specified amino acid
-   Composition of the 20 standard amino acid

The class providing the core functionality for this is the
IPeptideProperties class.

Short Example 1: Computing molecular weight using default values
----------------------------------------------------------------

<java> String sequence =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
System.out.println(PeptideProperties.getMolecularWeight(sequence));
</java>

Short Example 2: Computing molecular weight using user-defined values via XML
-----------------------------------------------------------------------------

<java> String sequence =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
File elementMassFile = new File("./src/main/resources/ElementMass.xml");
File aminoAcidCompositionFile = new
File("./src/main/resources/AminoAcidComposition.xml");
System.out.println(PeptideProperties.getMolecularWeight(sequence,
elementMassFile, aminoAcidCompositionFile)); </java>

Short Example 3: Computing molecular weight for multiple sequences via XML
--------------------------------------------------------------------------

<java> String[] sequences = new String[3]; sequences[0] =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
sequences[1] =
"KMKILELPFASGDLSMLVLLPDEVSDLERIEKTINFEKLTEWTNPNTMEKRRVKVYLPQMKIEEKYNLTS";
sequences[2] =
"VLMALGMTDLFIPSANLTGISSAESLKISQAVHGAFMELSEDGIEMAGSTGVIEDIKHSPESEQFRADHP";

File elementMassFile = new File("./src/main/resources/ElementMass.xml");
File aminoAcidCompositionFile = new
File("./src/main/resources/AminoAcidComposition.xml");
AminoAcidCompositionTable table =
PeptideProperties.obtainAminoAcidCompositionTable(elementMassFile,
aminoAcidCompositionFile);

for(String sequence:sequences){

`   System.out.println(PeptideProperties.getMolecularWeightBasedOnXML(sequence, table));`

} </java>
