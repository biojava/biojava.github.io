---
title: BioJava:Cookbook:Alphabets:Cononical
permalink: wiki/BioJava%3ACookbook%3AAlphabets%3ACononical
---

How can I tell if two Symbols or Alphabets are equal?
-----------------------------------------------------

In Biojava the same
[Alphabets](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Alphabet.html)
and the same
[Symbols](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Symbol.html)
are canonical no matter how they were constructed or where they came
from. This means that if two [DNA](wp:DNA "wikilink") alphabets (or
[Symbols](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Symbol.html)
from those alphabets) are instantiated at different times are equal via
both the .equals() and == functions. Also Symbols from the PROTEIN and
the PROTEIN-TERM alphabets are canonical as are Symbols from the
[IntegerAlphabet](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/IntegerAlphabet.html)
and the
[SubIntegerAlphabet](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/IntegerAlphabet.SubIntegerAlphabet.html).

This is even true of
[Alphabets](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Alphabet.html)
and
[Symbols](http://www.biojava.org/docs/api1.8/org/biojava/bio/symbol/Symbol.html)
on different virtual machines (thanks to some
[Serialization](http://java.sun.com/j2se/1.4.2/docs/api/java/io/Serializable.html)
magic) which means BioJava works across RMI.

```java import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class Canonical {

` public static void main(String[] args) {`

`   //get the DNA alphabet two ways`  
`   Alphabet a1 = DNATools.getDNA();`  
`   Alphabet a2 = AlphabetManager.alphabetForName("DNA");`

`   //are they equal`  
`   System.out.println("equal: "+ a1.equals(a2));`  
`   //are they canonical`  
`   System.out.println("canonical: "+ (a1 == a2));`  
` }`

} ```
