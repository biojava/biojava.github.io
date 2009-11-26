---
title: BioJava:CookBookItaliano:Translation:Single
---

Come posso tradurre un singolo codone in un singolo aminoacido?
---------------------------------------------------------------

L'esempio di traduzion generale mostra come utilizzare RNATools per
tradurre una SymbolList RNA in una SymbolList di Proteine ma molto di
ciò che accade è nascosto dietro il comodo metodo translate(). Se invece
si ha la necessità di tradurre un singolo codone in un singolo
aminoacido bisogna si addentrarsi di più nel codice ma si ha anche la
possibilità di capire come funziona realmente.

Ci sono attualmente un gran numero di modi per eseguire questa
traduzione, ve ne presenterò uno di questi.

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class SingleTranslationDemo {

` public static void main(String[] args) {`  
`   //creo un alfabeto composto da codoni`  
`   Alphabet a = AlphabetManager.alphabetForName("(RNA x RNA x RNA)");`

`   //creiamo una tabella di traduzione utilizzando uno dei nomi statici ottenuti dalla TranslationTable`  
`   TranslationTable table = RNATools.getGeneticCode(TranslationTable.UNIVERSAL);`

`   try {`  
`     //creo un codone`  
`     SymbolList codon = RNATools.createRNA("UUG");`

`     //ottengo la rappresentazione di questo codone come Simbolo`  
`     Symbol sym = a.getSymbol(codon.toList());`

`     //lo traduco in aminoacido`  
`     Symbol aminoAcid = table.translate(sym);`

`     /*`  
`      * Questo passo non è richiesto per la traduzione ma prova solamente che`  
`      * il Simbolo proviente dall'alfabeto corretto. Altrimenti viene sollevata una eccezione.`  
`      */`  
`     ProteinTools.getTAlphabet().validate(aminoAcid);`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
