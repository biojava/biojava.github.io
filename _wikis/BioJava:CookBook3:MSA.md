---
title: BioJava:CookBook3:MSA
---

How to create a Multiple Sequence Alignment in BioJava
======================================================

<java>

package org.biojava.nbio.alignment;

import java.net.URL; import java.util.ArrayList; import java.util.List;

import org.biojava.nbio.alignment.Alignments; import
org.biojava.nbio.alignment.template.Profile; import
org.biojava.nbio.core.sequence.ProteinSequence; import
org.biojava.nbio.core.sequence.compound.AminoAcidCompound; import
org.biojava.nbio.core.sequence.io.FastaReaderHelper; import
org.biojava.nbio.core.util.ConcurrencyTools;

public class CookbookMSA {

`   public static void main(String[] args) {`  
`       String[] ids = new String[] {"Q21691", "A8WS47", "O48771"};`  
`       try {`  
`           multipleSequenceAlignment(ids);`  
`       } catch (Exception e){`  
`           e.printStackTrace();`  
`       }`  
`   }`

`   private static void multipleSequenceAlignment(String[] ids) throws Exception {`  
`       List`<ProteinSequence>` lst = new ArrayList`<ProteinSequence>`();`  
`       for (String id : ids) {`  
`           lst.add(getSequenceForId(id));`  
`       }`  
`       Profile`<ProteinSequence, AminoAcidCompound>` profile = Alignments.getMultipleSequenceAlignment(lst);`  
`       System.out.printf("Clustalw:%n%s%n", profile);`  
`       ConcurrencyTools.shutdown();`  
`   }`

`   private static ProteinSequence getSequenceForId(String uniProtId) throws Exception {`  
`       URL uniprotFasta = new URL(String.format("`[`http://www.uniprot.org/uniprot/%s.fasta`](http://www.uniprot.org/uniprot/%s.fasta)`", uniProtId));`  
`       ProteinSequence seq = FastaReaderHelper.readFastaProteinSequence(uniprotFasta.openStream()).get(uniProtId);`  
`       System.out.printf("id : %s %s%n%s%n", uniProtId, seq, seq.getOriginalHeader());`  
`       return seq;`  
`   }`

}

</java>
