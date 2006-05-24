---
title: BioJava:CookbookPortuguese:Alphabets
---

How do I get a DNA, RNA or Protein Alphabet?
--------------------------------------------

Em BioJava
[Alfabetos](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
são coleções de
[Símbolos](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Common biological alphabets ([DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink"), [protein](wp:protein "wikilink"), etc) are
registered with the BioJava
[AlphabetManager](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AlphabetManager.html)
at startup and can be accessed by name. The [DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink") and [protein](wp:protein "wikilink") alphabets
can also be accessed using convenient static methods from
[DNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/DNATools.html),
[RNATools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/RNATools.html)
e
respectivamente[ProteinTools](http://www.biojava.org/docs/api14/org/biojava/bio/seq/ProteinTools.html).

Ambas abordagens são apresentadas no exemplo abaixo:

<java> import org.biojava.bio.symbol.\*; import java.util.\*; import
org.biojava.bio.seq.\*;

public class AlphabetExample {

` public static void main(String[] args) {`  
`   Alphabet dna, rna, prot;`

`   //pega o alfabeto do DNA pelo nome`  
`   dna = AlphabetManager.alphabetForName("DNA");`

`   //pega o alfabeto do RNA pelo nome`  
`   rna = AlphabetManager.alphabetForName("RNA");`

`   //pega o alfabeto da Proteina prlo nome`  
`   prot = AlphabetManager.alphabetForName("PROTEIN");`  
`   //pega o alfabeto da proteina que inclui o terminador *     `  
`   prot = AlphabetManager.alphabetForName("PROTEIN-TERM");`

`   //get those same Alphabets from the Tools classes`  
`   dna = DNATools.getDNA();`  
`   rna = RNATools.getRNA();`  
`   prot = ProteinTools.getAlphabet();`  
`   //or the one with the * symbol`  
`   prot = ProteinTools.getTAlphabet();`  
` }`

} </java>
