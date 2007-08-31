---
title: BioJava:PhyloSOC07 doc
---

<Documentation for the PhyloSoC2007>
------------------------------------

**Treesbolck.java (biojavax\\bio\\phylo\\io\\nexus\\Treesblock.java)**

------------------------------------------------------------------------

**getTree**

getTree method takes in a label from the user and returns a tree that
matches the label. For example, if you want to get a tree labeled as
"mammalian" from the TreesBlock t, you can use this method as follows.

`    Object mytree = t.getTree("mammalian");`

'''

From the parsed TreesBlock t, getTree() look up for a specific
"mammalian" tree and returns it as an Object variable.

`    `<Sample Code>  
`                   `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`               `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`                `  
`    public class SampleGetTree{`  
`                                               `  
`       public static void main(String [] args) throws Exception {  `  
`                                                                                   `  
`        String label = "sample";`  
`            TreesBlock sample_tree = new TreesBlock();`  
`            TreesBlock.NewickTreeString temp = new TreesBlock.NewickTreeString();`  
`            Object sample;`  
`                                                   `  
`            temp.setTreeString("( 1, ( 2, 3))");`  
`            sample_tree.addTree( "sample", temp); `  
`            // add a tree w/ label "sample" and NewickTreeString (1,(2,3))`  
`                                                               `  
`            sample = sample_tree.getTree("sample");`  
`            System.out.println(sample.toString());`  
`                                      `  
`       } // end of main `  
`    }                          `

------------------------------------------------------------------------

**addTree (Unweighted Tree)**

addTree is a method to register a new tree to the TreesBlock
(specifically, to the Map of trees). Especially, addTree method for an
unweighted tree takes in a tree label as well as a tree graph, that is
represented as undirectedGraph (unweighted, as well) in JGraphT. From
this sample code, you can see how to generate a unweighted(undirected)
graph in terms of JGraphT and how to call a addTree method.

`    `<Sample Code>  
`    //package NexParser;`  
`                   `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`                   `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`                   `  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`                   `  
`    public class SampleUnweightedAddTree{`  
`                               `  
`         public static void main(String [] args) throws Exception {    `  
`                               `  
`              String label = "sample";`  
`              UndirectedGraph`<String, DefaultEdge>` jg = new SimpleGraph`<String, DefaultEdge>`(DefaultEdge.class);`  
`              TreesBlock sample_tree = new TreesBlock();`  
`                             `  
`              String v1 = "1";`  
`              String v2 = "p1";`  
`              String v3 = "2";  // parental node for v1 & v2`  
`              String v4 = "3";`  
`              String v5 = "p2";`  
`                                       `  
`              jg.addVertex(v1);`  
`              jg.addVertex(v2);`  
`              jg.addVertex(v3);`  
`              jg.addVertex(v4);`  
`              jg.addVertex(v5);`  
`                                       `  
`              jg.addEdge(v1,v2);`  
`              jg.addEdge(v2,v3);`  
`              jg.addEdge(v2,v5);`  
`              jg.addEdge(v5,v4);`  
`                                                                              `  
`              sample_tree.addTree(label, jg);`  
`                                       `  
`          } // end of main`  
`    }`  
`                             `  
`                             `

------------------------------------------------------------------------

**addTree (Weighted Tree)**

The only differnce between weighted and unweithed version of addTree
methods is that they use different graph type. For a weighted tree, you
should generate a graph as a WeightedGraph as in the following sample
code, then use if for a addTree method.

`    `<Sample Code>  
`                   `  
`    //package NexParser;`  
`                   `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`                   `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`                   `  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`                   `  
`    public class SampleWeightedAddTree{`  
`                   `  
`         public static void main(String [] args) throws Exception {    `  
`                   `  
`              String label = "sample";`  
`              WeightedGraph`<String, DefaultWeightedEdge>` jg = new SimpleWeightedGraph`<String, DefaultWeightedEdge>`(DefaultWeightedEdge.class);`  
`              TreesBlock sample_tree = new TreesBlock();`  
`                        `  
`              String v1 = "1";`  
`              String v2 = "p1";`  
`              String v3 = "2";  // parental node for v1 & v2`  
`              String v4 = "3";`  
`              String v5 = "p2";`  
`              String v6 = "4";`  
`              String v7 = "p3";`  
`                                  `  
`              jg.addVertex(v1);`  
`              jg.addVertex(v2);`  
`              jg.addVertex(v3);`  
`              jg.addVertex(v4);`  
`              jg.addVertex(v5);`  
`              jg.addVertex(v6);`  
`              jg.addVertex(v7);`  
`                                           `  
`              jg.addEdge(v1,v2);`  
`              jg.addEdge(v2,v3);`  
`              jg.addEdge(v4,v5);`  
`              jg.addEdge(v5,v6);`  
`              jg.addEdge(v2,v7);`  
`              jg.addEdge(v7,v5);`  
`                                       `  
`              jg.setEdgeWeight(jg.getEdge(v1,v2), 2.0); `  
`              jg.setEdgeWeight(jg.getEdge(v2,v3), 3.0); `  
`              jg.setEdgeWeight(jg.getEdge(v4,v5), 4.0); `  
`              jg.setEdgeWeight(jg.getEdge(v5,v6), 5.0);  `  
`              jg.setEdgeWeight(jg.getEdge(v2,v7), 6.0); `  
`              jg.setEdgeWeight(jg.getEdge(v7,v5), 7.0);`  
`                                           `  
`                                                   `  
`              sample_tree.addTree(label, jg);  `  
`                                   `  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**getTreeAsJGraphT (Unweighted Tree)**

getTreeAsJGraphT is a method which converts a tree from NewickString
type to the graph type in JGraphT. Whereas the Nexus File uses
NewickString type for their tree representation, this method converts
such NewickString into the graph Object in JGraphT. In that JGraphT has
variable tree manipulation methods, this method can be useful when
JGraphT is finally included in the BioJava package. getTreeAsJGraphT
method also has two different version, each for unweighted and weighted
tree.

`    `<Sample Code>  
`    //package NexParser;`  
`                        `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`         `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`         `  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`         `  
`    public class SampleGetTreeAsJgrapht{`  
`               `  
`         public static void main(String [] args) throws Exception {    `  
`                           `  
`              String label = "sample";`  
`              String st = "(1, (2, 3))";     `  
`              String test = null;`  
`              UndirectedGraph`<String, DefaultEdge>` jg = new SimpleGraph`<String, DefaultEdge>`(DefaultEdge.class);`  
`                           `  
`              TreesBlock sample_tree = new TreesBlock();`  
`              TreesBlock.NewickTreeString s = new TreesBlock.NewickTreeString();`  
`                       `  
`              s.setTreeString(st);`  
`              sample_tree.addTree("test", s);`  
`               `  
`              jg = sample_tree.getTreeAsJGraphT("test");   `  
`                       `  
`              System.out.println(st);`  
`              System.out.println(jg.toString());`  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**getTreeAsJGraphT (Weighted Tree)**

This is a weighted tree version of getTreeAsJGraphT method.
WeightedGraph is used here as in the addTree method for weighted tree.

`    `<Sample Code>  
`                   `  
`    //package NexParser;`  
`                   `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`              `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`              `  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`              `  
`    public class SampleGetTreeAsWeightedJgrapht{`  
`                       `  
`         public static void main(String [] args) throws Exception {    `  
`                       `  
`              String label = "sample";`  
`              String st = "((1:2.0, 2:3.0):2.0, 3:5.0)";`  
`              String test = null;`  
`              WeightedGraph`<String, DefaultWeightedEdge>` jg = new SimpleWeightedGraph`<String, DefaultWeightedEdge>`(DefaultWeightedEdge.class);`  
`                       `  
`              TreesBlock sample_tree = new TreesBlock();`  
`              TreesBlock.NewickTreeString s = new TreesBlock.NewickTreeString();`  
`                       `  
`              s.setTreeString(st);`  
`              sample_tree.addTree("test", s);`  
`               `  
`              jg = sample_tree.getTreeAsWeightedJGraphT("test");   `  
`                   `  
`              System.out.println(st);`  
`              System.out.println(jg.toString());`  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**MultipleHitCorrection.java(biojavax\\bio\\phylo\\MultipleHitCorrection.java)**

*As the time of divergence between two sequences increases the
probability of a second substitution at any one nucleotide site
increases and the increase in the count of differences is slowed. This
makes these counts not a desirable measure of distance. In some way,
this slow down must be accounted for. The solution to this problem was
first noted by Jukes and Cantor (1969; Evol.of Protein Molecules,
Academic Press)*

------------------------------------------------------------------------

**JukesCantor**

According to the model of Jukes and Cantor [9] each base in the DNA
sequence has an equal chance of mutating, and when it does, it is
replaced by some other nucleotide uniformly. Here is the equation used
in this method.

`    K = -(3/4)*ln(1-(4/3)*p),    p = prob. of two sequences to have different base at certain position`

As you can see in the sample code, you need to use two string variables
as parameters.(You can easily extract this sequence string from the
nexus CharactersBlock.java) Then, the method returns their corrected
distance as a (double) number.

`    `<sample code>  
`                                                       `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`                   `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`              `  
`    public class SampleJukesCantor{`  
`           `  
`         public static void main(String [] args) throws Exception {    `  
`               `  
`         String t1 = "ACATA GAGGG TACCT CTAAG";`  
`         String t2 = "ACTTA GAGGC TACCT CTACG";`  
`         double Kd;`  
`              `  
`         Kd = MultipleHitCorrection.JukesCantor(t1, t2);`  
`         System.out.println("Result: "+ Kd);`  
`         `  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**Kimura's 2-parameter**

*Note that this(Jukes-Cantor model) still does not correct for
differences in the rates of transition and transversion. To do this you
can use what is called the Kimura 2-parameter correction. This was a
method established by Kimura (1980; J.Mol.Evol. 16:111-120) where the
rates of transitions are assumed to be alpha and the rates of
transversions are beta.*

As an extension of JC model, evolutionary distance in kimura's model is
calculated by the following equation.

`   K = (1/2)*ln(1/(1-2p-q)) + (1/4)*ln(1/(1-2q)),`  
`   `  
`   p: proportion of diff. transition`  
`   q: proportion of diff. transversion`

`    `<sample code>  
`                                            `  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`         `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`                                                    `  
`    public class SampleKimuraTwoParameter{`  
`                                                                       `  
`         public static void main(String [] args) throws Exception {    `  
`                                                                                                                                                                                              `  
`         String t1 = "ACATA GAGGG TACCT CTAAG";`  
`         String t2 = "ACTTA GAGGC TACCT CTACG";`  
`         double Kd;`  
`              `  
`         Kd = MultipleHitCorrection.KimuraTwoParameter(t1, t2);`  
`         System.out.println("Result: "+ Kd);`  
`         `  
`         } // end of main`  
`         `  
`    }`

------------------------------------------------------------------------

**DistanceBasedTreeMethod.java(biojavax\\bio\\phylo\\DistanceBasedTreeMethod.java)**

------------------------------------------------------------------------

**UPGMA**

*The UPGMA is the simplest method of tree construction. It was
originally developed for constructing taxonomic phenograms, i.e. trees
that reflect the phenotypic similarities between OTUs, but it can also
be used to construct phylogenetic trees if the rates of evolution are
approximately constant among the different lineages. For this purpose
the number of observed nucleotide or amino-acid substitutions can be
used. UPGMA employs a sequential clustering algorithm, in which local
topological relationships are identifeid in order of similarity, and the
phylogenetic tree is build in a stepwise manner. We first identify from
among all the OTUs the two OTUs that are most similar to each other and
then treat these as a new single OTU. Such a OTU is referred to as a
composite OTU. Subsequently from among the new group of OTUs we identify
the pair with the highest similarity, and so on, until we are left with
only two OTUs. (http://www.icp.ucl.ac.be/~opperd/private/upgma.html)*

These are the steps in the actual code.

`    1. finding shortest distance within distance matrix`  
`    2. calculate branch lengths as distance/2`  
`    3. build a sub-tree for that pair`  
`    4. collapse a pair (changes distance into 0)`  
`    5. repeat process expanding/combining trees `

`    `<sample code>  
`    import java.io.*;`  
`    import java.lang.*;`  
`    import java.util.*;`  
`         `  
`    import org.biojavax.bio.phylo.io.nexus.*;`  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`         `  
`    public class SampleUPGMA{`  
`           `  
`         public static void main(String [] args) throws Exception {`  
`                   `  
`         if(args.length != 1) {`  
`              System.out.println("Usage: java SamleUPGMA [nexus file name]");`  
`              return;`  
`         }`  
`                   `  
`         String current_block_name;`  
`              `  
`         File inputFile = new File(args[0]);`  
`         NexusFileBuilder builder = new NexusFileBuilder();`  
`         NexusFileFormat.parseFile(builder, inputFile);`  
`         NexusFile parsedFile = builder.getNexusFile();`  
`         WeightedGraph`<String, DefaultWeightedEdge>` a =  new SimpleWeightedGraph`<String, DefaultWeightedEdge>`(DefaultWeightedEdge.class);`  
`               `  
`                   `  
`         TaxaBlock t = new TaxaBlock();`  
`         CharactersBlock ch = new CharactersBlock();`  
`                   `  
`         //You can then iterate the blocks in the NEXUS file like this:`  
`               `  
`         for (Iterator i = parsedFile.blockIterator(); i.hasNext();) {`  
`                               `  
`              NexusBlock block = (NexusBlock)i.next();`  
`              current_block_name = block.getBlockName();`  
`                       `  
`              if(current_block_name.equals("TAXA")){`  
`                   t = (TaxaBlock)block;`  
`              }else if(current_block_name.equals("CHARACTERS")){`  
`                   ch = (CharactersBlock)block;`  
`              }`  
`         }`  
`                   `  
`         System.out.println("By UPGMA Method: \n");`  
`         a = DistanceBasedTreeMethod.Upgma(t, ch);`  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**Neighbor-Joining Method**

*Neighbor-joining (Saitou and Nei, 1987) is a method that is related to
the cluster method but does not require the data to be ultrametric. In
other words it does not require that all lineages have diverged by
eaqual amounts. The method is especially suited for datasets comprising
lineages with largely varying rates of evolution. It can be used in
combination with methods that allow correction for superimposed
substitutions.*

*The neighbor-joining method is a special case of the star decomposition
method. In contrast to cluster analysis neighbor-joining keeps track of
nodes on a tree rather than taxa or clusters of taxa. The raw data are
provided as a distance matrix and the initial tree is a star tree. Then
a modified distance matrix is constructed in which the separation
between each pair of nodes is adjusted on the basis of their average
divergeance from all other nodes. The tree is constructed by linking the
least-distant pair of nodes in this modified matrix. When two nodes are
linked, their common ancestral node is added to the tree and the
terminal nodes with their respective branches are removed from the tree.
This pruning process converts the newly added common ancestor into a
terminal node on a tree of reduced size. At each stage in the process
two terminal nodes are replaced by one new node. The process is complete
when two nodes remain, separated by a single branch. (from wikipedia)*

Here is the actual step for the implementation.

`    1. S = total branch length of tree`  
`    2. separate pair of taxa from all others`  
`    3. choose pair of taxa that minimizes S`  
`    4. build a sub-tree for that pair`  
`    5. collapse pair as distance and recalculate distance matrix`  
`    6. next pair that gives smallest S is chosen`  
`    7. repeat until complete`

As in the UPGMA method, you need to extract CharactersBlock & TaxaBlock
from the Nexus File. Then, you can call this method using those blocks
as parameters to get a reconstructed tree as a graph.

`    `<sample code>  
`              `  
`    import org.jgrapht.*;`  
`    import org.jgrapht.graph.*;`  
`                   `  
`                   `  
`    public class SampleNJ{`  
`                       `  
`         public static void main(String [] args) throws Exception {`  
`                   `  
`         if(args.length != 1) {`  
`              System.out.println("Usage: java SampleNJ [nexus file name]");`  
`              return;`  
`         }`  
`               `  
`         String current_block_name;`  
`               `  
`         File inputFile = new File(args[0]);`  
`         NexusFileBuilder builder = new NexusFileBuilder();`  
`         NexusFileFormat.parseFile(builder, inputFile);`  
`         NexusFile parsedFile = builder.getNexusFile();`  
`         WeightedGraph`<String, DefaultWeightedEdge>` a =  new SimpleWeightedGraph`<String, DefaultWeightedEdge>`(DefaultWeightedEdge.class);`  
`               `  
`              `  
`         TaxaBlock t = new TaxaBlock();`  
`         CharactersBlock ch = new CharactersBlock();`  
`              `  
`         //You can then iterate the blocks in the NEXUS file like this:`  
`           `  
`         for (Iterator i = parsedFile.blockIterator(); i.hasNext();) {`  
`                        `  
`              NexusBlock block = (NexusBlock)i.next();`  
`              current_block_name = block.getBlockName();`  
`                       `  
`              if(current_block_name.equals("TAXA")){`  
`                   t = (TaxaBlock)block;`  
`              }else if(current_block_name.equals("CHARACTERS")){`  
`                   ch = (CharactersBlock)block;`  
`              }`  
`         }`  
`         `  
`         System.out.println("By Neighbor-Joining Method: \n");`  
`         a = DistanceBasedTreeMethod.NeighborJoining(t, ch);`  
`         } // end of main`  
`    }`  

------------------------------------------------------------------------

**ParsimonyTreeMethod.java(biojavax\\bio\\phylo\\ParsimonyTreeMethod.java)**

------------------------------------------------------------------------

Implementing Parsimony was a very big hurdle that I bumped into during
the project. Because of its exponentially growing complexity,
implementing, it has been decided to modify the plan. Instead of
implementing the whole algorithm, it has been decided to build a wrapper
class which connects BioJava to the external program, PHYLIP, which
already provides parsimony methods. For that, ExternalProcess class was
used. (org.biojava.utils.process.ExternalProcess) However,
unfortunately, it couldn't been completed within a GSoC project periods
and remained as a further work to be done. The current status of
Parsimony wrapper class is at the executing dnapars program in Phylip
package. It is needed to be work for extracting the output results from
Phylip and interpreting them.
