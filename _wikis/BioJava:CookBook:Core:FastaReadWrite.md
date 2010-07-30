---
title: BioJava:CookBook:Core:FastaReadWrite
---

How to Read a Fasta File with Biojava3
======================================

<java> import java.io.File; import java.io.FileInputStream; import
java.util.LinkedHashMap; import java.util.Map.Entry;

import org.biojava3.core.sequence.ProteinSequence; import
org.biojava3.core.sequence.compound.AminoAcidCompound; import
org.biojava3.core.sequence.compound.AminoAcidCompoundSet; import
org.biojava3.core.sequence.io.FastaReader; import
org.biojava3.core.sequence.io.FastaReaderHelper; import
org.biojava3.core.sequence.io.GenericFastaHeaderParser; import
org.biojava3.core.sequence.io.ProteinSequenceCreator;

public class FastaOpen {

`   public static void main(String[] args) throws Exception{`  
`       /*`  
`        * Method 1: With the FastaReaderHelper`  
`        */`  
`       //Try with the FastaReaderHelper`  
`       LinkedHashMap`<String, ProteinSequence>` a = FastaReaderHelper.readFastaProteinSequence(new File(args[0]));`  
`       //FastaReaderHelper.readFastaDNASequence for DNA sequences`  
`       `  
`       for (  Entry`<String, ProteinSequence>` entry : a.entrySet() ) {`  
`           System.out.println( entry.getValue().getOriginalHeader() + "=" + entry.getValue().getSequenceAsString() );`  
`       }`  
`       `  
`       /*`  
`        * Method 2: With the FastaReader Object `  
`        */     `  
`       //Try reading with the FastaReader`  
`       FileInputStream inStream = new FileInputStream( args[0] );`  
`       FastaReader`<ProteinSequence,AminoAcidCompound>` fastaReader = `  
`           new FastaReader`<ProteinSequence,AminoAcidCompound>`(`  
`                   inStream, `  
`                   new GenericFastaHeaderParser`<ProteinSequence,AminoAcidCompound>`(), `  
`                   new ProteinSequenceCreator(AminoAcidCompoundSet.getAminoAcidCompoundSet()));`  
`       LinkedHashMap`<String, ProteinSequence>` b = fastaReader.process();`  
`       for (  Entry`<String, ProteinSequence>` entry : b.entrySet() ) {`  
`           System.out.println( entry.getValue().getOriginalHeader() + "=" + entry.getValue().getSequenceAsString() );`  
`       }`  
`   }`

}

</java>
