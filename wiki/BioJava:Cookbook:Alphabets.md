---
title: BioJava:Cookbook:Alphabets
---

How do I get a DNA, RNA or Protein Alphabet?
--------------------------------------------

In BioJava
[Alphabets](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Alphabet.html)
are collections of
[Symbols](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Symbol.html).
Common biological alphabets ([DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink"), [protein](wp:protein "wikilink"), etc) are
registered with the BioJava
[AlphabetManager](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/AlphabetManager.html)
at startup and can be accessed by name. The [DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink") and [protein](wp:protein "wikilink") alphabets
can also be accessed using convenient static methods from
[DNATools](http://www.biojava.org/docs/api1.8/org/biojava/bio/seq/DNATools.html),
[RNATools](http://www.biojava.org/docs/api1.8/org/biojava/bio/seq/RNATools.html)
and
[ProteinTools](http://www.biojava.org/docs/api1.8/org/biojava/bio/seq/ProteinTools.html)
respectively.

Both of these approaches are shown in the example below

<java> package biojava\_in\_anger;

import org.biojava.bio.symbol.\*; import java.util.\*; import
org.biojava.bio.seq.\*;

public class AlphabetExample {

` public static void main(String[] args) {`  
`           Alphabet dna, rna, prot, proteinterm;`  
`    `  
`       //get the DNA alphabet by name`  
`       dna = AlphabetManager.alphabetForName("DNA");`  
`    `  
`       //get the RNA alphabet by name`  
`       rna = AlphabetManager.alphabetForName("RNA");`  
`    `  
`       //get the Protein alphabet by name`  
`       prot = AlphabetManager.alphabetForName("PROTEIN");`

`       //get the protein alphabet that includes the * termination Symbol`  
`       proteinterm = AlphabetManager.alphabetForName("PROTEIN-TERM");`  
`    `  
`       //get those same Alphabets from the Tools classes`  
`       dna = DNATools.getDNA();`  
`       rna = RNATools.getRNA();`  
`       prot = ProteinTools.getAlphabet();`  
`       //or the one with the * symbol`  
`       proteinterm = ProteinTools.getTAlphabet();`

` }`

} </java>
