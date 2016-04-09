---
title: GSoC:MSA Design
---

**Design for Alignment in BioJava3**

*Part of <GSoC:MSA> Project by [Mark Chapman](Mark Chapman "wikilink")*

This page has a list of packages, interfaces, and classes to form the
basis of the BioJava3 alignment module. The new module ports *nearly*
all the current BioJava 1.7 alignment features to the BioJava3 standard.
Additional features prepare for the inclusion of multiple sequence
alignments.

The base data structures are immutable for efficiency with extensions to
mutable forms for JavaEE/Bean compliance. Simple factory methods reside
in the static Alignments class. A full interface hierarchy allows for
flexible customization and expansion.

Dependencies
------------

-   org.biojava3.core.sequence.location.template.Location
-   org.biojava3.core.sequence.template.Compound
-   org.biojava3.core.sequence.template.CompoundSet
-   org.biojava3.core.sequence.template.Sequence

org.biojava3.alignment
----------------------

### Alignments

<java>

` class Alignments // static utility`  
`   private Alignments() { } // prevents instantiation`  
`   List`<Pair<S>`> getAllPairsAlignments(List`<S extends Sequence>`)`  
`   int[] getAllPairsScores(List`<? extends Sequence>`)`  
`   Pair`<S extends Sequence>` getPairwiseAlignment(S, S)`  
`   int getPairwiseScore(Sequence, Sequence)`  
`   Profile`<S>` getMultipleSequenceAlignment(List`<S extends Sequence>`)`  
`   enum MSAEmulation { CLUSTALW, MUSCLE, KALIGN, CUSTOM }`  
`   class Defaults // static inner class`  
`     MSAEmulation getEmulation()`  
`     GapPenalty getGapPenalty()`  
`     Class`<? extends HierarchicalClusterer>` getHierarchicalClusterer()`  
`     Class`<? extends PairwiseSequenceAligner>` getPairwiseSequenceAligner()`  
`     Class`<? extends PairwiseSequenceScorer>` getPairwiseSequenceScorer()`  
`     Class`<? extends PartitionRefiner>` getPartitionRefiner()`  
`     Class`<? extends ProfileProfileAligner>` getProfileProfileAligner()`  
`     Class`<? extends RescoreRefiner>` getRescoreRefiner()`  
`     SubstitutionMatrix getSubstitutionMatrix()`  
`     void setEmulation(MSAEmulation)`  
`     void setGapPenalty(GapPenalty)`  
`     void setHierarchicalClusterer(Class`<? extends HierarchicalClusterer>`)`  
`     void setPairwiseSequenceAligner(Class`<? extends PairwiseSequenceAligner>`)`  
`     void setPairwiseSequenceScorer(Class`<? extends PairwiseSequenceScorer>`)`  
`     void setPartitionRefiner(Class`<? extends PartitionRefiner>`)`  
`     void setProfileProfileAligner(Class`<? extends ProfileProfileAligner>`)`  
`     void setRescoreRefiner(Class`<? extends RescoreRefiner>`)`  
`     void setSubstitutionMatrix(SubstitutionMatrix)`

</java>

### SimpleGapPenalty

<java>

` class SimpleGapPenalty implements GapPenalty`  
`   SimpleGapPenalty(short, short) // open, extend`

</java>

### SimpleSubstitutionMatrix

<java>

` class SimpleSubstitutionMatrix`<S extends CompoundSet>` implements SubstitutionMatrix`<S>  
`   SimpleSubstitutionMatrix(File) // guess compound set from source`  
`   SimpleSubstitutionMatrix(String) // guess compound set from source`  
`   SimpleSubstitutionMatrix(S, File)`  
`   SimpleSubstitutionMatrix(S, short, short) // identity matrix (ignore or handle ambiguities?)`  
`   SimpleSubstitutionMatrix(S, String)`  
`   SimpleSubstitutionMatrix(S, String, String) // optional name parameter`  
`   String toString()`

</java>

### NeedlemanWunsch

<java>

` class NeedlemanWunsch`<S extends Sequence>` extends AbstractPairwiseSequenceAligner`<S>  
`   NeedlemanWunsch(S, S, GapPenalty, SubstitutionMatrix)`

</java>

### SmithWaterman

<java>

` class SmithWaterman`<S extends Sequence>` extends AbstractPairwiseSequenceAligner`<S>  
`   SmithWaterman(S, S, GapPenalty, SubstitutionMatrix)`

</java>

### FractionalIdentityScorer

<java>

` class FractionalIdentityScorer`<S extends Sequence>` implements PairwiseSequenceScorer`<S>  
`   FractionalIdentityScorer(SequencePair`<S>`)`

</java>

### FractionalSimilarityScorer

<java>

