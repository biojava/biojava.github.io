---
title: BioJava:Performance:ReadDrosophila
---

Read Drosophila Genome
======================

This source code is run in the [example that reads the Drosophila
genome](BioJava:Performance "wikilink") and prints out the size of each
chromosome:

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.db.\*; import org.biojava.bio.seq.io.\*; import
org.biojava.bio.symbol.\*;

public class ReadFasta {

`/**`

-   -   The program takes two args: the first is the file name of the
        Fasta file.
-   -   The second is the name of the Alphabet. Acceptable names are DNA
        RNA or PROTEIN.
    -   /

`public static void main(String[] args) {`

`  try {`  
`    //setup file input`  
`    String filename = args[0];`  
`    BufferedInputStream is =`  
`      new BufferedInputStream(new FileInputStream(filename));`

`    //get the appropriate Alphabet`  
`    Alphabet alpha = AlphabetManager.alphabetForName(args[1]);`

`    //get a SequenceDB of all sequences in the file`  
`    SequenceDB db = SeqIOTools.readFasta(is, alpha);`

`    //list sequences and length`  
`    SequenceIterator sI = db.sequenceIterator();`  
`    long total = 0;`  
`    while (sI.hasNext()) {`  
`      Sequence seq = sI.nextSequence();`  
`      System.out.println(seq.getName() + "\t" + seq.length());`  
`      total += seq.length();`  
`    }`  
`    System.out.println("Total length is " + total);`  
`  }`  
`  catch (BioException ex) {`  
`    //not in fasta format or wrong alphabet`  
`  }catch (NoSuchElementException ex) {`  
`    //no fasta sequences in the file`  
`    ex.printStackTrace();`  
`  }catch (FileNotFoundException ex) {`  
`    //problem reading file`  
`    ex.printStackTrace();`  
`  }`  
`}`

} </java>
