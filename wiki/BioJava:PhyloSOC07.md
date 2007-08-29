---
title: BioJava:PhyloSOC07
---

This page will include all info and docs about our efforts in the 2007
Google Summer of Code as part of the NESCent phyloinformatics group.

**<APIs for BioJava: Project Plan>**

*Week 0 (~ May 20th) :* Building project plan, Program set-up (Java,
Eclipse and BioJava, JGraphT), Reading NEXUS paper, etc.

------------------------------------------------------------------------

**Part I : Development of basic I/O**

------------------------------------------------------------------------

***Week 1 (May 21st ~ May 27th) Development of basic Input***

- Input: Nucleic acid sequences (practice w/ FASTA format and create API
for NEXUS format)

- Initialization: create objects for each sequence

Day 1: Practice w/ FASTA parser -done

Day 2: Getting to know NEXUS parser(1) (read and parse the TAXA,
CHARACTER block) -done

Day 3: Getting to know NEXUS parser(2) (TREE block) -done

Day 4: Tree building practice w/ JGraphT
(http://www.jgrapht.org/javadoc/) -done

Day 5/6: Extend functions for NEXUS parser (parse a tree block and
create tree by JGraphT) -done

------------------------------------------------------------------------

***Week 2 Development of basic Output (May 28th ~ June 3rd)***

- Output file creation in NEXUS format(converting tree object into NEXUS
format)

Day1 & 2 : Finish the NexusToJgraphT code

Day3 : Nexus Tree code for Output(1) (create JgraphT object & Convert it
to Nexus Tree Object) -done (method: AddTree)

Day4 : Nexus Tree code for Output (2) (generating an output string) -
done (testing file: SampleAddTree.java)

Day5 : Nexus Tree code for Output (3) (debugging) -done

Day6 : Documentation -done (getTree, addTree)

------------------------------------------------------------------------

**Part II: Distance method (multiple hit correction method)**

------------------------------------------------------------------------

***Week 3 Jukes-Cantor*** -Devoloping API for Jukes-Cantor method

Day1: Method for Nexus Parser -done(getTreeAsJGraphT)

Day2 :Jukes-Cantor method review & algorithm study & write sample input
file -done

Day3: program development (1) code for pairwise comparison -done

Day4: program development (2) calculate K( \# of nucleotide
substitutions since the divergence) from the pairwise comparison
result -done

`    K = -(3/4)*ln(1-(4/3)*p),    p = prob. of two sequences to have different base at certain position`

Day5: Documentaion & feedback for methods in PartI (getTree, AddTree,
getTreeAsJgrapht) -done

------------------------------------------------------------------------

***Week 4 Kimura's 2-parameter***

Day1: getting to know CVS and upload file -done

Day2: Kimura's 2-parameter model reveiw & write sample input file w/
Nexus Parser - done

Day3: program development: code for differenciate
transition/transversion & Calculate K - done

`    K = (1/2)*ln(1/(1-2p-q)) + (1/4)*ln(1/(1-2q)),`  
`    `  
`    p: proportion of diff. transition`  
`    q: proportion of diff. transversion`

Day4: feedback for Multiple correction methods (JukesCantor, Kimura)

Day5: Reviewing UPGMA & N-J method.

------------------------------------------------------------------------

**Part III: Distance based phylogeny reconstruction**

------------------------------------------------------------------------

***week5 UPGMA method & Neighbor-Joining method***

Day1: code for UPGMA method(1) - building distance matrix (by
JukesCantor or Kimura's 2-parameter)

Day2: code for UPGMA method(2) - calculate branch length & build
weighted sub-tree as JGraphT

Day3: code for UPGMA method(3) - collapsing a pair and rebuild distance
matrix

Day4: code for N-J method(1) - build initial star tree & choose a pair
minizimg total branch length

Day5: code for N-J method(2) - collapse a pair & rebuild distance matrix
& iterate

Day6: Revising code (if necessary)

[UPGMA]

1. finding shortest distance within distance matrix

2. calculate branch lengths as distance/2

3. build a sub-tree for that pair

4. collapse a pair (changes distance into 0)

5. repeat process expanding/combining trees

[N-J]

1. S = total branch length of tree

2. separate pair of taxa from all others

3. choose pair of taxa that minimizes S

4. build a sub-tree for that pair

5. collapse pair as distance and recalculate distance matrix

6. next pair that gives smallest S is chosen

7. repeat until complete

------------------------------------------------------------------------

***Week 6 Documentation for Part I & II & III*** : (JavaDoc and BJ
website)

Day 1: N-J method (1) -done

Day 2: N-J method (2) -done

Day 3: implementing CharactersBlock Parser for UPGMA/N-J method - done

Day 4: Documentation (by format) -done

Day 5: updating wiki page (specifying methods w/ sample codes) - Waiting
for uploading as July 1st.

------------------------------------------------------------------------

**Part III : Maximum Parsimony**

------------------------------------------------------------------------

***Week 7 Maximum Parsimony Method***

Day 1: Implementing Taxa & CharactersBlock for
UPGMA/N-J/MaximumParsimony methods -done

Day 2: Revising AddTree method( for weighted tree) -done (currently
being discussed as well)

Day 3: Revising GetTreeAsJgrapht method( for weighted tree) -done
(currently being discussed as well)

Day 4: Code for Maximum Parsimony Method (1) -done

Input: Read Nexus File & Extract MATRIX data (Align sequences & decide
informative sites)

Day 5: Code for Maximum Parsimony Method (2) -changing plans

Building Data Structure : decide all possible tree structures &
initialize variables for those trees.

------------------------------------------------------------------------

***Week 8 Maximum Parsimony Method***

Day 1: Code for Maximum Parsimony Method (2) - done

Building Data Structure : decide all possible tree structures &
initialize variables for those trees.

Day 2: Code for Maximum Parsimony Method (3) - changing plans iterate
the calculation to dicide a tree

Day 3: Revising AddTree & getTreeAsJGraphT method (to allow both
weighted/unweighted tree) - done

Day 4: Debugging for non-symmetric tree structure (1) - done Day 5:
Debugging for non-symmetric tree structure (2) - done

<Algorithm> 1. aligning sequences

2. decide informative sites (2 or more differences)

3. create tree type and calculate \# of base changes for that tree

4. repeat step 3 for all informative sites

5. for each tree type, add \# of changes for all sites

6. find the tree with smallest number of changes

------------------------------------------------------------------------

***Week 9 Maximum Parsimony Method***

Day 1: Debugging for AddTreeMethod (for the non-symmetric tree
structure) -done

Day 2: Debugging for AddTreeMethod (for the non-symmetric tree
structure) -done

Day 3: Maximum Parsimony Method - solve the problem w/ \# of trees

Day 4: Maximum Parsimony Method - getting help for Jgrapht type array

Day 5: Maximum Parsimony Method -

-   Plan for Maximum Parsimony Method has been changed!

------------------------------------------------------------------------

***Week 10 Maximum Parsimony Method***

------------------------------------------------------------------------

Day 1: Debugging AddTree Method & commit the source code -done

Day 2: PHYLIP installation & learning how to use it - done
(http://evolution.genetics.washington.edu/phylip.html)

Day 3: Practicing PHYLIP with MP/ML/Bootstrap methods - done

Day 4: Developing the wrapper for PHYLIP MP method (1) - parser (done)

Day 5: Developing the wrapper for PHYLIP MP method (2) - builing objects
from the output (to be worked out)

**Part IV : Maximum Likelihood**

------------------------------------------------------------------------

*Week 11 Maxumum Likelihood Method*

Day 1: Developing the wrapper for PHYLIP MP method (1) - parser

Day 2: Developing the wrapper for PHYLIP MP method (2) - builing objects
from the output

Day 3: Developing the wrapper for PHYLIP ML method (1) - parser

Day 4: Developing the wrapper for PHYLIP ML method (2) - builing objects
from the output

Day 5: Debugging

**Part V : Phylogeny supporting method**

*Week 12 Bootstrap method*

------------------------------------------------------------------------

*Week 11 Maxumum Likelihood Method*

Day 1: Developing the wrapper for PHYLIP MP method (2) - execute()
method <debugging>

Day 2: Developing the wrapper for PHYLIP MP method (2) - execute()
method <debugging>

Day 3: Developing the wrapper for PHYLIP MP method (3) - builing objects
from the output

Day 4: Developing the wrapper for PHYLIP ML method (1) - parser

Day 5: Developing the wrapper for PHYLIP ML method (2) - builing objects
from the output

Day 6: Debugging

1. replicate alignments

- taking the original sequence alignment

- entire column is randomly sampled(w/ replacement)

2. for each re-sampled replicate alignment, reconstruct phylogeny based
on the method

3. count the number of replicates that each internal branch of the
original tree is found

*Week 13 Documenting: part IV & V*

[documentation for the methods
[1](http://biojava.org/wiki/BioJava:PhyloSOC07_doc)]
