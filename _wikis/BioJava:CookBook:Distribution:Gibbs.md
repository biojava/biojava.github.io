---
title: BioJava:CookBook:Distribution:Gibbs
---

Using Distributions to make a Gibbs sampler
-------------------------------------------

Gibbs sampling is a statistical technique related to Monte Carlo Markov
Chain sampling. It is used to search a solution space for an optimal (or
at least locally optimal solution). It is an iterative technique.
Basically, a single parameter is chosen at random and the value of it is
set to a random value (or one chosen from a distribution). All the other
parameters remain the same. If the new solution is better than the old
then it becomes the new model if not the old model is kept. The process
of choosing parameters and setting their value continues until some
stopping criteria is met, such as convergence to a local optimum or a
set number of iterations has passed. In biology Gibbs sampling has been
succesfully applied to the task of finding short conserved motifs in
larger seqeunces. The technique is sometimes called Gibbs alignment.

Using biojava's org.biojava.bio.dist package it is very easy to
construct a simple Gibbs aligner. It also serves as an excellent
opportunity to explore some of the uses of the Distribution classes. In
the following code example Distributions are used to randomize the
alignment offsets and to calculate the information content of the motif.
The first example may be unfamiliar because the Distribution is over an
Integer alphabet. The second use is a DNA or protein alphabet. This
shows it is perfectly simple to use and sample a Distribution over any
Alphabet that can be constructed using biojava. Thus biojava is not
always so 'bio'. It can be used to represent and manipulate any kind of
symbolic data.

The first class is the SimpleGibbsAligner. It is the workhorse that does
all the sampling and testing of motifs. It uses an accessory interface:
GibbsStoppingCriteria that helps it figure out when to stop iterating.
The interface shown provides a few basic implementations. Finally a demo
program with a main method is shown that ties it all together.

