---
title: BioJava:CookBookItaliano:Alphabets:Component
---

Come posso dividere i Simboli di un CrossProductAlphabets i maniera tale da recuperare i Simboli che li compongo?
-----------------------------------------------------------------------------------------------------------------

I
[CrossProductAlphabets](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")
sono utilizzati per rappresentare gruppi di
[Simboli](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
come se fossero uno solo. Questo è molto utile per trattare oggeti come
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
dividere qualcosa che è indivisibile?'. La definzione completa di
[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html)
ci dice precisamente che esso non può essere diviso in un Simbolo più
semplice che fa parte dello stesso
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
di cui fa parte
l'[AtomicSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/AtomicSymbol.html).

Ciò va in contrasto con la definizione di
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
perchè: un
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
invece può essere diviso in simboli che fanno parte dello stesso
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html).
Per ciò i
[BasisSymbols](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
si comportano diversamente. Per ulteriori chiarimenti sui
[BasisSymbol](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html)
seguire questo
[link](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/BasisSymbol.html).

<java> package biojava\_in\_anger;

import java.util.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.symbol.\*;

public class BreakingComponents {

` public static void main(String[] args) {`  
`   //creo 'codon' alphabet a partire da una lista `  
`   List l = Collections.nCopies(3, DNATools.getDNA());`  
`   Alphabet alpha = AlphabetManager.getCrossProductAlphabet(l);`

`   //prendo il primo elemento dell'alfabeto`  
`   Iterator iter = ((FiniteAlphabet)alpha).iterator();`  
`   AtomicSymbol codon = (AtomicSymbol)iter.next();`  
`   System.out.print(codon.getName()+" is made of: ");`

`   //vediamo come è formato`  
`   List symbols = codon.getSymbols();`  
`   for(int i = 0; i < symbols.size(); i++){`  
`     if(i != 0)`  
`       System.out.print(", ");`  
`     Symbol sym = (Symbol)symbols.get(i);`  
`     System.out.print(sym.getName());`  
`   }`  
` }`

} </java>
