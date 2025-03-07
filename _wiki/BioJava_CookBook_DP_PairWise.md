---
title: BioJava:CookBook:DP:PairWise
permalink: wiki/BioJava%3ACookBook%3ADP%3APairWise
---

How do I generate a pair-wise alignment?
----------------------------------------

A very common task in bioinformatics is the alignment of two sequences
also known as a 'pair-wise alignment'. Two common algorithms to generate
pairwise alignments are the [Needleman-Wunsch and Smith-Waterman
algorithms](http://biojava.org/wiki/BioJava:CookBook:DP:PairWise2) which
generate global and local alignments respectively.

Alternatively, you can easily perform a pairwise alignment (either
global or local) using a pretty simple markov model that can be quickly
generated using the very powerful `org.biojava.bio.dp` package provided
in biojava.

A simple markov model that produces pairwise alignments is shown in the
classic book "Biological Sequence Analysis" by Durbin *et al.* (page
30). The model consists of 3 states (see the diagram below).

[frame|center|The Simple Markov Model's
diagram](image:Pairwise.png "wikilink")

The Match (M) state emits pairs of symbols and is heavily weighted to
emit pairs of identical symbols (a match). It can also emit pairs of
mismatched symbols (a mismatch). The code below treats all mismatches
equally, however by using different probabilities for each mismatch one
can generate the equivalent of a substitution matrix. There are two
insert states (I1 and I2) which emit a symbol-gap pair or a gap-symbol
pair respectively. These are the equivalent of a gap in the query or
subject sequence. The star shaped state is the start and finish point.
In biojava this is called the 'magical' state.

By giving equal chance of moving from the magical state to any of the 3
states and back again you are performing a local alignment as you are
not heavily penalising trailing gaps. (Technically this is not quite
right cause you are still favouring matches but it is as close as you
can get with this simple model). If you favoured moving to (and
returning from) the match state you would be performing a global
alignment. By giving a different weight to the extension of a gap
(pExtGap) than you give to the creation of a gap you are generating an
affine gap penalty.

The example below uses a DNA alphabet but there is no reason why you
cannot use a protein alphabet. You could even use a higher-order
conditional-alphabet which would emit matches and gaps based on
conditional n-mers. Try that with Smith-Waterman! Alternatively the
match alphabet could be (Protein x (DNA x DNA x DNA)) which would be
good for matching protein sequences to DNA sequences (similar to parts
of Ewan Birney's GeneWise model).

The transition and emission weights set below are pretty arbitrary. To
generate something robust you would want to train your model on several
trusted alignments. One of the nice features of a customizable model
like this is you can train it off the family of proteins that you are
interested in, making for a highly specialised pair-wise aligner. I made
one that specialised in aligning dengue virus genomes!? You could even
add extra states to represent areas of poor alignment (add another Match
state that doesn't give so much weight to pairs of equal symbols, eg
don't penalise mismatches so heavily), you could transition to extra gap
states with very high self-transition probability to mimic double affine
gaps if you want to match cDNA to genomic DNA with introns. Why not even
add some for splice sites and a promoter model and, hey presto, you have
a gene-finder. The possibilities are endless.

### PairAlign.java

```java /\*

`* PairAlign.java`  
`*`  
`* Created on July 7, 2005, 10:47 AM`  
`*/`

package dp;

import java.io.BufferedReader; import java.io.File; import
java.io.FileReader; import java.util.Collections; import
java.util.Iterator; import java.util.List; import
org.biojava.bio.Annotation; import org.biojava.bio.BioError; import
org.biojava.bio.dist.Distribution; import
org.biojava.bio.dist.DistributionFactory; import
org.biojava.bio.dist.GapDistribution; import
org.biojava.bio.dist.PairDistribution; import
org.biojava.bio.dist.UniformDistribution; import org.biojava.bio.dp.DP;
import org.biojava.bio.dp.DPFactory; import
org.biojava.bio.dp.EmissionState; import org.biojava.bio.dp.MarkovModel;
import org.biojava.bio.dp.ScoreType; import
org.biojava.bio.dp.SimpleEmissionState; import
org.biojava.bio.dp.SimpleMarkovModel; import
org.biojava.bio.dp.StatePath; import
org.biojava.bio.dp.twohead.CellCalculatorFactoryMaker; import
org.biojava.bio.dp.twohead.DPInterpreter; import
org.biojava.bio.seq.DNATools; import org.biojava.bio.seq.Sequence;
import org.biojava.bio.seq.SequenceIterator; import
org.biojava.bio.seq.io.SeqIOTools; import
org.biojava.bio.seq.io.SymbolTokenization; import
org.biojava.bio.symbol.AlphabetManager; import
org.biojava.bio.symbol.BasisSymbol; import
org.biojava.bio.symbol.FiniteAlphabet; import
org.biojava.bio.symbol.IllegalSymbolException; import
org.biojava.bio.symbol.Symbol; import org.biojava.bio.symbol.SymbolList;

/\*\*

`* PairAlign performs pairwise alignments between two or more DNA sequences`  
`* along the lines of a local alignment (Smith-Waterman alignment). It serves`  
`* as a template for how you would perform a global alignment, a protein-protein`  
`* alignment or even a protein - codon alignment. By modifying the architecture`  
`* of the HMM you could easily introduce subtleties like double affine `  
`* gap penalties.`  
`* `

`* This program is derived from Matthew Pocock's original example in the`  
`* demos section of biojava. It has been simplified and documented. It also`  
`* corrects a few bugs in the design of the original model that, while not`  
`* technically incorrect, probably didn't behave as the author intended.`  
`*`  
`* @author Mark Schreiber`  
`*/`

public class PairAlign {

` /**`  
`  * Method two run the program. You should provide two string arguments, one`  
`  * is the name of the file containing query sequences. The other is the name`  
`  * of the file containing the sequences to be searched against. In a real program`  
`  * you should also provide the probability of a match and the probability of`  
`  * a gap extension. These are hard coded in this example.`  
`  */  `  
` public static void main(String [] args) {`  
`   try {`  
`     if(args.length != 2) {`  
`       throw new Exception("Use: PairwiseAlignment sourceSeqFile targetSeqFile\n");`  
`     }`

`     File sourceSeqFile = new File(args[0]);`  
`     File targetSeqFile = new File(args[1]);`  
`     FiniteAlphabet alpha = DNATools.getDNA();`  
`     `  
`     CellCalculatorFactoryMaker cfFactM = new DPInterpreter.Maker();`  
`     DPFactory fact = new DPFactory.DefaultFactory(cfFactM);`  
`     `  
`     /*`  
`      * Generate a model with a pMatch of 0.7 and a pGapExtension of 0.8.`  
`      * From these two numbers we can derive that pMatch -> pGap `  
`      * transition = 0.3 (approximately), pGap -> pMatch = 0.2 (approximately)`  
`      * etc.`  
`      */`  
`     MarkovModel model = generateAligner(`  
`             alpha, 0.7, 0.6);`  
`     `  
`     // create the DP that will align sequences to the model`  
`     DP aligner = fact.createDP(model);`  
`     `  
`     //read the query sequences.`  
`     SequenceIterator sourceI = SeqIOTools.readFastaDNA(`  
`             new BufferedReader(new FileReader(sourceSeqFile)));`  
`     `  
`     //for each query sequence...`  
`     while(sourceI.hasNext()) {`  
`       Sequence sourceSeq = sourceI.nextSequence();`  
`       `  
`       // ...compare it to every target sequence`  
`       SequenceIterator targetI = SeqIOTools.readFastaDNA(`  
`             new BufferedReader(new FileReader(targetSeqFile)));`  
`       `  
`       while(targetI.hasNext()) {`  
`         Sequence targetSeq = targetI.nextSequence();`  
`         Sequence [] seqs = new Sequence [] {`  
`           sourceSeq, targetSeq`  
`         };`  
`         System.out.println(`  
`           "Aligning " + sourceSeq.getName() + ":" + targetSeq.getName()`  
`         );`

`         //find the most probable path through the model for the two sequences`  
`         StatePath result = aligner.viterbi(seqs, ScoreType.PROBABILITY);`  
`         //calculate the log odds of the alignment`  
`         System.out.println("Log odds Viterbi probability:\t" + result.getScore());`  
`         System.out.println("\t" + result.getScore());`  
`         `  
`         `  
`         //output the alignment`  
`         SymbolList alignment = result.symbolListForLabel(StatePath.SEQUENCE);`  
`         System.out.println(alignment.getAlphabet());`  
`         SymbolTokenization tok = alignment.getAlphabet().getTokenization("default");`  
`         System.out.println(tok.tokenizeSymbolList(alignment));`  
`         `  
`         //output the state path`  
`         alignment = result.symbolListForLabel(StatePath.STATES);`  
`         System.out.println(alignment.getAlphabet());`  
`         tok = alignment.getAlphabet().getTokenization("default");`  
`         System.out.println(tok.tokenizeSymbolList(alignment));`  
`         tokenizePath(result);`  
`       }`  
`     }`  
`   } catch (Throwable t) {`  
`     t.printStackTrace();`  
`     System.exit(1);`  
`   }`  
` }`  
` `  
` /**`  
`  * Generates the Markov model that will be used for the alignment. `

The

`  * pMatch is the probability of a match (technically the prob of a match `  
`  * extending itself). If you set this to a high number gaps will be infrequent.`  
`  * `

`  * pExtendGap is the gap extension probability. The is not the penalty for`  
`  * gap opening as that is dependant on the value of pMatch, rather it is the`  
`  * probability of extending a gap which is similar to the affine gap penaly`  
`  * used in Smith-Waterman and other algorithms.`  
`  */`  
` private static MarkovModel generateAligner(`  
`   FiniteAlphabet alpha, double pMatch, double pExtendGap) throws Exception {`  
`   `  
`   `  
`   FiniteAlphabet dna = alpha;`  
`   FiniteAlphabet dna2 =`  
`     (FiniteAlphabet) AlphabetManager.getCrossProductAlphabet(`  
`       Collections.nCopies(2, dna));`  
`     `  
`   MarkovModel model = new SimpleMarkovModel(2, dna2, "pair-wise aligner");`  
`   `  
`   //the background distribution, for DNA it represents random, but for protein`  
`   //or highly biased background composition it should be calculated.`  
`   Distribution nullModel = new UniformDistribution(dna);`  
`   //the emission distribution that emits gaps for the insert states`  
`   Distribution gap = new GapDistribution(dna);`  
`   //the emission distribution that emits pairs of matched (or mismatched) symbols`  
`   Distribution matchDist = generateMatchDist((FiniteAlphabet) dna2);`  
`   //the distribution that emits nucleotide/gap pairs`  
`   Distribution insert1Dist = new PairDistribution(nullModel, gap);`  
`   //the distribution that emits gap/nucleotide pairs`  
`   Distribution insert2Dist = new PairDistribution(gap, nullModel);`  
`   `  
`   //-----create the states-----//`  
`   `  
`   //state that emits matches (or mismatches) of nucleotide pairs`  
`   EmissionState match = new SimpleEmissionState(`  
`     "match",`  
`     Annotation.EMPTY_ANNOTATION,`  
`     new int [] { 1, 1 },`  
`     matchDist`  
`   );`  
`   //state the emits nucleotide/gap pairs (gaps in the target sequence)`  
`   EmissionState insert1 = new SimpleEmissionState(`  
`     "insert1",`  
`     Annotation.EMPTY_ANNOTATION,`  
`     new int [] { 1, 0 },`  
`     insert1Dist`  
`   );`  
`   //state the emits gap/nucleotide pairs (gaps in the query sequence)`  
`   EmissionState insert2 = new SimpleEmissionState(`  
`     "insert2",`  
`     Annotation.EMPTY_ANNOTATION,`  
`     new int [] { 0, 1 },`  
`     insert2Dist`  
`   );`  
`   `  
`   //add the states to the model`  
`   model.addState(match);`  
`   model.addState(insert1);`  
`   model.addState(insert2);`  
`   `  
`   //these transitions will begin the model`  
`   model.createTransition(model.magicalState(), insert1);`  
`   model.createTransition(model.magicalState(), insert2);`  
`   model.createTransition(model.magicalState(), match);`  
`   `  
`   //these transitions will terminate the model`  
`   model.createTransition(insert1, model.magicalState());`  
`   model.createTransition(insert2, model.magicalState());`  
`   model.createTransition(match, model.magicalState());`  
`   `  
`   //self transitions`  
`   model.createTransition(match, match); //extend the match`  
`   model.createTransition(insert1, insert1); //extend a gap`  
`   model.createTransition(insert2, insert2); //extend a gap`  
`   `  
`   model.createTransition(match, insert1); //insert a gap`  
`   model.createTransition(match, insert2); //insert a gap`  
`   model.createTransition(insert1, match); //back to matching again`  
`   model.createTransition(insert2, match); //back to matching again`  
`   `  
`   //----Transition probabilities---//`

`   /*`  
`    * using equal probs of starting in match or insert is a bit like`  
`    * a local alignment. As there are two insert states they get 0.25`  
`    * each while match gets 0.5`  
`    */`  
`   model.getWeights(model.magicalState()).setWeight(match, 0.5);`  
`   model.getWeights(model.magicalState()).setWeight(insert1, 0.25);`  
`   model.getWeights(model.magicalState()).setWeight(insert2, 0.25);`

`   Distribution dist;`  
`   `  
`   /*`  
`    * This is the small probability terminating (transition to magical) from`  
`    * any state. The weight is made up as the viterti can only terminate`  
`    * when it runs out of sequence but there has to be a probability to assign`  
`    * to this event which must be subtracted from the total available for `  
`    * other transitions.`  
`    */`  
`   double pEnd = 0.01;`  
`   `  
`   //----Transition probabilities from the match state`  
`   dist = model.getWeights(match);`  
`   //probability of self transition from match`  
`   dist.setWeight(match, pMatch);`  
`   //probability of transtion from match to insert in seq1`  
`   dist.setWeight(insert1, (1.0 - pMatch - pEnd)/2.0);`  
`   //probability of transtion from match to insert in seq2`  
`   dist.setWeight(insert2, (1.0 - pMatch - pEnd)/2.0);`  
`   //the chance of terminating from a match state`  
`   dist.setWeight(model.magicalState(), pEnd);`

`   //----Transition probabilites from the 1st insert state`  
`   dist = model.getWeights(insert1);`  
`   //probability of self transition (gap extension)`  
`   dist.setWeight(insert1, pExtendGap);`  
`   //probability of transition to match`  
`   dist.setWeight(match, 1.0 - pEnd - pExtendGap);`  
`   //probability of terminating after a gap`  
`   dist.setWeight(model.magicalState(), pEnd);`

`   //----Transition probabilites from the 2nd insert state`  
`   dist = model.getWeights(insert2);`  
`   //probability of self transition (gap extension)`  
`   dist.setWeight(insert2, pExtendGap);`  
`   //probability of transition to match`  
`   dist.setWeight(match, 1.0 - pEnd - pExtendGap);`  
`   //probability of terminating after a gap`  
`   dist.setWeight(model.magicalState(), pEnd);`  
`   `  
`   return model;`  
` }`  
` `  
` /**`  
`  * This generates the probabilistic equivalent of a substitution matrix.`  
`  * A "match" gets a high probability while mismatches`  
`  * are penalised by giving them low probabilities. Because the alignment is`  
`  * DNAxDNA the mismatches are all equally bad. If it were protein it would be`  
`  * sensible to give some mismatches higher probabilities than others along`  
`  * the lines of the PAM or BLOSUM matrices.`  
`  */`  
` private static Distribution generateMatchDist(FiniteAlphabet dna2)`  
` throws Exception {`  
`   Distribution dist = DistributionFactory.DEFAULT.createDistribution(dna2);`  
`   int size = dna2.size();`  
`   int matches = (int) Math.sqrt(size);`  
`   `  
`   //the probability of a match.`  
`   double pMatch = 0.7;`  
`   `  
`   double matchWeight = pMatch / matches;`  
`   double missWeight = (1.0 - pMatch) / (size - matches);`  
`   `  
`   for(Iterator i = dna2.iterator(); i.hasNext(); ) {`  
`     BasisSymbol cps = (BasisSymbol) i.next();`  
`     List sl = cps.getSymbols();`  
`     if(sl.get(0) == sl.get(1)) {`  
`       dist.setWeight(cps, matchWeight);`  
`     } else {`  
`       dist.setWeight(cps, missWeight);`  
`     }`  
`   }`  
`   `  
`   return dist;`  
` }`  
` `  
` private static void tokenizePath(StatePath path) throws IllegalSymbolException{`  
`     SymbolList states = path.symbolListForLabel(StatePath.STATES);`  
`     SymbolList symbols = path.symbolListForLabel(StatePath.SEQUENCE);`  
`     StringBuilder queryString = new StringBuilder();`  
`     StringBuilder targetString = new StringBuilder();`  
`     StringBuilder pathString = new StringBuilder();`  
`           `  
`     if(states.length() != symbols.length())`  
`         throw new BioError("State path lengths should be identical");`  
`     `  
`     char queryToken = " "; char targetToken = " "; char pathToken = " ";`  
`     `  
`     for(int i = 1; i < symbols.length(); i++){`  
`         //tokenize the DNAxDNA symbol           `  
`         //could actually be an AtomicSymbol but Basis covers both bases : )`  
`         BasisSymbol doublet = (BasisSymbol)symbols.symbolAt(i);`  
`         List sl = doublet.getSymbols();`  
`         queryToken = DNATools.dnaToken( (Symbol)sl.get(0) );`  
`         targetToken = DNATools.dnaToken( (Symbol)sl.get(1) );`  
`         `  
`         //tokenize the state path`  
`         Symbol s = states.symbolAt(i);`  
`         //if there is an exact match return the "+" character`  
`         if (s.getName() == "match" && queryToken == targetToken){`  
`             pathToken = "+";`  
`         }else{`  
`             pathToken = " ";`  
`         }`  
`         `  
`         queryString.append(queryToken);`  
`         pathString.append(pathToken);`  
`         targetString.append(targetToken);`  
`     }`  
`     System.out.println(queryString);`  
`     System.out.println(pathString);`  
`     System.out.println(targetString);`  
` }`

} ```