### SimpleGibbsAligner

    package gibbs;

    import java.util.HashMap;
    import java.util.Map;
    import java.util.Random;
    import java.util.Vector;
    import org.biojava.bio.BioException;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.dist.DistributionFactory;
    import org.biojava.bio.dist.DistributionTools;
    import org.biojava.bio.dist.DistributionTrainerContext;
    import org.biojava.bio.dist.SimpleDistributionTrainerContext;
    import org.biojava.bio.seq.Sequence;
    import org.biojava.bio.seq.SequenceIterator;
    import org.biojava.bio.symbol.Alignment;
    import org.biojava.bio.symbol.Alphabet;
    import org.biojava.bio.symbol.IllegalAlphabetException;
    import org.biojava.bio.symbol.IllegalSymbolException;
    import org.biojava.bio.symbol.IntegerAlphabet;
    import org.biojava.bio.symbol.SimpleAlignment;
    import org.biojava.bio.symbol.Symbol;
    import org.biojava.bio.symbol.SymbolList;



    /**
     * A class that uses Gibbs Sampling to generate a local alignment of an over
     * represented motif.
     */
    public class SimpleGibbsAligner {
      private Sequence[] s; // sequence array.
      private int w; //window size.
      private int[] a; //starting indices.
      private int iterations = 0;
      private Distribution[] pattern; //the probabilistic pattern description.
      private Distribution background; //the probabilistic background description.
      private Random rand; //random number generator
      private Alphabet alphabet; //the alphabet in which the sampler operates.
      private GibbsStoppingCriteria criteria; //determines when to stop sampling.

      /**
       * Constructs the gibbs aligner to find a common motif in a collection
       * of sequences. It is assumed that all the sequences are constructed
       * from the same <code>Alphabet</code>. If this is not the case then calls
       * to iterate will throw exceptions. This class is designed to be single use
       * and is not thread safe. To use in a threaded environment each thread
       * should be given its own SimpleGibbsAligner.
       *
       * @param windowSize the expected size of the motif
       * @param it a collection of sequences in which to search for a motif.
       * @param criteria an object which specifies when sampling should stop.
       */
      public SimpleGibbsAligner(int windowSize,
                                SequenceIterator it,
                                GibbsStoppingCriteria criteria){
        w = windowSize;
        this.criteria = criteria;
        rand = new Random();

        //get the sequences
        Vector v = new Vector();
        while(it.hasNext()){
          try{
            v.add(it.nextSequence());
          }catch(BioException e){
            //cannot retreive the sequence from the iterator, not likely to happen.
            e.printStackTrace();
          }
        }
        v.trimToSize();
        s = new Sequence[v.size()];
        v.copyInto(s);

        //intitialize the offsets
        a = new int[s.length];
        a = initIndices();

        //set the alphabet
        alphabet = s[0].getAlphabet();
      }



      /**
       * Initialize an array of random offsets.
       * @return the array of offsets
       */
      private int[] initIndices(){
        int[] indices = new int[s.length];
        for (int i = 0; i < indices.length; i++) {
          int index = rand.nextInt(s[i].length() - w-1);
          // as we are making offset indices to symbollists
          // they must be from 1 not 0
          index++;
          indices[i] = index;
        }
        return indices;
      }

      /**
       * Iterates through a procedure of predictive updates and sampling until
       * the stopping criteria defined in the <code>stop()</code> method are met.
       * Once the method returns the <code>getXXX</code> methods can be used to
       * determine the results.
       */
      public void iterate(){
        try {
          //choose a sequence at random
          int index = rand.nextInt(s.length);
          do{
            //calculate pattern in all but the chosen sequence
            pattern = updatePattern(index, a);
            //occasionaly try a phase shift
            if(rand.nextDouble() < 0.1){
              tryPhaseShift(index);
            }
            //calculate the background
            background = updateBackground(index);
            //sample the randomly chosen sequence to find the best start index a.
            a[index] = sampleSequence(index);
            //reportMatch(a[index], s[index]);
            iterations++;
            index = (++index)%s.length;
          }while(stop() == false);
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
      }

      /**
       * Determines when to stop iterating.
       * @return true if the StoppingCriteria says to stop and false otherwise.
       */
      protected boolean stop(){
        return criteria.stop(this);
      }

      /**
       * Produces a pattern to describe the motif covered by the window
       * @param excludeIndex the index of the sequence to be excluded from sampling.
       * @param offsets the matrix of offset positions
       * @return the updated motif pattern
       */
      private Distribution[] updatePattern(int excludeIndex, int[] offsets){
        Distribution[] d = null;

        Map label2Res = new HashMap(s.length);
        for (int i = 0; i < s.length; i++) {//for each sequence
          if(i == excludeIndex) continue; //except this sequence
          SymbolList subSeq = s[i].subList(offsets[i],
                                           offsets[i] +w -1);//take the subsequence
          label2Res.put(new Integer(i),subSeq); //put it in the hashmap
        }
        Alignment al = new SimpleAlignment(label2Res);//make an alignment of subseqs

        try {
          d = DistributionTools.distOverAlignment(al, false,1.0);//make the pattern
        }
        catch (IllegalAlphabetException ex) {
          ex.printStackTrace();
        }

        return d;
      }

      /**
       * produces a distribution to describe the background distribution
       * @param excludeIndex the index of the sequence to exclude
       * @return the updated background distribution.
       */
      private Distribution updateBackground(int excludeIndex){
        Distribution d = null;

        try {
          DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();
          d = DistributionFactory.DEFAULT.createDistribution(alphabet);
          dtc.setNullModelWeight(1.0);
          dtc.registerDistribution(d);

          for (int i = 0; i < s.length; i++) {//for each sequence
            if(i == excludeIndex) continue; //except this sequence
            for(int j = 1; j <= s[i].length(); j++){//count each base
              if(j >= a[i] && j < a[i] + w-1) continue; //except these ones
              dtc.addCount(d, s[i].symbolAt(j), 1.0);
            }
          }
          dtc.train();
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
        return d;
      }

      /**
       * Attempts to prevent the pattern getting locked in a local optimum by
       * shifting the pattern one step to the left or right and seeing if it is
       * better than the current pattern. If the phase shift improves the model
       * the pattern and offsets will be updated.
       * @param excludeIndex the index of the sequence to be excluded.
       */
      private void tryPhaseShift(int excludeIndex){
        int[] newOffSets = new int[a.length];
        System.arraycopy(a,0,newOffSets,0,a.length); // copy offsets
        Distribution[] newPattern;

        if (rand.nextBoolean()) {//shift left
          for (int i = 0; i < newOffSets.length; i++) {
            if(i == excludeIndex) continue; //skip this sequence
            if(newOffSets[i] > 1) newOffSets[i]--;
          }
        }
        else {// shift right
          for (int i = 0; i < newOffSets.length; i++) {
            if(i == excludeIndex) continue; //skip this sequence
            if(newOffSets[i] < s[i].length() - w-2) newOffSets[i]++;
          }
        }

        newPattern = updatePattern(excludeIndex, newOffSets);
        if(getInfoContent(newPattern) > getInfoContent(pattern)){
          a = newOffSets;
          pattern = newPattern;
        }
      }

      /**
       * Determines a weighted distribution of offsets in the sequence to be
       * sampled and randomly selects an offset from that distribution to be used
       * in the next pattern update.
       * @param sequenceIndex the sequence to be sampled.
       * @return the selected offset
       */
      private int sampleSequence(int sequenceIndex){
        Distribution d = null;
        try {
          SymbolList seq = s[sequenceIndex];
          //make an alphabet of the possible offsets
          IntegerAlphabet.SubIntegerAlphabet alpha =
                 IntegerAlphabet.getSubAlphabet(1, seq.length()-w-1);
          //make a distribution to hold the weighted probabilities of each offset.
          d = DistributionFactory.DEFAULT.createDistribution(alpha);
          DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();
          dtc.setNullModelWeight(1.0);
          dtc.registerDistribution(d);

          //score each subsequence
          for(int i = 1; i <= seq.length()-w-1; i++){
            double score = scoreSequence(seq.subList(i, i+w-1));
            //add the weight to the distribution of offsets
            dtc.addCount(d,alpha.getSymbol(i),score);
          }
          dtc.train();
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }

        //sample the distribution of offsets
        int offset = ((IntegerAlphabet.IntegerSymbol)d.sampleSymbol()).intValue();
        return offset;
      }

      /**
       * Scores a potential motif against the pattern description and background
       * distribution.
       * @param sl the potential motif to score
       * @return the score
       */
      private double scoreSequence(SymbolList sl){
        double pMotif = 1.0;
        double pBackGround = 1.0;

        for(int i = 0; i < sl.length(); i++){
          Symbol s = sl.symbolAt(i+1); //+1 as we are indexing from zero this time
          try {
            pMotif *= pattern[i].getWeight(s); //probability of s at position i
            pBackGround *= background.getWeight(s); //probability of s in background
          }
          catch (IllegalSymbolException ex) {
            ex.printStackTrace();
          }
        }
        return pMotif/pBackGround;
      }

      /**
       * Determines the information content (in bits) of the motif inclding pseudo
       * counts.
       * @return the Information content.
       */
      public double getInfoContent(){
        return getInfoContent(pattern);
      }

      /**
       * determines the information content (in bits) of the specified pattern
       * including pseudo counts.
       * @param d the pattern of the motif
       * @return the information content
       */
      private double getInfoContent(Distribution[] d){
        double info = 0.0;
        for (int i = 0; i < d.length; i++) {
          info += DistributionTools.bitsOfInformation(d[i]);
        }
        return info;
      }

      
      /**
       * Returns the current <code>Alphabet</code> being used.
       * @return an <CODE>Alphabet</CODE>
       */
      public Alphabet getAlphabet(){
        return alphabet;
      }

      /**
       * Get the background distribution.
       * @return a <CODE>Distribution</CODE> of background frequencies.
       */
      public Distribution getBackground() {
        return background;
      }

      /**
       * The current iteration of the sampler
       * @return an int >= 0
       */
      public int getIterations() {
        return iterations;
      }

      /**
       * The current pattern at this iteration of the sampler
       * @return the pattern as a <CODE>Distribution[]</CODE>. 
       * Effectively a weight matrix.
       */
      public Distribution[] getPattern() {
        return pattern;
      }

      /**
       * Tje set of sequence offsets being used for this iteration of 
       * sampling
       * @return an array of ints &ge; 1
       */
      public int[] getOffSets(){
        return a;
      }

      /**
       * The set of <code>Sequence</code>s being sampled
       * @return  a <CODE>Sequence[]</CODE>
       */
      public Sequence[] getSequences(){
        return s;
      }

      /**
       * The size of the pattern being sampled for.
       * @return  an <code>int</code> &gt; 0
       */
      public int getWindowSize(){
        return w;
      }
    }

### GibbsStoppingCriteria

    package gibbs;

    import org.biojava.bio.BioException;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.dist.DistributionTools;


    /**
     * Defines the criteria under which Gibbs Sampling should stop
     */
    public interface GibbsStoppingCriteria {

      /**
       * Uses a heuristic proceedure to determine when to stop. If the information
       * content of the motif has failed to increase above its previous maximum for
       * 100 iterations then the method will return true. NOTE: it is expected that
       * the same SimpleGibbsSampler will be passed to the stop() method at each
       * call.
       */
      public static GibbsStoppingCriteria HEURISTIC = new Heuristic();

      /**
       * Returns true when the emission spectra of the last iteration equals that
       * of this iteration. Note that this may never return if convergence is not
       * reached. Thus the method has a built in stopping point of 10,000
       * iterations. NOTE: it is expected that the same SimpleGibbsSampler will be
       * passed to the stop() method at each call.
       */
      public static GibbsStoppingCriteria CONVERGE = new Converge();

     /**
      * This method should return true when stopping criteria have been reached.
      * @param sga the GibbsAligner that is being tested for stopping conditions
      * @return true if it should stop, false otherwise.
      */
      public boolean stop(SimpleGibbsAligner sga);

      /**
       * Implementation of GibbsStoppingCriteria
       */
      class Heuristic implements GibbsStoppingCriteria{
        double bestInfo = 0.0; //the level of conservation
        int bestIteration = 0; //the most conserved pattern

        public boolean stop(SimpleGibbsAligner sga){
          double info = sga.getInfoContent();
          if(info > bestInfo){
            bestInfo = info;
            bestIteration = sga.getIterations();
            return false; //don"t stop
          }else if(sga.getIterations() >= bestIteration+99){
            return true;
          }
          return false; //don"t stop
        }
      }// end of Heuristic

      /**
       * Implementation of GibbsStoppingCriteria
       */
      class Converge implements GibbsStoppingCriteria{
        Distribution[] previous = null; //the last pattern

        public boolean stop(SimpleGibbsAligner sga){
          if(previous == null) return false; //there is no previous yet.
          if(sga.getIterations() == 10000) return true; //max iterations.
          try{
            if (DistributionTools.areEmissionSpectraEqual(previous,sga.getPattern())){
              return true; // patterns have converged.
            }
            else {
              previous = sga.getPattern();
              return false; //don"t stop
            }
          }catch(BioException e){
            //this can"t really happen but...
            e.printStackTrace();
            return false;
          }
        }
      }// end of converge


    }// end of GibbsStoppingCriteria

### SimpleGibbsAlignerDemo

    package gibbs; 

    import java.io.BufferedReader;
    import java.io.File;
    import java.io.FileReader;
    import org.biojava.bio.seq.Sequence;
    import org.biojava.bio.seq.SequenceIterator;
    import org.biojava.bio.seq.io.SeqIOTools;



    public class SimpleGibbsAlignerDemo {
      
        /**
         * Usage information
         */
      public static void help(){
        System.out.println(
        "Usage: java SimpleGibbsAlignerDemo <fasta_file> "+
        "<true/false> <window> <trails>");
        System.out.println("\tfasta_file:\tthe sequences");
        System.out.println("\ttrue/false:\ttrue if protein false if dna");
        System.out.println("\twindow:\t\tthe window size");
        System.out.println("\ttrails:\t\tthe number of seeds to try");
        System.exit(0);
      }

      public static void main(String[] args) throws Exception{
        if(args.length != 4) help();
        
        //a file of sequences sequences
        File f = new File(args[0]);
        //am I dealing with protein?
        boolean protein = new Boolean(args[1]).booleanValue();
        //the size of the motif I am looking for.
        int window = Integer.parseInt(args[2]);
        //the number of times to attempt a motif identification.
        int trials = Integer.parseInt(args[3]);
        SequenceIterator it;


        for(int i = 0; i < trials; i++){
          BufferedReader br = new BufferedReader(new FileReader(f));
          if(protein){
            it =(SequenceIterator)SeqIOTools.fileToBiojava("fasta", "protein", br);
          }else{
            it =(SequenceIterator)SeqIOTools.fileToBiojava("fasta", "DNA", br);
          }
          
          //make an aligner wih Heuristic stopping criteria
          SimpleGibbsAligner gibbs = new SimpleGibbsAligner(window,
              it, GibbsStoppingCriteria.HEURISTIC);
          //start the aligner running
          gibbs.iterate();

          //how many iterations till convergence?
          System.out.println("Converged after "+gibbs.getIterations()+" iterations");
          //What is the information content of the motif?
          System.out.println("Information (bits): "+gibbs.getInfoContent());
          
          //get the sequences, offsets and window size to print out the motif
          Sequence[] seqs = gibbs.getSequences();
          int[] offSets = gibbs.getOffSets();
          int wind = gibbs.getWindowSize();

          //print out the motif
          for (int j = 0; j < offSets.length; j++) {
            System.out.println(seqs[j].subStr(offSets[j],offSets[j]+wind -1));
          }
          System.out.println();
        }
      }
    }
