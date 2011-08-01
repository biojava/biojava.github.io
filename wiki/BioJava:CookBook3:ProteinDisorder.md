---
title: BioJava:CookBook3:ProteinDisorder
---

How can I predict disordered regions on the protein sequence?
-------------------------------------------------------------

BioJava provide a module *biojava3-protein-disorder* for prediction
disordered regions from protein sequence.

Example 1: Calculate the probability of disorder for every residue in the sequence
----------------------------------------------------------------------------------

<java> FastaSequence fsequence = new FastaSequence("name",
"LLRGRHLMNGTMIMRPWNFLNDHHFPKFFPHLIEQQAIWLADWWRKKHC" +

`               "RPLPTRAPTMDQWDHFALIQKHWTANLWFLTFPFNDKWGWIWFLKDWTPGSADQAQRACTWFFCHGHDTN");`

float[] rawProbabilityScores = Jronn.getDisorderScores(fsequence);
</java>

Example 2: Calculate the probability of disorder for every residue in the sequence for all proteins from the FASTA input file
-----------------------------------------------------------------------------------------------------------------------------

<java> final List<FastaSequence> sequences = SequenceUtil.readFasta(new
FileInputStream("src/test/resources/fasta.in"));
Map<FastaSequence, float[]> rawProbabilityScores =
Jronn.getDisorderScores(sequences); </java>

Example 3: Get the disordered regions of the protein for a single protein sequence
----------------------------------------------------------------------------------

<java> FastaSequence fsequence = new FastaSequence("Prot1",
"LLRGRHLMNGTMIMRPWNFLNDHHFPKFFPHLIEQQAIWLADWWRKKHC" +

`               "RPLPTRAPTMDQWDHFALIQKHWTANLWFLTFPFNDKWGWIWFLKDWTPGSADQAQRACTWFFCHGHDTN" +`  
`               "CQIIFEGRNAPERADPMWTGGLNKHIIARGHFFQSNKFHFLERKFCEMAEIERPNFTCRTLDCQKFPWDDP");`

Range[] ranges = Jronn.getDisorder(fsequence); </java>

Example 4: Calculate the disordered regions for the proteins from FASTA file
----------------------------------------------------------------------------

<java>

`     final List`<FastaSequence>` sequences = SequenceUtil.readFasta(new FileInputStream("src/test/resources/fasta.in"));`  
`     Map`<FastaSequence, Range[]>` ranges = Jronn.getDisorder(sequences);`

</java>
