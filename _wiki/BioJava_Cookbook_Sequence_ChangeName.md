---
title: BioJava:Cookbook:Sequence:ChangeName
permalink: wiki/BioJava%3ACookbook%3ASequence%3AChangeName
---

How can I change a Sequence's name?
-----------------------------------

Mostly BioJava Sequence objects are immutable. This is really a safety
feature to prevent changes corrupting the integrity of the data. A
consequence of this is that there is no setName() method in Sequence.
One way to change your "view" of a Sequence is to make a ViewSequence
using the original Sequence as an argument in the constructor. Behind
the scenes the ViewSequence wrapper intercepts some of the method calls
to the underlying Sequence which gives the possibility of changing the
name.

The following program demonstrates this.

```java import java.io.\*;

import org.biojava.bio.seq.\*; import org.biojava.bio.seq.io.\*; import
org.biojava.bio.symbol.\*;

public class NameChange {

` public static void main(String[] args) {`  
`   try {`  
`     Sequence seq =`  
`         DNATools.createDNASequence("atgcgctaggctag","gi|12356|ABC123");`

`     //create a veiw on the sequence and change its name`  
`     Sequence view = SequenceTools.view(seq, "ABC123");`

`     //print to FASTA to prove the name has changed`  
`     SeqIOTools.writeFasta(System.out, view);`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     //tried to make seq with non DNA symbol`  
`     ex.printStackTrace();`  
`   }catch (IOException ex) {`  
`     //couldn't print view to System out??`  
`     ex.printStackTrace();`  
`   }`  
` }`

} ```
