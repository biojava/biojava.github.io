---
title: BioJava:CookBookItaliano:Translation
---

Come posso tradurre una Sequenza o una SymbolList di DNA o RNA in una Proteina?
-------------------------------------------------------------------------------

Per tradurre una sequenza di DNA bisogna seguire i seguenti passi:

-   [Trascriverlo in
    RNA](Biojava:Cookbook:Sequence:Transcribe "wikilink").
-   Get a triplet (codon) view on the SymbolList.
-   Tradurlo in Proteina.

Innanzitutto per realizza questi tre passi basta utilizzare i metodi
statici delle classi relative agli strumenti di Biojava. Il blocco
seguente di codice mostra come funziona questa procedura. Ovviamente se
si ha già una sequenza di RNA non è necessario trascriverla.

*Nota Bene:Se si cerca di creare una 'triplet view' di una SymbolList o
Sequenza la cui lunghezza non è divisible per tre viene sollevata una
IllegalArgumentException. Segui questo
[link](Biojava:CookBookItaliano:Sequence:SubSequence "wikilink") per
scoprire come ottenere una porzione di una Sequenza per poi tradurla*

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class Translate {

` public static void main(String[] args) {`  
`   try {`  
`     //create a DNA SymbolList`  
`     SymbolList symL = DNATools.createDNA("atggccattgaatga");`

`     //transcribe to RNA (after biojava 1.4 this method is deprecated)`  
`     symL = RNATools.transcribe(symL);`

`     //transcribe to RNA (after biojava 1.4 use this method instead)`  
`     symL = DNATools.toRNA(symL);`  
`     `  
`     //translate to protein`  
`     symL = RNATools.translate(symL);`

`     //prove that it worked`  
`          System.out.println(symL.seqString());`  
`    }catch (IllegalAlphabetException ex) {`  
`     `  
`    `  
`     /* `  
`      * this will occur if you try and transcribe a non DNA sequence or translate`  
`      * a sequence that isn't a triplet view on a RNA sequence.`  
`      */`  
`      ex.printStackTrace();`  
`    }catch (IllegalSymbolException ex) {`  
`     // this will happen if non IUB characters are used to create the DNA SymbolList`  
`      ex.printStackTrace();`  
`    }`  
`  }`

} </java>
