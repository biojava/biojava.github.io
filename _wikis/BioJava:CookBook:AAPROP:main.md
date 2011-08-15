---
title: BioJava:CookBook:AAPROP:main
---

### How can I compute physico-chemical properties via APIs?

BioJava provides a set of APIs to generate some commonly used
physiochemical properties. They are

-   [Molecular
    Weight](http://biojava.org/wiki/BioJava:CookBook:AAPROP:molecularweight)
    (See also: [How to define the XML files to customize mass of Amino
    Acids in the computation of Molecular
    Weight?](BioJava:CookBook:AAPROP:xmlfiles "wikilink"))
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
boolean ignoreCase = true; System.out.println("Molecular Weight: " +
PeptideProperties.getMolecularWeight(sequence, ignoreCase)); </java>

Short Example 2: Computing molecular weight using user-defined values
---------------------------------------------------------------------

<java> String sequence =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
File elementMassFile = new File("./src/main/resources/ElementMass.xml");
File aminoAcidCompositionFile = new
File("./src/main/resources/AminoAcidComposition.xml"); boolean
ignoreCase = true; System.out.println("Molecular Weight: " +
PeptideProperties.getMolecularWeight(sequence, elementMassFile,
aminoAcidCompositionFile, ignoreCase)); </java>

(See also: [How to define the XML files to customize mass of Amino Acids
in the computation of Molecular
Weight?](BioJava:CookBook:AAPROP:xmlfiles "wikilink"))

Short Example 3: Computing molecular weight for multiple sequences
------------------------------------------------------------------

<java> String[] sequences = new String[3]; sequences[0] =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
sequences[1] =
"KMKILELPFASGDLSMLVLLPDEVSDLERIEKTINFEKLTEWTNPNTMEKRRVKVYLPQMKIEEKYNLTS";
sequences[2] =
"VLMALGMTDLFIPSANLTGISSAESLKISQAVHGAFMELSEDGIEMAGSTGVIEDIKHSPESEQFRADHP";

File elementMassFile = new File("./src/main/resources/ElementMass.xml");
File aminoAcidCompositionFile = new
File("./src/main/resources/AminoAcidComposition.xml"); boolean
ignoreCase = true; AminoAcidCompositionTable table =
PeptideProperties.obtainAminoAcidCompositionTable(elementMassFile,
aminoAcidCompositionFile, ignoreCase);

//The difference between this example and short example 2 is that the
elementMassFile and aminoAcidCompositionFile will be only parsed once
//and stored in AminoAcidCompositionTable for quick and easy reuse in
the computation of multiple sequences. for(String sequence:sequences){

`   System.out.println("Molecular Weight: " + PeptideProperties.getMolecularWeightBasedOnXML(sequence, table, ignoreCase));`

} </java>

Short Example 4: Computing composition of protein sequence
----------------------------------------------------------

<java> String sequence =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTREMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
boolean ignoreCase = true;

//Enrichment of a specific amino acid type
System.out.println("Composition of A: " +
PeptideProperties.getEnrichment(sequence, "A", ignoreCase));

//Enrichment of a list of amino acid types Map<String, Double>
composition = PeptideProperties.getAACompositionString(sequence,
ignoreCase); for(String aa:composition.keySet()){

`   System.out.println("Composition of " + aa + ": " + composition.get(aa));`

} </java>

Short Example 5: Computing of all other physico-chemical properties
-------------------------------------------------------------------

<java> String sequence =
"QIKDLLVSSSTDLDTTLVLVNAIYFKGMWKTAFNAEDTRECMPFHVTKQESKPVQMMCMNNSFNVATLPAE";
boolean ignoreCase = true;

//Absorbance System.out.println("Absorbance (Cys Reduced): " +
PeptideProperties.getAbsorbance(sequence, true, ignoreCase));
System.out.println("Absorbance (Cys Not Reduced): " +
PeptideProperties.getAbsorbance(sequence, false, ignoreCase));

//Extinction Coefficient System.out.println("Extinction Coefficient (Cys
Reduced): " + PeptideProperties.getExtinctionCoefficient(sequence, true,
ignoreCase)); System.out.println("Extinction Coefficient (Cys Not
Reduced): " + PeptideProperties.getExtinctionCoefficient(sequence,
false, ignoreCase));

//Instability Index System.out.println("Instability Index: " +
PeptideProperties.getInstabilityIndex(sequence, ignoreCase));

//Apliphatic Index System.out.println("Apliphatic Index: " +
PeptideProperties.getApliphaticIndex(sequence, ignoreCase));

//Average Hydropathy Value System.out.println("Average Hydropathy Value:
" + PeptideProperties.getAvgHydropathy(sequence, ignoreCase));

//Isoelectric Point System.out.println("Isoelectric Point: " +
PeptideProperties.getIsoelectricPoint(sequence, ignoreCase));

//Net Charge System.out.println("Net Charge at pH 7: " +
PeptideProperties.getNetCharge(sequence, ignoreCase)); </java>