` class FractionalSimilarityScorer`<S extends Sequence>` implements PairwiseSequenceScorer`<S>  
`   FractionalSimilarityScorer(SequencePair`<S>`)`

</java>

### KmersScorer

<java>

` class KmersScorer`<S extends Sequence>` implements PairwiseSequenceScorer`<S>  
`   KmersScorer(S, S, int)`

</java>

### WuManberScorer

<java>

` class WuManberScorer`<S extends Sequence>` implements PairwiseSequenceScorer`<S>  
`   WuManberScorer(S, S, ?) // TODO: not sure of parameters`

</java>

### FractionalIdentityInProfileScorer

<java>

` class FractionalIdentityInProfileScorer`<S extends Sequence>` implements PairInProfileScorer`<S>  
`   FractionalIdentityInProfileScorer(S, S, Profile)`

</java>

### FractionalSimilarityInProfileScorer

<java>

` class FractionalSimilarityInProfileScorer`<S extends Sequence>` implements PairInProfileScorer`<S>  
`   FractionalSimilarityInProfileScorer(S, S, Profile)`

</java>

### GuideTree

<java>

` class GuideTree`<S extends Sequence>  
`   GuideTree(int[], List`<S>`, HierarchicalClusterer) // all pairs score`  
`   int[] getAllPairsScores()`  
`   float[][] getDistanceMatrix()`  
`   Node getRoot()`  
`   int[][] getScoreMatrix()`  
`   class Node`  
`     float getBranchLength1()`  
`     float getBranchLength2()`  
`     Node getChild1()`  
`     Node getChild2()`  
`     Node getParent()`  
`     S getSequence() // null unless isLeaf()`  
`     boolean isLeaf()`

</java>

### StandardRescoreRefiner

<java>

` class StandardRescoreRefiner`<S extends Sequence>` implements RescoreRefiner`<S>  
`   StandardRescoreRefiner(Profile, Class`<? extends PairInProfileScorer<S>`>, Class`<? extends ProfileProfileAligner<S>`>)`

</java>

### DayhoffRescoreRefiner

<java>

` class DayhoffRescoreRefiner`<S extends Sequence>` implements RescoreRefiner`<S>  
`   DayhoffRescoreRefiner(Profile, Class`<? extends PairInProfileScorer<S>`>, Class`<? extends ProfileProfileAligner<S>`>)`

</java>

### SinglePartitionRefiner

<java>

` class SinglePartitionRefiner`<S extends Sequence>` implements PartitionRefiner`<S>  
`   SinglePartitionRefiner(Profile, Class`<? extends ProfileProfileAligner<S>`>)`

</java>

### StochasticPartitionRefiner

<java>

` class StochasticPartitionRefiner`<S extends Sequence>` implements PartitionRefiner`<S>  
`   StochasticPartitionRefiner(Profile, Class`<? extends ProfileProfileAligner<S>`>)`

</java>

### TreeTraversalPartitionRefiner

<java>

` class TreeTraversalPartitionRefiner`<S extends Sequence>` implements PartitionRefiner`<S>  
`   TreeTraversalPartitionRefiner(Profile, Class`<? extends ProfileProfileAligner<S>`>)`

</java>

org.biojava3.alignment.template
-------------------------------

### GapPenalty

<java>

` interface GapPenalty`  
`   enum Type {CONSTANT, LINEAR, AFFINE} // gep = 0, gep = gop, gep != gop ... TODO: add DYNAMIC type`  
`   short getExtensionPenalty()`  
`   short getOpenPenalty()`  
`   Type getType()`  
`   void setExtensionPenalty(short)`  
`   void setOpenPenalty(short)`

</java>

### SubstitutionMatrix

<java>

` interface SubstitutionMatrix`<S extends CompoundSet<C extends Compound>`>`  
`   S getCompoundSet()`  
`   String getDescription()`  
`   short[][] getMatrix()`  
`   String getMatrixAsString()`  
`   short getMaxValue()`  
`   short getMinValue()`  
`   String getName()`  
`   short getValue(C, C)`  
`   void normalizeMatrix(short) // scale`  
`   void setDescription(String)`  
`   void setName(String)`

</java>

### AlignedSequence

<java>

` interface AlignedSequence`<C extends Compound>` extends Sequence`<C>  
`   int getAlignmentIndexAt(int)`  
`   int getEnd()`  
`   Location getLocationInAlignment()`  
`   int getNumGaps()`  
`   Sequence`<C>` getOriginalSequence()`  
`   int getOverlapCount() // if !isCircular() ? == 1 : >= 1`  
`   int getSequenceIndexAt(int)`  
`   int getStart()`  
`   boolean isCircular()`

</java>

### MutableAlignedSequence

<java>

