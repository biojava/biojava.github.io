---
title: BioJava:CookBookItaliano:SeqIO:ReadGES
---

Come posso leggere un file in formato GenBank/EMBL/UniProt/FASTA/INSDseq?
-------------------------------------------------------------------------

Fin dall'inizio, tramite le librerie Biojava era possibile leggere file
nei formati più comuni utilizzati in bioinformatica. A partire dalla
versione 1.5 di Biojava con l'aggiunta delle estensioni Biojavax, il
modo di leggere i file è cambiato un pò. Anche se è possibile ancora
leggere i file contenenti le sequenze utilizzando la classe
**SeqIOTools**, essa ora è stata segnata come deprecata e sostituita
dalla classe **RichSequence.IOTools**. Questa classe a differenza di
quella deprecata ha dei metodi più specifici che tengono in
considerazione il formato dei file per permettere,inoltre, una migliore
corrispondenza con il database BioSql. Ora infatti è obbligatorio l'uso
dei namespace. L'estensione Biojavax permette anche una semplice
creazione di un parser per la lettura di un file in un formato
personalizzato, anche se questo è una situazione che avviene raramente.
La classe **RichSequence.IOTools** da la possibilità di leggere file
contenenti DNA, RNA or proteine nei seguenti formati:

-   EMBL (nativo o XML)
-   FASTA
-   GenBank
-   INSDseq
-   UniProt (nativeo o XML)

Questa classe ha anche un metodo, *readFile*, per leggere un file
indovinandone il formato.

Seguendo questo
[link](http://www.ncbi.nlm.nih.gov/nuccore/146274?report=genbank) è
possibile scaricare alcuni file di esempio.

<java> import java.io.BufferedReader; import java.io.FileReader;

import org.biojavax.SimpleNamespace; import
org.biojavax.bio.seq.RichSequence; import
org.biojavax.bio.seq.RichSequenceIterator;

public class ReadGES\_BJ1\_6{

`   /* `  
`    * ReadGES_BJ1_6.java -E' un semplice programma per leggere un file di sequenza `  
`    * noto il suo formato. Esso utilizza le estensioni Biojavax che si trovano in BJ1.6. `  
`    * `  
`    * Basta passare alla classe il path del file come args[0]`  
`    */`  
`   public static void main(String[] args) {`  
`       BufferedReader br = null;`  
`       SimpleNamespace ns = null;`  
`       `  
`       try{`  
`           br = new BufferedReader(new FileReader(args[0]));`  
`           ns = new SimpleNamespace("biojava");`  
`           `

`                       // Si può utilizzare uno qualsiasi dei metodi presenti nelle BioJava 1.6 API        `  
`                       RichSequenceIterator rsi = RichSequence.IOTools.readFastaDNA(br,ns);`  
`   `  
`                       //Se un file contiene più sequenze è possibile utilizzare un iteratore per leggerle tutte`  
`           while(rsi.hasNext()){`  
`               RichSequence rs = rsi.nextRichSequence();`  
`               System.out.println(rs.getName());`  
`           }`  
`       }`  
`       catch(Exception be){`  
`           be.printStackTrace();`  
`           System.exit(-1);`  
`       }`  
`   }`

} </java>
