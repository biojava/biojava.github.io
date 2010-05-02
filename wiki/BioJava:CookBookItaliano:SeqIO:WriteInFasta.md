---
title: BioJava:CookBookItaliano:SeqIO:WriteInFasta
---

Come posso stampare una sequenza in formato FASTA?
--------------------------------------------------

Da molto tempo il formato FASTA è uno standard per la rappresentazione
di sequenze nucleotidiche o peptidiche essendo il suo "parsing" molto
semplice. Biojava ha una classe statica di utilità chiamata IOTools che
fornisce un insieme di comodi metodi statici per eseguire un insieme di
operazioni di I/O, I seguenti pezzi di codice mostrano come inviare su
un OutputStream, come ad esempio il System.out, una sequenza o un intero
SequenceDB in formato FASTA. Tutti i metodi chiamati WriteXXX della
classe IOTools prendono come dato di ingresso un OutputStream. In questo
modo è possibile scrivere la sequenza nel nuovo formato in un qualsiasi
stream, sia esso un file, lo STDOUT, lo STDERR, etc.

IOTools è nel pacage org.biojava.bio.seq.io

### Stampiamo un SequenceDB utilizzando un iterator

<java>

`   private static void printSequenceDB() {`  
`       // creiamo una istanza dell'interfaccia SequenceDB`  
`       SequenceDB db = new HashSequenceDB();`  
`       `  
`       Sequence dna1;`  
`       Sequence dna2;`

`       try {`  
`           dna1 = DNATools.createDNASequence("atgctgtgg", "dna_1");`  
`           dna2 = DNATools.createDNASequence("atgctgctt", "dna_2");`  
`           // aggiungiuamo 2 sequenze al DB`  
`           db.addSequence(dna1);`  
`           db.addSequence(dna2);`  
`           `  
`           RichSequence.IOTools.writeFasta(System.out, db.sequenceIterator(), null);`  
`       } catch (Exception e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`

</java>

### Stampiamo una singola sequenza

<java>

`     /*`  
`      * La classe SeqIOTools ha un metodo che prende una singola sequenza e la scrive nel formato `  
`      * FASTA senza la necessità di costruire un SequenceDB`  
`      */`  
`   private static void printSingleSequence(){`  
`       Sequence dna;`  
`       try {`  
`           dna = DNATools.createDNASequence("atgctg", "dna_1");`  
`           RichSequence.IOTools.writeFasta(System.out, dna, null);`  
`       } catch (IllegalSymbolException e) {`  
`           //questa eccezione viene sollevata nel caso in cui all'interno della`  
`           //sequenza ci siano caratteri non validi`  
`           e.printStackTrace();`  
`       } catch (IOException e) {`  
`           //questa eccezione viene sollevata nel caso in cui ci siano problemi`  
`           //con lo stream`  
`           e.printStackTrace();`  
`       }       `  
`   }`

</java>
