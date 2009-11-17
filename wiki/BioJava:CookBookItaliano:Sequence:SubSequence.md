---
title: BioJava:CookBookItaliano:Sequence:SubSequence
---

Come posso ottenere una parte di una Sequenza?
----------------------------------------------

In genere data una sequenza noi potremmo essere solamente interessati ad
esaminare o le prime 10 basi o una regione compresa fra 2 punti. Quindi
si ha ha necessità di stampare una sotto-sequenza su un OutputStream
come lo StdOut, come è possibile fare ciò?

Biojava utilizza un sistema di coordinate biologiche per identificare le
basi. La prima base ha indice 1 e l'ultima ha indice uguale alla
lunghezza totale della sequenza; a differenza degli indici assegnati ai
caratteri di una stringa che partono da 0 fino a (lunghezza totale - 1).
Se si cerca di accedere ad una regione al di fuori di (1..lunghezza
totale) viene sollevata una eccezione di tipo IndexOutOfBoundsException.

### Ottenere una Sub - Sequence

<java>

`   SymbolList symL = null;`

`   //codice per generare una SymbolList`

`   //prendo il primo simbolo`  
`   Symbol sym = symL.symbolAt(1);`

`   //le prime tre basi`  
`   SymbolList symL2 = symL.subList(1,3);`

`   //le ultime tre basi`  
`   SymbolList symL3 = symL.subList(symL.length() - 3, symL.length());`

</java>

### Stampa una Sub - Sequence

<java>

`   //stampo le ultime tre basi di una SymbolList o di una Sequence`  
`   String s = symL.subStr(symL.length() - 3, symL.length());`  
`   System.out.println(s);`

</java>

### Codice completo

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class SubSequencing {

` public static void main(String[] args) {`  
`   SymbolList symL = null;`

`   //creo una RNA SymbolList`  
`   try {`  
`     symL = RNATools.createRNA("auggcaccguccagauu");`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     ex.printStackTrace();`  
`   }`

`   //prendo il primo simbolo`  
`   Symbol sym = symL.symbolAt(1);`

`   //prendo le prime tre basi`  
`   SymbolList symL2 = symL.subList(1,3);`

`   //prendo le ultime tre basi`  
`   SymbolList symL3 = symL.subList(symL.length() - 3, symL.length());`

`   //stampo le ultime tre basi`  
`   String s = symL.subStr(symL.length() - 3, symL.length());`  
`   System.out.println(s);`  
` }`

} </java>
