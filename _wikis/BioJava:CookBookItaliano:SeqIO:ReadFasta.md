---
title: BioJava:CookBookItaliano:SeqIO:ReadFasta
---

Come posso leggere una sequenze da un file in formato FASTA?
------------------------------------------------------------

Una dei delle operazioni di I/O più eseguite in bioninformatica è il
caricamento di un flat file di una sequenza in memoria. La classe
SeqIOTools dispone di una serie di metodi statici per la lettura dei
files. Ci sono più modi per poter eseguire questa operazione. Il primo è
un esempio più specifico il secondo invece un pò più generale.

### Soluzione n°1

<java> import java.io.\*; import java.util.\*;

import org.biojava.\* import org.biojavax.\*

public class ReadFasta {

` /**`  
`  * Per poter essere eseguita questa classe ha bisogno di due parametri di ingresso:`  
`  * il primo è il nome del file con il suo percorso, e il secondo è il nome dell'alfabeto`  
`  * che si vuole utilizzare DNA, RNA, PROTEIN.`  
`  */`  
` public static void main(String[] args) {`  
`      readFasta(args[0], args[1]);`  
` }`  
` private static void readFasta(String fileName, String type) {`  
`   try {`  
`       SequenceDB db = new HashSequenceDB();`  
`       BufferedReader br = new BufferedReader(new FileReader(filename));`  
`           // prende l'alfabeto richiesto`  
`       SymbolTokenization toke = AlphabetManager.alphabetForName(type)`  
`                                         .getTokenization("token");`  
`           // crea un SequenceDB con tutte le sequenze presenti nel file`  
`       SequenceIterator seqi = RichSequence.IOTools.readFasta(br, toke,null);`  
`       while (seqi.hasNext()) {`  
`           db.addSequence(seqi.nextSequence());`  
`       }`  
`   } catch (Exception e) {`  
`       e.printStackTrace();`  
`   }`  
`   }`

} </java>
