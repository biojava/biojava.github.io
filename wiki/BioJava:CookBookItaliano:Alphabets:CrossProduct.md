---
title: BioJava:CookBookItaliano:Alphabets:CrossProduct
---

Come posso creare un CrossProductAlphabet come ad esempio un alfabeto di codoni
-------------------------------------------------------------------------------

Un CrossProductAlphabet è il risultato della moltiplicazione di altri
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
I CrossProductAlphabets sono utilizzati per racchiudere 2 o più
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
all'interno di un singolo "cross product" da considerarsi come un unico
[Simbolo](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Ad esempio utilizzando un cross a 3 vie dell'alfabeto del
[DNA](wp:DNA "wikilink") è possibile racchiudere un
[codone](wp:codon "wikilink") come un
[Simbolo](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)(ad
esempio un alfabeto di triplette). E' possibile poi contare i
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
relativi ai [codoni](wp:codon "wikilink") in un
[Count](http://www.biojava.org/docs/api14/org/biojava/bio/dist/Count.html)
o è possibile utilizzarli in una
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

`   //make a CrossProductAlphabet from a List`  
`   List l = Collections.nCopies(3, DNATools.getDNA());`  
`   Alphabet codon = AlphabetManager.getCrossProductAlphabet(l);`

`   //get the same Alphabet by name`  
`   Alphabet codon2 =`  
`       AlphabetManager.generateCrossProductAlphaFromName("(DNA x DNA x DNA)");`

`   //show that the two Alphabets are canonical`  
`   System.out.println(codon == codon2);`  
` }`

} </java>
