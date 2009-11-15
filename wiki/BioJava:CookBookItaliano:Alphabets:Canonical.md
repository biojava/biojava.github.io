---
title: BioJava:CookBookItaliano:Alphabets:Canonical
---

Come posso stabilire l'identità fra Simboli e Alfabeti?
-------------------------------------------------------

In Biojava medesimi
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
e medesimi
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
sono gli stessi oggetti anche se sono stati creati in maniera diversa.
Questo significa che se due alfabeti [DNA](wp:DNA "wikilink") (o due
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
di questi due alfabeti) sono istanziati in tempi differenti essi sono lo
stesso oggetto ed è possibile verificarlo utilizzando sia l'operatore ==
che il metodo .equal(). Anche i simboli del PROTEIN-ALPHABET e del
PROTEIN-TERM-ALPHABET sono gli stessi, così come lo sono quelli che
appartengono al
[IntegerAlphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/IntegerAlphabet.html)
e al
[SubIntegerAlphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/IntegerAlphabet.SubIntegerAlphabet.html).

Questo è vero anche per
[Alfabeti](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
e
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
su differenti virtual machine (un ringraziamento speciale va a
[Serialization](http://java.sun.com/j2se/1.4.2/docs/api/java/io/Serializable.html))
cioè BioJava funziona anche sfruttando l'RMI.

<java> package biojava\_in\_anger;

import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class Canonical {

` public static void main(String[] args) {`

`   //get the DNA alphabet two ways`  
`   Alphabet a1 = DNATools.getDNA();`  
`   Alphabet a2 = AlphabetManager.alphabetForName("DNA");`

`   //sono identici`  
`   System.out.println("equal: "+ a1.equals(a2));`  
`   //sono canonici`  
`   System.out.println("canonical: "+ (a1 == a2));`  
` }`

} </java>