` interface MutableAlignedSequence`<C extends Compound>` extends AlignedSequence`<C>  
`   void setLocation(Location)`  
`   void shiftAtAlignmentLocation(Location, int)`  
`   void shiftAtSequenceLocation(Location, int)`

</java>

### Profile

<java>

` interface Profile`<S extends Sequence<C extends Compound>`> extends Iterable`<S>  
`   AlignedSequence`<C>` getAlignedSequence(int)`  
`   AlignedSequence`<C>` getAlignedSequence(S) // will find either aligned or original sequences`  
`   List`<AlignedSequence<C>`> getAlignedSequences() // unmodifiable unless class implements MutableProfile`  
`   List`<AlignedSequence<C>`> getAlignedSequences(int...) // useful for views`  
`   List`<AlignedSequence<C>`> getAlignedSequences(S...) // useful for views`  
`   C getCompoundAt(int, int)`  
`   C getCompoundAt(S, int) // will find either aligned or original sequences`  
`   List`<C>` getCompoundsAt(int) // useful for views`  
`   CompoundSet`<C>` getCompoundSet()`  
`   int[] getIndicesAt(int) // useful for views`  
`   int getIndexOf(C)`  
`   int getLastIndexOf(C)`  
`   int getLength() // number of columns`  
`   int getSize() // number of rows ... if !isCircular() ? == number of sequences : >= number of sequences`  
`   ProfileView`<S>` getSubProfile(Location) // only include sequences that overlap Location`  
`   boolean isCircular() // if so, sequences longer than length() return multiple compounds at any location`  
`   String toString() // simple view: each sequence on 1 line`  
`   String toString(int) // formatted view: show start and end indices of profile and sequences, limited line length`

</java>

### MutableProfile

<java>

` interface MutableProfile`<S extends Sequence<C extends Compound>`> extends Profile`<S>  
`   // getAlignedSequences modifiable, full iterator with remove`  
`   void setSequences(List`<AlignedSequence<C>`>)`

</java>

### ProfileView

<java>

` interface ProfileView`<S extends Sequence<C extends Compound>`> extends Profile`<S>  
`   int getEnd()`  
`   int getStart()`  
`   Profile`<S>` getViewedProfile()`  
`   String toString() // simple view`  
`   String toString(int) // formatted view`

</java>

### SequencePair

<java>

` interface SequencePair`<S extends Sequence<C extends Compound>`> extends Profile`<S>  
`   C getCompoundInQueryAt(int)`  
`   C getCompoundInTargetAt(int)`  
`   int getIndexInQueryAt(int)`  
`   int getIndexInQueryForTargetAt(int)`  
`   int getIndexInTargetAt(int)`  
`   int getIndexInTargetForQueryAt(int)`  
`   int getNumIdenticals()`  
`   int getNumSimilars()`  
`   AlignedSequence`<C>` getQuery()`  
`   AlignedSequence`<C>` getTarget()`

</java>

### MutableSequencePair

<java>

` interface MutableSequencePair`<S extends Sequence>` extends MutableProfile`<S>`, SequencePair`<S>  
`   void setPair(AlignedSequence`<C>`, AlignedSequence`<C>`)`  
`   void setQuery(AlignedSequence`<C>`)`  
`   void setTarget(AlignedSequence`<C>`)`

</java>

### AbstractSequencePair

<java>

` abstract class AbstractSequencePair`<S extends Sequence>` implements SequencePair`<S>  
`   float getPercentGapsQuery()`  
`   float getPercentGapsTarget()`  
`   float getPercentIdentityQuery()`  
`   float getPercentIdentitySubject()`  
`   float getPercentSimilarityQuery()`  
`   float getPercentSimilaritySubject()`

</java>

### ProfilePair

<java>

` interface ProfilePair`<S extends Sequence>` extends Profile`<S>  
`   Profile`<S>` getQuery()`  
`   Profile`<S>` getTarget()`

</java>

### MutableProfilePair

<java>

` interface MutableProfilePair`<S extends Sequence>` extends MutableProfile`<S>`, ProfilePair`<S>  
`   void setPair(Profile`<S>`, Profile`<S>`)`  
`   void setQuery(Profile`<S>`)`  
`   void setTarget(Profile`<S>`)`

</java>

### Scorer

<java>

` interface Scorer // resides in core module`  
`   int getMaxScore()`  
`   int getMinScore()`  
`   int getScore()`

</java>

### PairwiseSequenceScorer

<java>

` interface PairwiseSequenceScorer`<S extends Sequence>` extends Scorer`  
`   SequencePair`<S>` getPair()`

</java>

### PairInProfileScorer

<java>

` interface PairInProfileScorer`<S extends Sequence>` extends PairwiseSequenceScorer`<S>  
`   Profile`<S>` getProfile()`

</java>

### ProfileProfileScorer

<java>

