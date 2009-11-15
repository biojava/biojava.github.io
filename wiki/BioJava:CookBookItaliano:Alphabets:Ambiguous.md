---
title: BioJava:CookBookItaliano:Alphabets:Ambiguous
---

Come posso costruire simboli ambigui come Y o R?
------------------------------------------------

L'IBU stabilisce una codifica standard per i simboli che sono ambigui
come ad esempio Y per indicare C o T, R per indicare G o C o N per
indicare qualsiasi nucleotide. Biojava rappresenta questi simboli come
BasisSymbols. Una istanza di un BasisSymbol può contenere uno o più
componenti Symbol, queste istanze possono far parte di un Alfabeto come
Simboli avendo però la capacità di essere ambigui (rappresentano più
valori). Generalmente un simbolo ambiguo è ottenuto chiamato il metodo
getAmbiguity(Set symbols) della classe Alphabet da cui proviene il
simbolo. Nel caso si voglia costruire il simbolo Y bisognerà utilizzare
un set di simboli che conterrà i simboli C e T dell'alfabeto DNA.

<java> package biojava\_in\_anger;

import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*; import
java.util.\*;

public class Ambiguity {

` public static void main(String[] args) {`  
`   try {`  
`     //prendo L'alfabeto del DNA`  
`     Alphabet dna = DNATools.getDNA();`

`     //creo il simbolo Y`  
`     Set symbolsThatMakeY = new HashSet();`  
`     symbolsThatMakeY.add(DNATools.c());`  
`     symbolsThatMakeY.add(DNATools.t());`  
`     Symbol y = dna.getAmbiguity(symbolsThatMakeY);`

`     //stampo le informazioni riguardanti il sibolo di base Y`  
`     System.out.println("Formal name of 'Y' is: "+y.getName());`  
`     System.out.println("Class type of 'Y' is: "+y.getClass().getName());`

`     //divido il BasisSymbol Y nei suoi componenti AtomicSymbols`  
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
