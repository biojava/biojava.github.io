---
title: BioJava:CookBook3:PSA DNA
---

Calculating a local alignment
-----------------------------

<java> public static void main(String[] args){

`       String targetSeq = "CACGTTTCTTGTGGCAGCTTAAGTTTGAATGTCATTTCTTCAATGGGACGGA"+`  
`                 "GCGGGTGCGGTTGCTGGAAAGATGCATCTATAACCAAGAGGAGTCCGTGCGCTTCGACAGC"+`  
`             "GACGTGGGGGAGTACCGGGCGGTGACGGAGCTGGGGCGGCCTGATGCCGAGTACTGGAACA"+`  
`             "GCCAGAAGGACCTCCTGGAGCAGAGGCGGGCCGCGGTGGACACCTACTGCAGACACAACTA"+ `  
`             "CGGGGTTGGTGAGAGCTTCACAGTGCAGCGGCGAG";`  
`       DNASequence target = new DNASequence(targetSeq,`  
`               AmbiguityDNACompoundSet.getDNACompoundSet());`  
`       `  
`       String querySeq = "ACGAGTGCGTGTTTTCCCGCCTGGTCCCCAGGCCCCCTTTCCGTCCTCAGGAA"+`  
`             "GACAGAGGAGGAGCCCCTCGGGCTGCAGGTGGTGGGCGTTGCGGCGGCGGCCGGTTAAGGT"+`  
`             "TCCCAGTGCCCGCACCCGGCCCACGGGAGCCCCGGACTGGCGGCGTCACTGTCAGTGTCTT"+`  
`             "CTCAGGAGGCCGCCTGTGTGACTGGATCGTTCGTGTCCCCACAGCACGTTTCTTGGAGTAC"+`  
`             "TCTACGTCTGAGTGTCATTTCTTCAATGGGACGGAGCGGGTGCGGTTCCTGGACAGATACT"+`  
`             "TCCATAACCAGGAGGAGAACGTGCGCTTCGACAGCGACGTGGGGGAGTTCCGGGCGGTGAC"+`  
`             "GGAGCTGGGGCGGCCTGATGCCGAGTACTGGAACAGCCAGAAGGACATCCTGGAAGACGAG"+`  
`             "CGGGCCGCGGTGGACACCTACTGCAGACACAACTACGGGGTTGTGAGAGCTTCACCGTGCA"+ `  
`             "GCGGCGAGACGCACTCGT";`  
`       DNASequence query = new DNASequence(querySeq,`  
`               AmbiguityDNACompoundSet.getDNACompoundSet());`

`       SubstitutionMatrix`<NucleotideCompound>` matrix = SubstitutionMatrixHelper.getNuc4_4();`  
`       `  
`       SimpleGapPenalty gapP = new SimpleGapPenalty();`  
`       gapP.setOpenPenalty((short)5);`  
`       gapP.setExtensionPenalty((short)2);`  
`       `  
`       SequencePair`<DNASequence, NucleotideCompound>` psa =`  
`               Alignments.getPairwiseAlignment(query, target,`  
`                       PairwiseSequenceAlignerType.LOCAL, gapP, matrix);`

`       System.out.println(psa);`  
`   }`

</java> AmbiguityDNA COmpound Set allows not only ACTG, but also
ambiguity codes, also known as [IUB
Code](http://en.wikipedia.org/wiki/FASTA_format#Sequence_representation)
