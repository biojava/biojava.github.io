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

import org.biojava.bio.\*; import org.biojava.bio.seq.db.\*; import
org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class ReadFasta {

` /**`  
`  * Per poter essere eseguita questa classe ha bisogno di due parametri di ingresso:`  
`  * il primo è il nome del file con il suo percorso, e il secondo è il nome dell'alfabeto`  
`  * che si vuole utilizzare DNA, RNA, PROTEIN.`  
`  */`  
` public static void main(String[] args) {`

`   try {`  
`     //apre il file di input`  
`     String filename = args[0];`  
`     BufferedInputStream is =`  
`         new BufferedInputStream(new FileInputStream(filename));`

`     //prende l'alfabeto richiesto`  
`     Alphabet alpha = AlphabetManager.alphabetForName(args[1]);`

`     //crea un SequenceDB con tutte le sequenze presenti nel file`  
`     SequenceDB db = SeqIOTools.readFasta(is, alpha);`  
`   }`  
`   catch (BioException ex) {`  
`     //questa eccezione viene sollevata quando o le sequenze non sono in formato fasta`  
`     //o quando l'alfabeto utilizzato è sbagliato`  
`     ex.printStackTrace();`  
`   }catch (NoSuchElementException ex) {`  
`     //questa eccezione viene sollevata quando non sono presenti sequenze in formato fasta all'interno del file`  
`     ex.printStackTrace();`  
`   }catch (FileNotFoundException ex) {`  
`     //questa eccezione viene sollevata quando il file che si intende leggere non esiste`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>

### Soluzione n°2

<java> import java.io.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*;

public class ReadFasta2 {

` /**`  
`  * This program will read any file supported by SeqIOTools it takes three`  
`  * arguments, the first is the file name the second is the name of`  
`  * a file format supported by SeqIOTools. eg fasta, genbank etc.`  
`  * The third argument is the alphabet (eg dna, rna, protein).`  
`  *`  
`  * Both the format and alphabet names are case insensitive.`  
`  *`  
`  */`  
` public static void main(String[] args) {`  
`   try {`  
`     //prepare a BufferedReader for file io`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`     String format = args[1];`  
`     String alphabet = args[2];`

`     /*`  
`      * get a Sequence Iterator over all the sequences in the file.`  
`      * SeqIOTools.fileToBiojava() returns an Object. If the file read`  
`      * is an alignment format like MSF and Alignment object is returned`  
`      * otherwise a SequenceIterator is returned.`  
`      */`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(format,alphabet, br);`  
`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find file specified by args[0]`  
`     ex.printStackTrace();`  
`   }catch (BioException ex) {`  
`     //error parsing requested format`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
