---
title: BioJava:CookBookItaliano:Alphabets:Component
---

Come posso recuperare le componenti How do I break Symbols from CrossProductAlphabets into their component Symbols?
-------------------------------------------------------------------------------------------------------------------

I
[CrossProductAlphabets](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
sono utilizzati per rappresentare gruppi di
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
come se ne fosse uno solo. Questo è molto utile per trattare oggeti come
i codoni come se fossero singoli
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html).
A volte comunque è necessario riconvertire i
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
nelle loro componenti originali. Mostriamo come questo può essere
ottenuto.

I
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
di un
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
sono implementazioni della interfaccia
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html).
Il prefisso 'Atomico' suggerisce che i
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
non possano essere divisi, perciò uno si può domandare:'come posso
dividere qualcosa che è indivisibile'. La definzione completa
dell'[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
è che non può essere diviso in un Simbolo più semplice che è parte dello
stesso
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
Per questo motivo la definzione di 'Atomic' stabilisce che gli
[AtomicSymbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
di un
[CrossProductAlphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
non fanno parte dello stesso
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).

A [codon](wp:codon "wikilink") would be from the (DNA x DNA x DNA)
Alphabet whereas the components of the [codon](wp:codon "wikilink")
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
