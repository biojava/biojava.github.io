---
title: BioJava:CookBook:DP:PairWise2
---

How do I generate a global or local alignment with the Needleman-Wunsch- or the Smith-Waterman-algorithm?
---------------------------------------------------------------------------------------------------------

A common approach to perform pairwise sequence alignments is to use the
deterministic algorithms of Needleman-Wunsch and Smith-Waterman.
Needleman and Wunsch defined the problem for global alignments, whereas
Smith and Waterman developed an algorithm for local alignments, which
was the basis for the [BLAST program](http://www.ncbi.nih.gov/BLAST/).
The example below shows how to use the implementation of both algorithms
from the alignment package. It requires BioJava 1.5, which can be
downloaded from the [CVS](http://cvs.biojava.org) for testing purposes.

The idea of these deterministic approaches is to maintain a matrix
representation of an edit graph, which covers the operations insert,
delete, replace and gap extension (insert and delete are gap openings in
the query or the target sequence, respectively). By dynamic programing
the matrix elements are computed, which are costs or scores of the
respective operation. The highest scoring (lowest cost) path through the
matrix gives the best alignment, which can be obtained by tracing back
the matrix elements.

Alignments with different scores/expenses for gap opening and gap
extension (affine gap penalties) consume significantly more time and
memory as with equal scores (costs). The reason for this is that instead
of one matrix three matrices are needed to remember the best path
through the edit graph. Two matrices to remember if a gap has just been
started or has been extended in the query or in the target sequence,
respectively, and a third matrix to remember the optimum of these two
and match/replace operations. All these matrices have the dimension
`query.length()` times `target.length()`.

These implementations of the algorithms need to be initialized with
expenses (costs, penalties) for every edit operation. However, the
substitution matrices use scores, which are the opposit of expenses.
That means one can optain expenses from scores by multiplying them
with -1. Using costs/penalties instead of scores allows to compute the
edit distance for global alignments. This distance doesn't make sense
for local alignments, because in extreme cases a local alignment is an
alignment of one symbol from each sequence and the distance would be
zero, even if the sequences are much longer. This is why local
alignments are based on scores. Nevertheless the constructor of
SmithWaterman needs penalties and not scores.

The super class `SequenceAlignment` of the specific alignment algorithms
already provides a method to format the alignment output. So if you want
to write your own alignment algorithm or to use the [HMM-alignment
algorithm](http://biojava.org/wiki/BioJava:CookBook:DP:PairWise), you
can derive your class from this super class and apply the given method.

Many substitution matrices have been released for the purpose to
evaluate the transition from one symbol to another one. These can be
downloaded at [NCBI](ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/) and are
needed for the following example. Alternatively, the SubstitutionMatrix
class provides a constructor to create your own substitution matrix with
equal **scores** for every match and every replace.

A demo of local and global alignments
-------------------------------------

<java> import java.io.File;

import org.biojava.bio.alignment.NeedlemanWunsch; import
org.biojava.bio.alignment.SequenceAlignment; import
org.biojava.bio.alignment.SmithWaterman; import
org.biojava.bio.alignment.SubstitutionMatrix; import
org.biojava.bio.seq.DNATools; import org.biojava.bio.seq.Sequence;
import org.biojava.bio.symbol.AlphabetManager; import
org.biojava.bio.symbol.FiniteAlphabet;

/\*

`* Created on Mar 28, 2006`  
`*/`

/\*\* This is a demo class that performes both a local and a global
alignment

` * from two given sequences. The result is printed on the screen. `  
` * Therfore a substitution matrix file is required, which can be downloaded`  
` * at {@link `[`ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/`](ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/)`}.`  
` * This demo only works for DNA sequences. However, the alignment algorithms`  
` * are able to use any kind of alphabet as long as there is a substitution`  
` * matrix available. For this example the matrix NUC.4.4 is the best one.`  
` *`  
` * @author Andreas Dräger`  
` */`

public class DeterministicAlignmentDemo {

` /** This performs an alignment of two given sequences and `  
`   * prints the result on the screen.`  
`   * @param args: a query and a target sequence `  
`   *   and one file containing the substitution matrix to be used.`  
`   * {@link `[`ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/`](ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/)`}`  
`   */`  
` public static void main (String args[]) {`  
`   if (args.length < 3)`  
`     throw new Error("Usage: DeterministicAlignmentDemo " +`  
`                     "querySeq targetSeq substitutionMatrixFile");`  
`   try {`  
`     // The alphabet of the sequences. For this example DNA is choosen.`  
`     FiniteAlphabet alphabet = (FiniteAlphabet) AlphabetManager.alphabetForName("DNA");`  
`     // Read the substitution matrix file. `  
`     // For this example the matrix NUC.4.4 is good.`  
`     SubstitutionMatrix matrix = new SubstitutionMatrix(alphabet, new File(args[2]));`  
`     // Define the default costs for sequence manipulation for the global alignment.`  
`     SequenceAlignment aligner = new NeedlemanWunsch( `  
`       0,  // match`  
`       3,  // replace`  
`       2,      // insert`  
`       2,  // delete`  
`       1,      // gapExtend`  
`       matrix  // SubstitutionMatrix`  
`     );`  
`     Sequence query  = DNATools.createDNASequence(args[0], "query");`  
`     Sequence target = DNATools.createDNASequence(args[1], "target");`  
`     // Perform an alignment and save the results.`  
`     aligner.pairwiseAlignment(`  
`       query, // first sequence`  
`       target // second one`  
`     );`  
`     // Print the alignment to the screen`  
`     System.out.println("Global alignment with Needleman-Wunsch:\n" + aligner.getAlignmentString());     `  
`     `  
`     // Perform a local alginment from the sequences with Smith-Waterman. `  
`     // Firstly, define the expenses (penalties) for every single operation.`  
`     aligner = new SmithWaterman(`  
`       -1,     // match`  
`       3,      // replace `  
`       2,      // insert`  
`       2,      // delete`  
`       1,      // gapExtend`  
`       matrix  // SubstitutionMatrix`  
`     );`  
`     // Perform the local alignment.`  
`     aligner.pairwiseAlignment(query, target); `  
`     System.out.println("\nlocal alignment with SmithWaterman:\n" + aligner.getAlignmentString());`  
`   } catch (Exception exc) {`  
`     exc.printStackTrace();`  
`   }`  
` }`

} </java>
