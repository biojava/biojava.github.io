---
title: BioJava:CookBook:Count:Frequency
---

How do I calculate the frequency of a Symbol in a Sequence?
-----------------------------------------------------------

One of the most useful classes in BioJava is the Distribution. A
Distribution is a map from a Symbol to a frequency. Distributions are
trained with observed Symbols using a DistributionTrainerContext. A
DistributionTrainerContext can train several registered Distributions
and will handle any Symbol from any Alphabet. Ambiguous Symbols are
divided amongst the AtomicSymbols that make up the ambiguous
BasisSymbol.

The following program demonstrates the training of three Distributions
with Sequences from three different Alphabets.

    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;
    import org.biojava.bio.dist.*;
    import org.biojava.utils.*;
    import java.util.*;

    public class Frequency {
      public static void main(String[] args) {

        try {
          //make a DNA SymbolList
          SymbolList dna = DNATools.createDNA("atcgctagcgtyagcntatsggca");

          //make a RNA SymbolList
          SymbolList rna = RNATools.createRNA("aucgcuaucccaggga");

          //make a protein SymbolList
          SymbolList protein = ProteinTools.createProtein("asrvgchvhilmkapqrt");

          SymbolList[] sla = {dna, rna, protein};

          //get a DistributionTrainerContext
          DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();

          //make three Distributions
          Distribution dnaDist =
              DistributionFactory.DEFAULT.createDistribution(dna.getAlphabet());
          Distribution rnaDist =
              DistributionFactory.DEFAULT.createDistribution(rna.getAlphabet());
          Distribution proteinDist =
              DistributionFactory.DEFAULT.createDistribution(protein.getAlphabet());

          Distribution[] da = {dnaDist, rnaDist, proteinDist};

          //register the Distributions with the trainer
          dtc.registerDistribution(dnaDist);
          dtc.registerDistribution(rnaDist);
          dtc.registerDistribution(proteinDist);

          //for each Sequence
          for (int i = 0; i < sla.length; i++) {
            //count each Symbol to the appropriate Distribution
            for(int j = 1; j <= sla[i].length(); j++){
              dtc.addCount(da[i], sla[i].symbolAt(j), 1.0);
            }
          }

          //train the Distributions
          dtc.train();

          //print the weights of each Distribution
          for (int i = 0; i < da.length; i++) {
            for (Iterator iter = ((FiniteAlphabet)da[i].getAlphabet()).iterator();
                 iter.hasNext(); ) {

              Symbol sym = (Symbol)iter.next();
              System.out.println(sym.getName()+" : "+da[i].getWeight(sym));
            }
            System.out.println("\n");
          }

        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
      }
    }