` interface ProfileProfileScorer`<S extends Sequence>` extends Scorer`  
`   ProfilePair`<S>` getPair()`

</java>

### Aligner

<java>

` interface Aligner`<S extends Sequence>` extends Scorer`  
`   long getComputationTime()`  
`   Profile`<S>` getProfile()`

</java>

### MatrixAligner

<java>

` interface MatrixAligner`<S extends Sequence>` extends Aligner`<S>  
`   short[][] getScoreMatrix()`  
`   short getScoreMatrixAt(int, int)`  
`   String getScoreMatrixAsString()`

</java>

### PairwiseSequenceAligner

<java>

` interface PairwiseSequenceAligner`<S extends Sequence>` extends MatrixAligner`<S>`, PairwiseSequenceScorer`<S>  
`   // combines 2 interfaces`

</java>

### ProfileProfileAligner

<java>

` interface ProfileProfileAligner`<S extends Sequence>` extends MatrixAligner`<S>`, ProfileProfileScorer`<S>  
`   // combines 2 interfaces`

</java>

### RescoreRefiner

<java>

` interface RescoreRefiner`<S extends Sequence>` extends Aligner`<S>`, ProfileProfileScorer`<S>  
`   Class`<? extends PairInProfileScorer<S>`> getPairInProfileScorer()`  
`   Class`<? extends ProfileProfileAligner<S>`> getProfileProfileAligner()`

</java>

### PartitionRefiner

<java>

` interface PartitionRefiner`<S extends Sequence>` extends Aligner`<S>`, ProfileProfileScorer`<S>  
`   Class`<? extends ProfileProfileAligner<S>`> getProfileProfileAligner()`

</java>

### AbstractPairwiseSequenceAligner

<java>

` abstract class AbstractPairwiseSequenceAligner`<S extends Sequence>` implements PairwiseSequenceAligner`<S>  
`   AbstractPairwiseSequenceAligner(S, S, GapPenalty, SubstitutionMatrix)`  
`   GapPenalty getGapPenalty()`  
`   SubstitutionMatrix getSubstitutionMatrix()`

</java>

### AbstractMutablePairwiseSequenceAligner

<java>

` abstract class AbstractMutablePairwiseSequenceAligner`<S extends Sequence>` extends AbstractPairwiseSequenceAligner`<S>` implements MutablePairwiseSequenceAligner`<S>  
`   AbstractMutablePairwiseSequenceAligner()`  
`   AbstractMutablePairwiseSequenceAligner(S, S, GapPenalty, SubstitutionMatrix)`  
`   void setGapPenalty(GapPenalty)`  
`   void setSubstitutionMatrix(SubstitutionMatrix)`

</java>

org.biojava3.alignment.views
----------------------------

### SimpleProfileView

<java>

` class SimpleProfileView`<S extends Sequence>` implements ProfileView`<S>  
`   SimpleProfileView(Profile`<S>`, int, int)`

</java>

### CompoundCountsView

<java>

` class CompoundCountsView`<S extends Sequence>` extends SimpleProfileView`<S>  
`   CompoundCountsView(Profile`<S>`)`  
`   CompoundCountsView(Profile`<S>`, int, int)`  
`   int[] getCompoundCountsAt(int) // returned array is size of CompoundSet`

</java>

### CompoundWeightsView

<java>

` class CompoundWeightsView`<S extends Sequence>` extends SimpleProfileView`<S>  
`   CompoundWeightsView(Profile`<S>`)`  
`   CompoundWeightsView(Profile`<S>`, int, int)`  
`   float[] getCompoundWeightsAt(int) // returned array is size of CompoundSet`

</java>

### ConsensusView

<java>

` class ConsensusView`<S extends Sequence>` extends SimpleProfileView`<S>  
`   ConsensusView(Profile`<S>`)`  
`   ConsensusView(Profile`<S>`, int, int)`  
`   S getConsensusSequence()`

</java>

org.biojava3.core.util
----------------------

### ConcurrencyTools

<java>

` class ConcurrencyTools // static utility`  
`   private ConcurrencyTools() { } // prevents instantiation`  
`   ExecutorService getThreadPool()`  
`   void setThreadPoolDefault()`  
`   void setThreadPoolSingle()`  
`   void setThreadPool(ExecutorService)`  
`   void shutdown()`  
`   void shutdownAndAwaitTermination()`  
`   Future`<T>` submit(Callable`<T>`, String)`  
`   Future`<T>` submit(Callable`<T>`)`  
`   // TODO: additional logging and listening services`

</java>

### LoggingTools

<java>

` class LoggingTools // static utility`  
`   private LoggingTools() { } // prevents instantiation`

</java>

Questions / Comments
--------------------

Where should indexing start with the bio default of 1 rather than the
Java standard of 0?

*Please add comments here...*
