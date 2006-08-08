---
title: BioJava:CookbookPortuguese:Alphabets:CrossProduct
---

Como crio um CrossProductAlphabet, por exemplo, um alfabeto de codons
---------------------------------------------------------------------

Um *CrossProductAlphabets* resulta da multiplicação de outros
*Alphabet*s. Eles são usados para transformar 2 ou mais *Symbol*s em um
único *Symbol* "cross product".

Por exemplo:

Utilizando 3 [DNA](wp:DNA "wikilink") alphabet you could wrap a
[codon](wp:codon "wikilink") as a
[Simbolo](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Voce pode then count those [codon](wp:codon "wikilink")
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
in a
[Count](http://www.biojava.org/docs/api14/org/biojava/bio/dist/Count.html)
or you could used them in a
[Distribution](http://www.biojava.org/docs/api14/org/biojava/bio/dist/Distribution.html).

CrossProductAlphabets can be created by name (if the component
[Alphabets](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
are registered in the
[AlphabetManager](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AlphabetManager.html))
or by making a list of the desired
[Alphabets](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
and creating the
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
from the
[List](http://java.sun.com/j2se/1.4.2/docs/api/java/util/List.html).
Both approaches are shown in the example below.

<java> import java.util.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.symbol.\*;

public class CrossProduct {

` public static void main(String[] args) {`

`   //cria uma CrossProductAlphabet de uma Lista`  
`   List l = Collections.nCopies(3, DNATools.getDNA());`  
`   Alphabet codon = AlphabetManager.getCrossProductAlphabet(l);`

`   //pega o mesmo Alfabeto pelo nome`  
`   Alphabet codon2 =`  
`       AlphabetManager.generateCrossProductAlphaFromName("(DNA x DNA x DNA)");`

`   //exibe se os dois alfabetos são canonical`  
`   System.out.println(codon == codon2);`  
` }`

} </java>
