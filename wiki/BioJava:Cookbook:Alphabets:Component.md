---
title: BioJava:Cookbook:Alphabets:Component
---

How do I break Symbols from CrossProductAlphabets into their component Symbols?
-------------------------------------------------------------------------------

[CrossProductAlphabets](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are used to represent groups of
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
as a single Symbol. This is very useful for treating things like codons
as single
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
Sometimes however, you might want to covert the
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
back into their component
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
The following recipe demonstrates how this can be done.

The
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
from a
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are implementations of the
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
interface. The prefix 'Atomic' suggests that the
[Symbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
cannot be divided so one might ask, 'how can an indivisible Symbol be
divided into it's component parts?'. The full definition of the
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
is that it cannot be divided into a simpler Symbol that is still part of
the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
The component parts of an
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
from a
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
are not members of the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
so the 'Atomic' definition still stands. A [codon](wp:codon "wikilink")
would be from the (DNA x DNA x DNA) Alphabet whereas the components of
the [codon](wp:codon "wikilink")
[Symbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
are from the DNA alphabet.

Contrast this with the definition of a
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html).
A
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
can be validly divided into components that are still part of the same
[Alphabet](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
In this way a
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
can be ambiguous. For further discussion of
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
follow this
[link](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html).

<java> package biojava\_in\_anger;

import java.util.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.symbol.\*;

public class BreakingComponents {

` public static void main(String[] args) {`  
`   //make the 'codon' alphabet`  
`   List l = Collections.nCopies(3, DNATools.getDNA());`  
`   Alphabet alpha = AlphabetManager.getCrossProductAlphabet(l);`

`   //get the first symbol in the alphabet`  
`   Iterator iter = ((FiniteAlphabet)alpha).iterator();`  
`   AtomicSymbol codon = (AtomicSymbol)iter.next();`  
`   System.out.print(codon.getName()+" is made of: ");`

`   //break it into a list its components`  
`   List symbols = codon.getSymbols();`  
`   for(int i = 0; i < symbols.size(); i++){`  
`     if(i != 0)`  
`       System.out.print(", ");`  
`     Symbol sym = (Symbol)symbols.get(i);`  
`     System.out.print(sym.getName());`  
`   }`  
` }`

} </java>
