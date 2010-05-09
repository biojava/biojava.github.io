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
considerazione il formato dei file, per permette una migliore
corrispondenza con il database BioSql. Inoltre ora è obbligatorio l'uso
dei namespace. L'estensione Biojavax permette anche una semplice
creazione di un parser per la lettura di un file in un nuovo formato,
anche se questo è una situazione che avviene raramente. La classe
**RichSequence.IOTools** da la possibilità di leggere file contenenti
DNA, RNA or proteinnei seguenti formati:

-   EMBL (nativo o XML)
-   FASTA
-   GenBank
-   INSDseq
-   UniProt (nativeo o XML)

This class also has a method, *readFile*, that can read a file while
guessing its format.

<java> import java.io.BufferedReader; import java.io.FileReader;

import org.biojavax.SimpleNamespace; import
org.biojavax.bio.seq.RichSequence; import
org.biojavax.bio.seq.RichSequenceIterator

public class ReadGES\_BJ1\_6{

`   /* `  
`    * ReadGES_BJ1_6.java - A pretty simple demo program to read a sequence file`  
`    * with a known format using Biojavax extension found in BJ1.6. `  
`    * `  
`    * You only need to provide a file as args[0]`  
`    */`  
`   public static void main(String[] args) {`  
`       BufferedReader br = null;`  
`       SimpleNamespace ns = null;`  
`       `  
`       try{`  
`           br = new BufferedReader(new FileReader(args[0]));`  
`           ns = new SimpleNamespace("biojava");`  
`           `  
`           // You can use any of the convenience methods found in the BioJava 1.6 API`  
`           RichSequenceIterator rsi = RichSequence.IOTools.readFastaDNA(br,ns);`  
`   `  
`           // Since a single file can contain more than a sequence, you need to iterate over`  
`           // rsi to get the information.`  
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
