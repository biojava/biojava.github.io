---
title: BioJava:Cookbook:Translation:SixFrames
---

How can I translate all six frames of a nucleotide Sequence?
------------------------------------------------------------

This is probably one of the more frequent tasks in bioinformatics and
one of the most frequent questions posted to the mailing list.

Six frame translations are good for identifying large ORFs which can be
indicators of coding regions, at least in species that don't have
introns. A six frame translation is a simple matter of taking
subsequences of the sequence(s) of interest and reverse
complementing/translating as appropriate. The only trick is figuring out
how to take the subsequences so you have regions that are equally
divisible by three.

*NOTE: See ['how to get a
subsequence'](Biojava:Cookbook:Sequence:SubSequence "wikilink") for a
description of how to get a portion of a Sequence for translation.*

The following example shows a simple program that will six frame
translate all sequences in a file and print the results to STDOUT in
fasta format.

<java> import java.io.BufferedReader; import java.io.FileReader;

import org.biojava.bio.Annotation; import org.biojava.bio.seq.DNATools;
import org.biojava.bio.seq.RNATools; import
org.biojava.bio.seq.Sequence; import
org.biojava.bio.seq.SequenceIterator; import
org.biojava.bio.seq.SequenceTools; import
org.biojava.bio.seq.io.SeqIOTools; import
org.biojava.bio.symbol.SymbolList;

/\*\*

`* `

Program to six-frame translate a nucleotide sequence

`*/`

public class Hex {

` /**`  
`  * Call this to get usage info, program terminates after call.`  
`  */`  
` public static void help() {`  
`   System.out.println(`  
`       "usage: java Hex `<file>` `<format eg fasta>` `<dna|rna>`");`  
`   System.exit( -1);`  
` }`

` public static void main(String[] args) throws Exception{`  
`   if (args.length != 3) {`  
`     help();`  
`   }`

`   BufferedReader br = null;`  
`   `  
`   //file format (eg fasta)`  
`   String format = args[1];`  
`   `  
`   //sequence type (eg dna)`  
`   String alpha = args[2];`

`   try {`  
`     br = new BufferedReader(new FileReader(args[0]));`

`     SequenceIterator seqi =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);`

`     //for each sequence`  
`     while(seqi.hasNext()){`  
`       Sequence seq = seqi.nextSequence();`

`       //for each frame`  
`       for (int i = 0; i < 3; i++) {`  
`         SymbolList prot;`  
`         Sequence trans;`

`         //take the reading frame`  
`         SymbolList syms = seq.subList(`  
`               i+1,`  
`               seq.length() - (seq.length() - i)%3);`

`         //if it is DNA transcribe it to RNA`  
`         if(syms.getAlphabet() == DNATools.getDNA()){`  
`           //before BJ1.4 use this method`  
`       syms = RNATools.transcribe(syms);`  
`       //after BJ1.4 use this method`  
`       syms = DNATools.toRNA(syms);`  
`         }`

`         //output forward translation to STDOUT`  
`         prot = RNATools.translate(syms);`  
`         trans = SequenceTools.createSequence(prot, "",`  
`                                              seq.getName()+`  
`                                              "TranslationFrame: +"+i,`  
`                                              Annotation.EMPTY_ANNOTATION);`  
`         SeqIOTools.writeFasta(System.out, trans);`

`         //output reverse frame translation to STDOUT`  
`         syms = RNATools.reverseComplement(syms);`  
`         prot = RNATools.translate(syms);`  
`         trans = SequenceTools.createSequence(prot, "",`  
`                                              seq.getName() +`  
`                                              " TranslationFrame: -" + i,`  
`                                              Annotation.EMPTY_ANNOTATION);`  
`         SeqIOTools.writeFasta(System.out, trans);`  
`       }`  
`     }`  
`   }`  
`   finally {`  
`     //tidy up`  
`     if(br != null){`  
`       br.close();`  
`     }`  
`   }`  
` }`

} </java>
