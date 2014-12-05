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

If you are using [SBT](http://www.scala-sbt.org/) to build your Scala
project just add the following to your sbt file.

`libraryDependencies += "org.biojava" % "biojava3-core" % "3.1.0"`  
  
`resolvers += "BioJava repository" at "`[`http://www.biojava.org/download/maven/`](http://www.biojava.org/download/maven/)`"`

Java classes can be imported and used in scala code without
modification. For instance, here is a scala version of
<BioJava:CookBook3:PSA_DNA>.

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

Including ScaBio code in Java
-----------------------------

Including Scala code from Java is equally easy. For example, ScaBio
contains an implementation of the [Nussinov
algorithm](wp:Nucleic acid structure prediction#Dynamic_programming_algorithms "wikilink")
for RNA secondary structure prediction. This algorithm is not yet
present in BioJava.

First, include the ScaBio jars and dependencies in your classpath. If
using maven this is quite simple. Add the required packages to your
pom.xml:

<dependency>  
`    `<groupId>`net.gumbix`</groupId>  
`    `<artifactId>`scabio-demo`</artifactId>  
`    `<version>`0.1-SNAPSHOT`</version>  
</dependency>

Scala objects and methods can now be used from Java code. To display
ScaBio's RNA secondary structure visualization too, for instance, just
call the appropriate method.

`public class RNAStruct2DViewer {`  
`   public static void main(String[] args) {`  
`       net.gumbix.bioinf.struct.RNAStruct2DViewer.main(args);`  
`   }`  
`}`

Here is a more complex example to output the results of the RNA
secondary structure prediction in a simple text format.

`import java.util.List;`  
`import net.gumbix.bioinf.struct.AbstractNussinov;`  
`import net.gumbix.bioinf.struct.NussinovDecision;`  
`import net.gumbix.bioinf.struct.NussinovEnergy;`  
`import net.gumbix.bioinf.struct.NussinovState;`  
`import net.gumbix.dynpro.Idx;`  
`import net.gumbix.dynpro.PathEntry;`  
`import scala.collection.JavaConversions;`  
  
`public class RNAStructPredictor {`  
`   public static void main(String[] args) {`  
`       String s = "UGGGAAGGUUUUGGAACCC";`  
`       AbstractNussinov dp = new NussinovEnergy(s);`  
`       Idx idx = new Idx(0, dp.n()-1);`  
`       scala.collection.immutable.List`<PathEntry<NussinovDecision>`> solution = dp.solution(idx);`  
  
`       String topology = rnaTopologyString(solution, dp.n());`  
  
`       System.out.println(s);`  
`       System.out.println(topology);`  
`   }`  
  
`   /**`  
`    * Get a topology string for the given RNA secondary structure prediction`  
`    * @param s The solved RNA secondary structure from ScaBio`  
`    * @return A string of '(', ')', and '-' giving the paired RNA residues`  
`    */`  
`   public static String rnaTopologyString(scala.collection.immutable.List`<PathEntry<NussinovDecision>`> s,int len) {`  
`       //Wrap scala list as a Java collection for ease of use`  
`       List`<PathEntry<NussinovDecision>`> solution = JavaConversions.seqAsJavaList(s);`  
  
`       // All nucleotides are initially unpaired`  
`       StringBuffer str = new StringBuffer(len);`  
`       for(int i=0;i`<len;i++) {
            str.append('-');
        }
 
        // Assign parentheses for paired nucleotides
        for(PathEntry<NussinovDecision>` entry : solution) {`  
`           NussinovDecision decision = entry.decision();`  
`           if( decision.move() == NussinovState.PAIR() ) { // focus on nucleotide pairs`  
`               Idx pair = decision.idx(); // stores indices of the bound pair`  
`               str.setCharAt(pair.i(), '(');`  
`               str.setCharAt(pair.j(), ')');`  
`           }`  
`       }`  
  
`       return str.toString();`  
`   }`  
`}`

Running the code produces the following output:

`UGGGAAGGUUUUGGAACCC`  
`-(((((--))((--)))))`
