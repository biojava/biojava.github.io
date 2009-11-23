---
title: BioJava:CookBookItaliano:Translation
---

Come posso tradurre una Sequenza o una SymbolList di DNA o RNA in una Proteina?
-------------------------------------------------------------------------------

Per tradurre una sequenza di DNA bisogna seguire i seguenti passi:

-   [Trascriverlo in
    RNA](Biojava:Cookbook:Sequence:Transcribe "wikilink").
-   Ottenere una triplet (codon) view della SymbolList.
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
`     //creo una SymbolList di DNA`  
`     SymbolList symL = DNATools.createDNA("atggccattgaatga");`

`     //lo trascrivo in RNA (dopo la versione 1.4 di BioJava questo metodo è deprecato)`  
`     symL = RNATools.transcribe(symL);`

`     //lo trascrivo in RNA  (dopo la versione 1.4 di BioJava si usa questo metodo)`  
`     symL = DNATools.toRNA(symL);`  
`     `  
`     //lo traduco in proteina`  
`     symL = RNATools.translate(symL);`

`     //verifico`  
`          System.out.println(symL.seqString());`  
`    }catch (IllegalAlphabetException ex) {`  
`     /* `  
`      * Questa eccezione viene sollevata se si cerca di trascrivere una sequenza che non è di DNA o tradurre `  
`      * una sequenza che non è una triplet view di una RNA Sequence.`  
`      */`  
`      ex.printStackTrace();`  
`    }catch (IllegalSymbolException ex) {`  
`     // Questa invece accade quando non si utilizzano i caratteri IUB per creare una DNA SymbolList`  
`      ex.printStackTrace();`  
`    }`  
`  }`

} </java>
