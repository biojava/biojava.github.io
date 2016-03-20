---
title: BioJava:Cookbook:SeqIO:ABItoSequence
---

How can I turn an ABI trace into a BioJava Sequence?
----------------------------------------------------

A lot of Bioinformatics begins with the reading of a piece of DNA (or
several pieces) using a DNA sequencer. A typical output is an ABI trace.
BioJava contains a Class called ABITrace that will parse either an
ABITrace file or URL or a byte[] and store its values for programmatic
retrieval.

The following program is modified from a version kindly supplied by
Matthew Pocock. It demonstrates the creation of a BioJava Sequence from
an ABI trace file.

BioJava 1.3 now contains a more generic chromatogram API that supports
both ABI and SCF files. An example program that uses this API is shown
below.

### Reading ABI

<java> import java.io.\*;

import org.biojava.bio.\*; import org.biojava.bio.program.abi.\*; import
org.biojava.bio.seq.\*; import org.biojava.bio.seq.impl.\*; import
org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class Trace2Seq {

` public static void main(String[] args)`  
` throws Exception {`  
`   File traceFile = new File(args[0]);`

`   //the name of the sequence`  
`   String name = traceFile.getName();`

`   //read the trace`  
`   ABITrace trace = new ABITrace(traceFile);`

`   //extract the Symbols`  
`   SymbolList symbols = trace.getSequence();`  
`   //make a fully fledged sequence`  
`   Sequence seq = new SimpleSequence(symbols, name, name, Annotation.EMPTY_ANNOTATION);`

`   //write it to STDOUT`  
`   SeqIOTools.writeFasta(System.out, seq);`  
` }`

} </java>

### Generic Solution

<java> import java.io.\*;

import org.biojava.bio.\*; import org.biojava.bio.chromatogram.\*;
import org.biojava.bio.seq.\*; import org.biojava.bio.seq.impl.\*;
import org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class Trace2Seq {

` public static void main(String[] args)`  
` throws Exception {`  
`   File traceFile = new File(args[0]);`

`   //the name of the sequence`  
`   String name = traceFile.getName();`

`   //read the trace`  
`   Chromatogram trace = ChromatogramFactory.create(traceFile);`

`   //extract the Symbols`  
`   SymbolList symbols = ChromatogramTools.getDNASequence(trace);`  
`   //make a fully fledged sequence`  
`   Sequence seq = new SimpleSequence(symbols, name, name, Annotation.EMPTY_ANNOTATION);`

`   //write it to STDOUT`  
`   SeqIOTools.writeFasta(System.out, seq);`  
` }`

} </java>
