---
title: BioJava:CookbookFrench:DP:PairWise
---

Comment faire l'alignement de deux séquences?
---------------------------------------------

Une des tâches les plus communes de la bio-informatique est l'alignement
de deux séquences. Deux algorithmes très communs pour réussir cette
tâche sont les algorithmes de Needleman-Wunsch et de Smith-Waterman,
algorithmes capables de produire, respectivement, des alignements
globaux ou locaux.

Une source de frustration assez fréquente pour l'utilisateur débutant de
BioJava est l'absence de classes capables de faire ces alignement.
Pourquoi? Parce qu'il n'est pas nécessaire que ce soit frustrantWhy is
that? Il est très facile de faire ces alignements par paire (global ou
local) en utilisant un modèle de Markov assez simple que vous créez
grâce au puissant package org.biojava.bio.dp contenu dans BioJava.

Un simple modèle de Markov capable de produire des alignements est
démontré dans le livre de Durbin et al., "Biological Sequence Analysis",
à la page 30. ce modèle contient 3 états.

<image:Pairwise.png>

L'état *Match* (M) transmet des paires de symboles et est fortement
biaisé pour transmettre des paires de symboles identiques(*match*). Il
peut également transmettre des paires de symboles non-identiques
(*mismatch*). Le code qui suit traite toutes les non-identités de la
meme manière. Il est toutefois possible d'utiliser différentes
probabilités d'états *mismatch* ce qui correspond alors à définir
différentes matrices de substitution. Il existe également deux états
d'insertion (I1 and I2) qui transmettent des paires symbole-gap ou
gap-symbole respectivement; ceux-ci correspondent è l'insertion d'espace
dans la séquence inconnue ou la séquence témoin. L'état représenté par
l'étoile correspond au point de départ et d'arrivée, ce que BioJava
appelle l'état "magique".

En donnant une chance égale de quitter l'état magique pour chacun des
trois autres états, vous faites un alignement local car vous ne
pénaliser pas trop les insertions derrière l'alignement. Ce n'est pas
tout à fait vrai car techniquement les identités sont favorisées mais
c'est ce qui a de plus proche avec un modèle simple comme celui
présenté. Si vous favorisiez le retour ou le déplacement vers l'état
*Match*, vous réaliseriez un alignement global. En donnant un poids
différent pour l'extension d'une insertion (pExtGap) que celui donné
pour sa création, vous créez ainsi une pénalité de raffinement de
l'alignement.

L'exemple ci-dessus utilise un alphabet ADN mias aucune raison n'existe
piur qu'il ne puisse utilisé un alphabet de protéines. Vous pourriez
même utiliser un alphabet conditionnel qui émettrait de états *match* et
'gap' basé sur la présence/absence de n-mères données. Essayez d'en
faire autant avec Smith-Waterman! Une autre façon de faire pourrait être
la définition d'un Alphabet *match* de type (Protein x (DNA x DNA x
DNA)) qui réaliserait l'alignement d'une séquence protéique sur des
séquences d'ADN (de manière similaire au modèle GeneWise de E. Birney).

Les valeurs utilisées ci-dessous pour la transition et l'émission des
états sont passablement arbitraire. Afin de créer une solution robuste,
il vous faudrait entrainé votre modèle à l'aide de plusieurs alignements
fiables que vous savez exacts. Un des attraits d'un tel modèle est que
vous pouvez l'entrainer avec l'ensemble de vos protéines d'intérêt pour
ainsi construire un moteur d'alignenent très spécialisé. Mark en a crée
un qui est spécifiquement accordé pour l'alignement des génomes de
différentes souches du virus de la dengue. Vous pourriez même crée des
états supplémentaires afin de représenter des zones de piètre qualité
d'alignement (ajouter alors un état *Match* ne donnant pas autant de
poids aux paires de symboles identiques, c.-a-d. qui ne pénalise pas
trop les non-identités). De la même manière, vous pourriez crée des
états de transition *gaps* supplémentaires avec une très haute
probabilité d'auto-transition pour simuler les insertions permettant
d'aligner ADNc à ADN génomique. Pourquoi ne pas aussi ajouter des états
simulant des sites d'épissage et un modèle de promoteur pour obtenir
instantanément une application de recherche de gènes. Les possibilités
sont presque sans fin ;-)

