---
title: BioJava:CookBookItaliano:SeqIO:WriteInFasta
---

Come posso stampare una sequenza in formato FASTA?
--------------------------------------------------

Da molto tempo il formato FASTA è uno standard per la rappresentazione
di sequenze nucleotidiche o peptidiche essendo molto facile da leggere.
Biojava ha una classe di utilità chiamata SeqIOTools che fornisce un
insieme di comodi metodi statici per eseguire un insieme di operazioni
di I/O, I seguenti pezzi di codice mostrano come inviare su un
OutputStream, come il System.out, una sequenza o un interno SequenceDB
in formato FASTA. Tutti i metodi chiamati WriteXXX della classe
SeqIOTools prendono come dato di ingresso un OutputStream. In questo
modo è possibile scrivere la sequenza nel nuovo formato in un qualsiasi
OutPutStream, sia esso un file, lo STDOUT, lo STDERR, etc.

SeqIOTools è nel pacage org.biojava.bio.seq.io

### Stampiamo un SequenceDB

<java>

`     //creiamo una istanza dell'interfaccia SequenceDB`  
`     SequenceDB db = new HashSequenceDB();`

`     //aggiungiuamo 2 sequenze al DB`  
`     db.addSequence(seq1);`  
`     db.addSequence(seq2);`

`     /*`  
`      * stampiamo ora le due sequenze in formato FASTA utilizzando la classe SeqIOTools. In`  
`      * questo caso l'outputstream è lo STDOUT.`  
`      * `  
`      */`

`     SeqIOTools.writeFasta(System.out, db);`

</java>

### Stampiamo le sequenze recuperate con un SequenceIterator

Molti dei metodi readXXX() appartenenti alla classe SeqIOTools
restituiscono un SequenceIterator e molti dei metodi writeXXX()
appartenenti alla stessa classe accettano come dato di ingresso proprio
un SequenceIterator.

<java>

`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(fileType, br);`

`     // e ora le scriviamo tutte nel formato FASTA, e le inviamo ad un OutPutStream`  
`     SeqIOTools.writeFasta(System.out, iter);`

</java>

### Stampiamo una singola sequenza

<java>

`     /*`  
`      * La classe SeqIOTools ha un metodo che prende una singola sequenza e la scrive nel formato FASTA`  
`      * senza la necessità di costruire un SequenceDB`  
`      */`  
`     SeqIOTools.writeFasta(System.out, seq1);`

</java>
