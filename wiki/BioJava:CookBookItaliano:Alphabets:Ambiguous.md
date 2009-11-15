---
title: BioJava:CookBookItaliano:Alphabets:Ambiguous
---

How can I make an ambiguous Symbol like Y or R?
-----------------------------------------------

The IBU defines standard codes for symbols that are ambiguous such as Y
to indicate C or T and R to indicate G or C or N to indicate any
nucleotide. BioJava represents these Symbols as BasisSymbols.
BasisSymbol objects can contain one or more component Symbols that are
valid members of the same Alphabet as the BasisSymbol and are therefore
capable of being ambiguous.

Generally an ambiguity Symbol is retrieved by calling the
getAmbiguity(Set symbols) method from the Alphabet that the Symbol is
intended to come from. In the case of making the Symbol Y the set
'symbols' used as an argument will contain the DNA Alphabet Symbols 'C'
and 'T'.

<java> package biojava\_in\_anger;

import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*; import
java.util.\*;

public class Ambiguity {

` public static void main(String[] args) {`  
`   try {`  
`     //get the DNA Alphabet`  
`     Alphabet dna = DNATools.getDNA();`

`     //make the 'Y' symbol`  
`     Set symbolsThatMakeY = new HashSet();`  
`     symbolsThatMakeY.add(DNATools.c());`  
`     symbolsThatMakeY.add(DNATools.t());`  
`     Symbol y = dna.getAmbiguity(symbolsThatMakeY);`

`     //print information about 'Y' basis Symbol`  
`     System.out.println("Formal name of 'Y' is: "+y.getName());`  
`     System.out.println("Class type of 'Y' is: "+y.getClass().getName());`

`     //break the Y BasisSymbol into its component AtomicSymbols`  
`     Alphabet matches = y.getMatches();`  
`     System.out.print("The 'Y' Symbol is made of: ");`

`     //we know that there will be a finite set of matches so its ok to cast it`  
`     for(Iterator i = ((FiniteAlphabet)matches).iterator(); i.hasNext();){`  
`       Symbol sym = (Symbol)i.next();`  
`       System.out.print(sym.getName());`  
`       if(i.hasNext())`  
`         System.out.print(", ");`  
`     }`

`   }`  
`   catch (IllegalSymbolException ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