### PairAlign.java

    /*
     * PairAlign.java
     *
     * Created on July 7, 2005, 10:47 AM
     */


    package dp;

    import java.io.BufferedReader;
    import java.io.File;
    import java.io.FileReader;
    import java.util.Collections;
    import java.util.Iterator;
    import java.util.List;
    import org.biojava.bio.Annotation;
    import org.biojava.bio.BioError;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.dist.DistributionFactory;
    import org.biojava.bio.dist.GapDistribution;
    import org.biojava.bio.dist.PairDistribution;
    import org.biojava.bio.dist.UniformDistribution;
    import org.biojava.bio.dp.DP;
    import org.biojava.bio.dp.DPFactory;
    import org.biojava.bio.dp.EmissionState;
    import org.biojava.bio.dp.MarkovModel;
    import org.biojava.bio.dp.ScoreType;
    import org.biojava.bio.dp.SimpleEmissionState;
    import org.biojava.bio.dp.SimpleMarkovModel;
    import org.biojava.bio.dp.StatePath;
    import org.biojava.bio.dp.twohead.CellCalculatorFactoryMaker;
    import org.biojava.bio.dp.twohead.DPInterpreter;
    import org.biojava.bio.seq.DNATools;
    import org.biojava.bio.seq.Sequence;
    import org.biojava.bio.seq.SequenceIterator;
    import org.biojava.bio.seq.io.SeqIOTools;
    import org.biojava.bio.seq.io.SymbolTokenization;
    import org.biojava.bio.symbol.AlphabetManager;
    import org.biojava.bio.symbol.BasisSymbol;
    import org.biojava.bio.symbol.FiniteAlphabet;
    import org.biojava.bio.symbol.IllegalSymbolException;
    import org.biojava.bio.symbol.Symbol;
    import org.biojava.bio.symbol.SymbolList;


    /**
     * PairAlign realise l'alignement par paire entre deux sequence d'DNA ou plus
     * selon un modele similaire a un alignement de Smith-Waterman. Il vous sert de patron
     * pour un alignement global, un alignement proteine-proteine ou meme un alignement
     * proteine - codon. En modifiant l'architecture du modele HMM, il vous est assez facile
     * d'introduire des subtilités tel que des penalites doubles (création+elongation) pour 
     * les insertions.
     * 
     * Ce programme est derive de celui cree par Matthew Pocock et qui se trouve dans la 
     * section demos de BioJava. Il a ete simplifie et documente. Il corrige egalement certains
     * bugs de design du modele original, qui quoi tecniquement correct, ne se comportait pas 
     * tout a fait comme l'auteur le supposait.
     *
     * @author Mark Schreiber
     */

    public class PairAlign {
        
      /**
       * Method two run the program. You should provide two string arguments, one
       * is the name of the file containing query sequences. The other is the name
       * of the file containing the sequences to be searched against. In a real program
       * you should also provide the probability of a match and the probability of
       * a gap extension. These are hard coded in this example.
       */  
      public static void main(String [] args) {
        try {
          if(args.length != 2) {
            throw new Exception("Use: PairwiseAlignment sourceSeqFile targetSeqFile\n");
          }

          File sourceSeqFile = new File(args[0]);
          File targetSeqFile = new File(args[1]);
          FiniteAlphabet alpha = DNATools.getDNA();
          
          CellCalculatorFactoryMaker cfFactM = new DPInterpreter.Maker();
          DPFactory fact = new DPFactory.DefaultFactory(cfFactM);
          
          /*
           * Generate a model with a pMatch of 0.7 and a pGapExtension of 0.8.
           * From these two numbers we can derive that pMatch -> pGap 
           * transition = 0.3 (approximately), pGap -> pMatch = 0.2 (approximately)
           * etc.
           */
          MarkovModel model = generateAligner(
                  alpha, 0.7, 0.6);
          
          // create the DP that will align sequences to the model
          DP aligner = fact.createDP(model);
          
          //read the query sequences.
          SequenceIterator sourceI = SeqIOTools.readFastaDNA(
                  new BufferedReader(new FileReader(sourceSeqFile)));
          
          //for each query sequence...
          while(sourceI.hasNext()) {
            Sequence sourceSeq = sourceI.nextSequence();
            
            // ...compare it to every target sequence
            SequenceIterator targetI = SeqIOTools.readFastaDNA(
                  new BufferedReader(new FileReader(targetSeqFile)));
            
            while(targetI.hasNext()) {
              Sequence targetSeq = targetI.nextSequence();
              Sequence [] seqs = new Sequence [] {
                sourceSeq, targetSeq
              };
              System.out.println(
                "Aligning " + sourceSeq.getName() + ":" + targetSeq.getName()
              );

              //find the most probable path through the model for the two sequences
              StatePath result = aligner.viterbi(seqs, ScoreType.PROBABILITY);
              //calculate the log odds of the alignment
              System.out.println("Log odds Viterbi probability:\t" + result.getScore());
              System.out.println("\t" + result.getScore());
              
              
              //output the alignment
              SymbolList alignment = result.symbolListForLabel(StatePath.SEQUENCE);
              System.out.println(alignment.getAlphabet());
              SymbolTokenization tok = alignment.getAlphabet().getTokenization("default");
              System.out.println(tok.tokenizeSymbolList(alignment));
              
              //output the state path
              alignment = result.symbolListForLabel(StatePath.STATES);
              System.out.println(alignment.getAlphabet());
              tok = alignment.getAlphabet().getTokenization("default");
              System.out.println(tok.tokenizeSymbolList(alignment));
              tokenizePath(result);
            }
          }
        } catch (Throwable t) {
          t.printStackTrace();
          System.exit(1);
        }
      }
      
      /**
       * Generates the Markov model that will be used for the alignment. <p>The
       * pMatch is the probability of a match (technically the prob of a match 
       * extending itself). If you set this to a high number gaps will be infrequent.
       * <p>
       * pExtendGap is the gap extension probability. The is not the penalty for
       * gap opening as that is dependant on the value of pMatch, rather it is the
       * probability of extending a gap which is similar to the affine gap penaly
       * used in Smith-Waterman and other algorithms.
       */
      private static MarkovModel generateAligner(
        FiniteAlphabet alpha, double pMatch, double pExtendGap) throws Exception {
        
        
        FiniteAlphabet dna = alpha;
        FiniteAlphabet dna2 =
          (FiniteAlphabet) AlphabetManager.getCrossProductAlphabet(
            Collections.nCopies(2, dna));
          
        MarkovModel model = new SimpleMarkovModel(2, dna2, "pair-wise aligner");
        
        //the background distribution, for DNA it represents random, but for protein
        //or highly biased background composition it should be calculated.
        Distribution nullModel = new UniformDistribution(dna);
        //the emission distribution that emits gaps for the insert states
        Distribution gap = new GapDistribution(dna);
        //the emission distribution that emits pairs of matched (or mismatched) symbols
        Distribution matchDist = generateMatchDist((FiniteAlphabet) dna2);
        //the distribution that emits nucleotide/gap pairs
        Distribution insert1Dist = new PairDistribution(nullModel, gap);
        //the distribution that emits gap/nucleotide pairs
        Distribution insert2Dist = new PairDistribution(gap, nullModel);
        
        //-----create the states-----//
        
        //etat transmettant les paires de nucleotides 
        //identiques ou non-identiques
        EmissionState match = new SimpleEmissionState(
          "match",
          Annotation.EMPTY_ANNOTATION,
          new int [] { 1, 1 },
          matchDist
        );
        //etat transmettant les paires nucleotide/gap
        //(insertions dans la sequence connue)
        EmissionState insert1 = new SimpleEmissionState(
          "insert1",
          Annotation.EMPTY_ANNOTATION,
          new int [] { 1, 0 },
          insert1Dist
        );
        //etat transmettant les paires gap/nucleotide
        //(insertion dans la sequence inconnue)
        EmissionState insert2 = new SimpleEmissionState(
          "insert2",
          Annotation.EMPTY_ANNOTATION,
          new int [] { 0, 1 },
          insert2Dist
        );
        
        //ajouter ces etats aux modeles
        model.addState(match);
        model.addState(insert1);
        model.addState(insert2);
        
        //transitions commencant le modele
        model.createTransition(model.magicalState(), insert1);
        model.createTransition(model.magicalState(), insert2);
        model.createTransition(model.magicalState(), match);
        
        //transitions terminant le modele
        model.createTransition(insert1, model.magicalState());
        model.createTransition(insert2, model.magicalState());
        model.createTransition(match, model.magicalState());
        
        //auto-transitions
        model.createTransition(match, match); //allonger match
        model.createTransition(insert1, insert1); //allonger gap
        model.createTransition(insert2, insert2); //allonger gap
        
        model.createTransition(match, insert1); //insert a gap
        model.createTransition(match, insert2); //insert a gap
        model.createTransition(insert1, match); //back to matching again
        model.createTransition(insert2, match); //back to matching again
        
        //----Transition probabilities---//

        /*
         * Utiliser des valeurs egales pour match et insert corresponds plus
         * ou moins a un alignement local. Comme il y a deux etats insert, ils
         * obtienne 0.25 alors que l'etat match obtient 0.5
         */
        model.getWeights(model.magicalState()).setWeight(match, 0.5);
        model.getWeights(model.magicalState()).setWeight(insert1, 0.25);
        model.getWeights(model.magicalState()).setWeight(insert2, 0.25);

        Distribution dist;
        
        /*
         * Ceci est la petite probabilite que tout se termine (transition vers magique)
         * a partir de n'importe quel etat. Cette valeur est créé de toute piece car 
         * l'algorithme de Viterbi ne peut se terminerque si il a epuise les sequences 
         * mais il faut assigner une probabilite a cet evenement aussi qui doit etre 
         * soustrait tu total disponible pour les autres transitions.
         */
        double pEnd = 0.01;
        
        //----Probabilites des transitions pour l'etat match
        dist = model.getWeights(match);
        //probabilite d'auto-transition a partir de match
        dist.setWeight(match, pMatch);
        //probabilite de transtion de match vers insert in seq1
        dist.setWeight(insert1, (1.0 - pMatch - pEnd)/2.0);
        //probabilite de transtion de match vers insert in seq1
        dist.setWeight(insert2, (1.0 - pMatch - pEnd)/2.0);
        //la chance que tout se termine a partir de cet etat match
        dist.setWeight(model.magicalState(), pEnd);

        //----Probabilite de transition pour le 1er etat d'insertion
        dist = model.getWeights(insert1);
        //probabilite d'une auto-transition (elongation d'une insertion)
        dist.setWeight(insert1, pExtendGap);
        //probabilite d'une transition a l'etat match
        dist.setWeight(match, 1.0 - pEnd - pExtendGap);
        //probabilite de finir apres une insertion
        dist.setWeight(model.magicalState(), pEnd);

        //----Probabilite de transition pour le 2eme etat d'insertion
        dist = model.getWeights(insert2);
        //probabilite d'une auto-transition (elongation d'une insertion)
        dist.setWeight(insert2, pExtendGap);
        //probabilite d'une transition a l'etat match
        dist.setWeight(match, 1.0 - pEnd - pExtendGap);
        //probabilite de finir apres une insertion
        dist.setWeight(model.magicalState(), pEnd);
        
        return model;
      }
      
      /**
       * Cette methode produit l'equivalent statistique d'une matrice de substitution.
       * Un "match" obtient une forte probabilite alors qu'un "mismatch" est penalise
       * par l'attribution d'une faible probabilite. Parce que l'alignement est
       * DNAxDNA, les "mismatches" sont tous mauvais de la même maniere. Si l'alignement 
       * etait proteine-proteine, il serait raisonnable de donner à certains "mismatches"
       * des probabilites plus elevees, d'une maniere similaire aux matrices PAM et BLOSUM.
       */
      private static Distribution generateMatchDist(FiniteAlphabet dna2)
      throws Exception {
        Distribution dist = DistributionFactory.DEFAULT.createDistribution(dna2);
        int size = dna2.size();
        int matches = (int) Math.sqrt(size);
        
        //la probabilite d'une identite.
        double pMatch = 0.7;
        
        double matchWeight = pMatch / matches;
        double missWeight = (1.0 - pMatch) / (size - matches);
        
        for(Iterator i = dna2.iterator(); i.hasNext(); ) {
          BasisSymbol cps = (BasisSymbol) i.next();
          List sl = cps.getSymbols();
          if(sl.get(0) == sl.get(1)) {
            dist.setWeight(cps, matchWeight);
          } else {
            dist.setWeight(cps, missWeight);
          }
        }
        
        return dist;
      }
      
      private static void tokenizePath(StatePath path) throws IllegalSymbolException{
          SymbolList states = path.symbolListForLabel(StatePath.STATES);
          SymbolList symbols = path.symbolListForLabel(StatePath.SEQUENCE);
          StringBuilder queryString = new StringBuilder();
          StringBuilder targetString = new StringBuilder();
          StringBuilder pathString = new StringBuilder();
                
          if(states.length() != symbols.length())
              throw new BioError("State path lengths should be identical");
          
          char queryToken = " "; char targetToken = " "; char pathToken = " ";
          
          for(int i = 1; i < symbols.length(); i++){
              //fragmenter le symbole DNAxDNA           
              //pourrait etre un AtomicSymbol mais Basis couvre bien le besoin :)
              BasisSymbol doublet = (BasisSymbol)symbols.symbolAt(i);
              List sl = doublet.getSymbols();
              queryToken = DNATools.dnaToken( (Symbol)sl.get(0) );
              targetToken = DNATools.dnaToken( (Symbol)sl.get(1) );
              
              // fragmenter le parcours d'etat
              Symbol s = states.symbolAt(i);
              //si identite parfaite, retourne le caractere "+"
              if (s.getName() == "match" && queryToken == targetToken){
                  pathToken = "+";
              }else{
                  pathToken = " ";
              }
              
              queryString.append(queryToken);
              pathString.append(pathToken);
              targetString.append(targetToken);
          }
          System.out.println(queryString);
          System.out.println(pathString);
          System.out.println(targetString);
      }
    }
