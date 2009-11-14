---
title: BioJava:CookBookItaliano:Alphabets:Component
---

Come posso ottenere How do I break Symbols from CrossProductAlphabets into their component Symbols?
---------------------------------------------------------------------------------------------------

I
[CrossProductAlphabets](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
sono utilizzati per rappresentare gruppi di
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
come un singolo simbolo. Questo è molto utile per trattare oggeti come i
codoni come singoli
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
A volte comunque è necessario riconvertire i
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
nei suoi
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
originali. Mostriamo come questo può essere fatto.

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
follow this link.

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
