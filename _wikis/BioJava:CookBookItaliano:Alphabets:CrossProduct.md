---
title: BioJava:CookBookItaliano:Alphabets:CrossProduct
---

Come posso creare un CrossProductAlphabet come ad esempio un alfabeto di codoni
-------------------------------------------------------------------------------

Un CrossProductAlphabet è il risultato della moltiplicazione di
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
fra di loro. I CrossProductAlphabets sono utilizzati per racchiudere 2 o
più
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
I CrossProductAlphabets possono essere creati tramite un nome [purchè
gli
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
siano stati registrati all'interno
dell'[AlphabetManager](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AlphabetManager.html))
o creando una nuova lista di
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
e creando un
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
a partire da una
[List](http://java.sun.com/j2se/1.4.2/docs/api/java/util/List.html).
Entrambi i metodi sono mostrati nell'esempio seguente.

<java> import java.util.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.symbol.\*;

public class CrossProduct {

` public static void main(String[] args) {`

`   //creo un CrossProductAlphabet a partire da una lista`  
`   List l = Collections.nCopies(3, DNATools.getDNA());`  
`   Alphabet codon = AlphabetManager.getCrossProductAlphabet(l);`

`   //ottengo lo stesso alfabeto a partire dal nome`  
`   Alphabet codon2 =`  
`       AlphabetManager.generateCrossProductAlphaFromName("(DNA x DNA x DNA)");`

`   //mostriamo che i due alfabeti sono identici`  
`   System.out.println(codon == codon2);`  
` }`

} </java>
