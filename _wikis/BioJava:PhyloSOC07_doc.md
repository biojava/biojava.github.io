---
title: BioJava:PhyloSOC07 doc
---

<Documentation for the PhyloSoC2007>
------------------------------------

**Treesbolck.java (biojavax\\bio\\phylo\\io\\nexus\\Treesblock.java)**

------------------------------------------------------------------------

**getTree**

`    public Object getTree(final String label)`  
`          `  
`    Returns a tree for given label`  
`                               `  
`        `**`Parameter:`**` `  
`                                           `  
`              label - the label to select.`  
`                                                   `  
`        `**`Returns:`**` `  
`                                         `  
`              A selected tree by the label.`

`    `<Sample Code>  
`    //package NexParser;`  
`     `  
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
`       } // end of main `  
`    }                          `

------------------------------------------------------------------------

**addTree (Unweighted Tree)**

`    public void addTree(final String label, UndirectedGraph`<String, DefaultEdge>` treegraph)`  
`                              `  
`         Add a tree, converting unweighted graph (JGraphT) to NewickString`  
`                                                         `  
`              `**`Parameter:`**  
`                                                 `  
`                   label     -  the label to add`  
`                   treegraph -  the treegraph (in JGraphT format) to convert.`

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
`                                       `  
`              System.out.println(jg.toString());`  
`                                       `  
`              sample_tree.addTree(label, jg);`  
`                                       `  
`          } // end of main`  
`    }`  
`                             `  
`                             `

------------------------------------------------------------------------

**addTree (Weighted Tree)**

`    public void addTree(final String label, WeightedGraph`<String, DefaultWeightedEdge>` treegraph)`  
`         `  
`         Add a tree, converting weighted graph (JGraphT) to NewickString`  
`                                               `  
`              `**`Parameter:`**  
`                                                          `  
`                   label      -  the label to add`  
`                   treegraph -  the treegraph (in JGraphT format) to convert.`

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
`              System.out.println(jg.toString());`  
`                                                 `  
`              sample_tree.addTree(label, jg);  `  
`                                   `  
`         } // end of main`  
`    }`

------------------------------------------------------------------------

**getTreeAsJGraphT (Unweighted Tree)**

`    public UndirectedGraph`<String, DefaultEdge>` getTreeAsJGraphT(final String label)`  
`         Get given (NewieckString) tree by label, converts it to unweighted graph (JGraphT).`  
`                        `  
`              `**`Parameter:`**  
`                        `  
`                   Label  - label for selecting tree from a Map`  
`                        `  
`              `**`Returns:`**  
`                        `  
`                   converted tree as undirectedGraph`<String, DefaultEdge>

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

`    public WeightedGraph`<String, DefaultWeightedEdge>` getTreeAsWeightedJGraphT(final String label) `  
`                   `  
`         Get given (NewieckString) tree by label, converts it to weighted graph (JGraphT).`  
`                   `  
`              `**`Parameter:`**  
`                        `  
`                   Label  - label for selecting tree from a Map`  
`                        `  
`              `**`Returns:`**  
`                        `  
`                   converted tree as WeightedGraph`<String, DefaultWeightedEdge>

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
