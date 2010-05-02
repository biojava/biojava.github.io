---
title: BioJava:Cookbook:SeqIO:WriteInFasta
---

How Do I Print A Sequence in Fasta Format?
------------------------------------------

FASTA format is a fairly standard bioinformatics output that is
convenient and easy to read. BioJava has a tools class called IOTools
that provides static convenience methods to perform a number of common
bioinformatics IO tasks. The follwing snippets demonstrate how to print
a Sequence or even a whole SequenceDB in FASTA format to an OutputStream
like System.out. All of the WriteXX methods from IOTools take an
OutputStream as an argument. In this way you can pipe the newly
formatted sequence to a file or another method or STDOUT, STDERR etc.

IOTools is in the package org.biojavax.bio.seq.RichSequence.IOTools

### Printing a SequenceDB with an Iterator

<java> private static void printSequenceDB() {

`       // creiamo una istanza dell'interfaccia SequenceDB`  
`       SequenceDB db = new HashSequenceDB();`  
`       `  
`       Sequence dna1;`  
`       Sequence dna2;`  
`       try {`  
`           dna1 = DNATools.createDNASequence("atgctgtgg", "dna_1");`  
`           dna2 = DNATools.createDNASequence("atgctgctt", "dna_2");`  
`           //aggiungiuamo 2 sequenze al DB`  
`           db.addSequence(dna1);`  
`               db.addSequence(dna2);`  
`           RichSequence.IOTools.writeFasta(System.out, db.sequenceIterator(), null);`  
`       } catch (Exception e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`

</java>

### Printing a Single Sequence

<java>

`     /*`  
`      * SeqIOTools also has a method that takes a single sequence so you don't`  
`      * have to make a SequenceDB`  
`      */`  
`       private static void printSingleSequence(){`  
`       Sequence dna;`  
`       try {`  
`           dna = DNATools.createDNASequence("atgctg", "dna_1");`  
`           RichSequence.IOTools.writeFasta(System.out, dna, null);`  
`       } catch (IllegalSymbolException e) {`  
`           e.printStackTrace();`  
`       } catch (IOException e) {`  
`           e.printStackTrace();`  
`       }       `  
`   }`

</java>
