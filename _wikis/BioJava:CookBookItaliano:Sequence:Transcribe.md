---
title: BioJava:CookBookItaliano:Sequence:Transcribe
---

Come posso trascrivere una Sequenze di DNA in una Sequenza di RNA?
------------------------------------------------------------------

In BioJava le Sequences/SymbolList di DNA e RNA sono generate
utilizzando alfabeti diversi. E' possibile passare da un alfabeto DNA a
uno RNA utilizzando il metodo transcribe() in RNATools.

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class TranscribeDNAtoRNA {

`  public static void main(String[] args) {`

`     try {`  
`      //crea a DNA SymbolList`  
`      SymbolList symL = DNATools.createDNA("atgccgaatcgtaa");`

`      //la converto in RNA (questo metodo è deprecato dopo BioJava 1.4)`  
`      symL = RNATools.transcribe(symL);`

`      //(dopo BioJava 1.4 si utilizza questo metodo)`  
`      symL = DNATools.toRNA(symL);`  
`      `  
`      //verifichiamo il funzionamento`  
`      System.out.println(symL.seqString());`  
`     }`  
`     catch (IllegalSymbolException ex) {`  
`           //questa eccezione viene sollevata se viene utilizzato`  
`           //un simbolo che non è previsto dallo IUB per la creazione del DNA`  
`             ex.printStackTrace();`  
`     }catch (IllegalAlphabetException ex) {`  
`      //questa eccezione viene sollevata se si cerca e/o trascrive un non DNA SymbolList`  
`        ex.printStackTrace();`  
`     }`  
`  }`

} </java>
