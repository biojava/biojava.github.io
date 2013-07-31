---
title: Scala
---

[Scala](http://en.wikipedia.org/wiki/Scala_(programming_language)) is a
programming language which interoperates (mostly) seamlessly with Java.
As such, it is possible to use BioJava from Scala code, or even mix
Scala and java code within a single package.

In addition to using BioJava classes in Scala code, there are several
libraries for bioinformatics written natively in Scala. These may feel
more natural to a Scala programmer than the equivalent BioJava
functions. See [BioScala](http://sourceforge.net/projects/bioscala/) or
[ScaBio](http://www.mi.hs-mannheim.de/gumbel/en/forschung/scabio/).

Including BioJava from Scala code
---------------------------------

Make sure that the BioJava jar files are included in the classpath for
your scala project. The easiest way to do this is to use Maven to build
your scala project and just add BioJava as a dependency. For instance,
add the following to the dependencies section of your pom.xml file.

<dependency>  
`    `<groupId>`org.biojava`</groupId>  
`    `<artifactId>`biojava3-core`</artifactId>  
`    `<version>`3.0.6`</version>  
</dependency>

Java classes can be imported and used in scala code without
modification. For instance, here is a scala version of
[BioJava:CookBook3:PSA\_DNA].

`/**`  
` * Demo of using BioJava from scala code. Performs a simple sequence alignment.`  
` *`  
` * This shows off a few nice scala features, such as implicit methods`  
` */`  
  
`import org.biojava3.alignment.{Alignments,SimpleGapPenalty,SubstitutionMatrixHelper}`  
`import org.biojava3.alignment.Alignments.PairwiseSequenceAlignerType.LOCAL`  
`import org.biojava3.core.sequence.DNASequence`  
`import org.biojava3.core.sequence.compound.AmbiguityDNACompoundSet`  
  
`object PSA_DNA {`  
`  implicit def str2DNA(seq: String) = new DNASequence(seq,AmbiguityDNACompoundSet.getDNACompoundSet)`  
  
`  def main(args: Array[String]) {`  
`    // Note implicit cast from strings to DNASequence`  
`    val target: DNASequence = "CACGTTTCTTGTGGCAGCTTAAGTTTGAATGTCATTTCTTCAATGGGACGGA"+`  
`      "GCGGGTGCGGTTGCTGGAAAGATGCATCTATAACCAAGAGGAGTCCGTGCGCTTCGACAGC"+`  
`      "GACGTGGGGGAGTACCGGGCGGTGACGGAGCTGGGGCGGCCTGATGCCGAGTACTGGAACA"+`  
`      "GCCAGAAGGACCTCCTGGAGCAGAGGCGGGCCGCGGTGGACACCTACTGCAGACACAACTA"+`  
`      "CGGGGTTGGTGAGAGCTTCACAGTGCAGCGGCGAG"`  
  
`    val query: DNASequence = "ACGAGTGCGTGTTTTCCCGCCTGGTCCCCAGGCCCCCTTTCCGTCCTCAGGAA"+`  
`      "GACAGAGGAGGAGCCCCTCGGGCTGCAGGTGGTGGGCGTTGCGGCGGCGGCCGGTTAAGGT"+`  
`      "TCCCAGTGCCCGCACCCGGCCCACGGGAGCCCCGGACTGGCGGCGTCACTGTCAGTGTCTT"+`  
`      "CTCAGGAGGCCGCCTGTGTGACTGGATCGTTCGTGTCCCCACAGCACGTTTCTTGGAGTAC"+`  
`      "TCTACGTCTGAGTGTCATTTCTTCAATGGGACGGAGCGGGTGCGGTTCCTGGACAGATACT"+`  
`      "TCCATAACCAGGAGGAGAACGTGCGCTTCGACAGCGACGTGGGGGAGTTCCGGGCGGTGAC"+`  
`      "GGAGCTGGGGCGGCCTGATGCCGAGTACTGGAACAGCCAGAAGGACATCCTGGAAGACGAG"+`  
`      "CGGGCCGCGGTGGACACCTACTGCAGACACAACTACGGGGTTGTGAGAGCTTCACCGTGCA"+`  
`      "GCGGCGAGACGCACTCGT"`  
  
`    val matrix = SubstitutionMatrixHelper.getNuc4_4()`  
  
`    val gapP = new SimpleGapPenalty()`  
`    gapP.setOpenPenalty(5)`  
`    gapP.setExtensionPenalty(2)`  
  
`    val psa = Alignments.getPairwiseAlignment(query, target, LOCAL, gapP, matrix)`  
  
`    println(psa)`  
`  }`  
`}`

Including BioScala code in Java
-------------------------------
