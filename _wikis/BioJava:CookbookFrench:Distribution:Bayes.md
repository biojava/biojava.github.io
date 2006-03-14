---
title: BioJava:CookbookFrench:Distribution:Bayes
---

Utiliser des Distributions pour créer un classificateur bayésien naif
---------------------------------------------------------------------

[ Les classificateurs bayésiens
naifs](wp:Naive_Bayesian_classifier "wikilink") sont une des méthodes
les plus simples de classificateurs probabilistiques. En dépit de leur
limitations intrinsèques et de leurs préceptes naifs, ils sont tout de
même très efficaces. Par exemple, ils sont utilisé durant des processus
[d'apprentissage supervisé](wp:Supervised_learning "wikilink") ou pour
classifier des observations selon le concept du maximum de
vraisemblance.

Le classificateur comporte essentiellement deux classes ou vecteurs (ou
plus) de caractéristiques ayant une probabilité de se retrouver au sein
des observations; ces classes sont généralement basées sur des exemples
d'entraînement. Les nouvelles observations sont classifiées basé sur la
classe qui les représente le mieux. Une utilisation très fréquente est
le tamisage des pourriels selon la distribution des mots que ces
messages contiennent. Comme les pourriels contiennent certains mots et
certaines phrases qui ont peu de chance de se retrouver dans un courriel
légitime, l'analyse de la fréqyuence de ces mots dans un courriel par un
classificateur bayésien permet de déterminer la probabilité qu'un
courriel soit du pourriel ou pas.

Dans l'exemple simple qui suit, nous utilisons des tableaux BioJava de
`Distributions` afin de représenter des classes de vecteurs
correspondant à des séquences riches en GT ou AC. Le classificateur
calcule ensuite la classe la plus probable lorsqu'on lui présente de
nouvelles observations. Cette application est semblable à une matrice de
distribution qui utiliserait une distribution nulle non-uniforme (pour
l'évaluation du bruit de fond) sauf que la séquence toute entière est
classifiée et non des sous-séquences comme dans le cas d'une matrice.
Une autre différence est qu'un classificateur bayésien peut contenir
plus de deux classes ce qu'une matrice ne peut faire.

L'exemple contient trois classes Java. La classe `BayesClassifier`
contient des objets de type `Classification` (un pour chaque classe que
le classificateur doit évaluer) et détermine la classification des
nouvelles observations selon ces classes. L'application `TestRun` est un
tout petit programme pour accomplir la tâche en démonstration.

BayesClassifier.java
--------------------

    /*
     * BayesClassifier.java
     *
     * Created on December 7, 2005, 1:32 PM
     */

    package bayes;

    import java.util.HashMap;
    import java.util.Map;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.symbol.IllegalSymbolException;
    import org.biojava.bio.symbol.SymbolList;

    /**
     * Simple Naive Bayes classifier
     * @author Mark Schreiber
     */
    public class BayesClassifier {
        
        private Map name2Classifier;
        private Map name2Prior;
        private double totalPrior;
        
        /** Creates a new instance of BayesClassifier */
        public BayesClassifier() {
            name2Classifier = new HashMap();
            name2Prior = new HashMap();
            totalPrior = 0.0;
        }
        
        /**
         * Ajoute (ou remplace si le nom existe deja) une 
         * classification. Noter qu'ajouter une nouvelle classification
         * apres que certaines observations aient ete faites
         * rendrons ces observataions invalides par rapport a la classe ajoutee
         * pour cause de non-evaluation.
         * @param name Le nom de la classe (eg positive)
         * @param featureVector Les caracteristiques de ce modele
         * @param prior La valeur donnee a cette classification.
         * Pas besoin d'etre une probabilite. Lorsque la probabilite
         * d'une classification est calculee, les valeurs sont normalisees 
         * sous la forme de probabilites.
         */
        public void addClassification(String name,
                Distribution[] featureVector,
                double prior){
            Classification c = new Classification();
            c.setFeatureVector(featureVector);
            
            totalPrior += prior;
            name2Prior.put(name, new Double(prior));
            name2Classifier.put(name, c);
        }
        
        /**
         * La probabilite anterieure de la classification specifiee.
         * @return Le poids anterieur calcule pour cette classification 
         * normalisee sous la forme d'une probabilite.
         */
        public double getPriorProb(String classificationName){
            Double pc = (Double)name2Prior.get(classificationName);
            
            return pc.doubleValue()/totalPrior;
        }
        
        /**
         * Le logarithme naturel de la probabilite the cette classe selon
         * l'observation faite.
         */
        public double logProbClass(String classificationName,
                SymbolList obs) throws IllegalSymbolException{
            if(! name2Classifier.containsKey(classificationName) || 
                    ! name2Prior.containsKey(classificationName)){
                throw new IllegalArgumentException(classificationName+"not found");
            }
            
            Classification c = (Classification)name2Classifier.get(classificationName);
            
            return Math.log(getPriorProb(classificationName))+c.pObservation(obs);                
        }
    }

Classification.java
-------------------

    /*
     * Classification.java
     *
     * Created on December 7, 2005, 1:38 PM
     *
     */

    package bayes;

    import java.util.Iterator;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.symbol.IllegalSymbolException;
    import org.biojava.bio.symbol.Symbol;
    import org.biojava.bio.symbol.SymbolList;

    /**
     *
     * @author Mark Schreiber
     */
    class Classification {
        private Distribution[] featureVector;
        
        /** Creer une nouvelle instance */
        public Classification() {
            featureVector = new Distribution[0];
        }

       /**
        * Methode "Getter" pour le featureVector
        * @return le vecteur effectif et non une copie.
        */
        public Distribution[] getFeatureVector(){
            return this.featureVector;
        }
        
        /**
         * Methode "Setter" pour le  featureVector
         * @param featureVector le vecteur de caracteristiques 
         *        sous forme d'un tableu de Distributions BioJAva
         */
        public void setFeatureVector(Distribution[] featureVector){
            this.featureVector = featureVector;
        }

        
        /**
         * La probabilite pour cette observation selon le vecteur de cette classe.
         * @return le logarithme naturel de la probabilite.
         * @throws IllegalSymbolException si obs contient des symboles qui ne sont pas contenus 
         * dans l'alphabet des Distributions contenues dans le vecteur.
         */
        double pObservation(SymbolList obs) throws IllegalSymbolException{
            if(obs == null) throw new IllegalArgumentException("obs cannot be null");
            //obs et featureVector doivent avoir la meme longueur
            if(obs.length() != featureVector.length){
                throw new IllegalArgumentException("obs and featureVector need to be the same length");
            }
            
            double p = 0.0;
            int i = 0;
            for(Iterator it = obs.iterator(); it.hasNext(); i++){
                Symbol s = (Symbol)it.next();
                Distribution d = featureVector[i];
                p += Math.log(d.getWeight(s));
            }
            return p;
        }
    }

TestRun.java
------------

    /*
     * TestRun.java
     */

    package bayes;

    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.dist.SimpleDistribution;
    import org.biojava.bio.seq.DNATools;
    import org.biojava.bio.symbol.SymbolList;

    /**
     *
     * @author Mark Schreiber
     */
    public class TestRun {
        
        Distribution[] feat1;
        Distribution[] feat2;
        SymbolList seq1;
        SymbolList seq2;
        BayesClassifier c;
        
        /** Cree une nouvelle instance de TestRun */
        public TestRun() throws Exception{
            c = new BayesClassifier();
            initFeat1(); initFeat2();
            c.addClassification("class1", feat1, 0.5);
            c.addClassification("class2", feat2, 0.5);
            
            seq1 = DNATools.createDNA("gtctgaagtg"); //gt rich (class1)
            seq2 = DNATools.createDNA("accaacgtac"); //ac rich (class2)
        }
        
        /**
         * fait la demonstration de classification.
         */
        public void classify() throws Exception{
            double p1 = 0.0;
            double p2 = 0.0;
            
            p1 = c.logProbClass("class1", seq1);
            System.out.println("log p(class1 | seq1) = "+p1);
            p2 = c.logProbClass("class2", seq1);
            System.out.println("log p(class2 | seq1) = "+p2);
            System.out.println("logratio p(class1 | seq1) / p(class2 | seq1) = "+(p1 -p2));
            
            System.out.print("\n");
            
            p1 = c.logProbClass("class1", seq2);
            System.out.println("log p(class1 | seq2) = "+p1);
            p2 = c.logProbClass("class2", seq2);
            System.out.println("log p(class2 | seq2) = "+p2);
            System.out.println("logratio p(class1 | seq2) / p(class2 | seq2) = "+(p1 -p2));
        }
        
        /**
         * Initialise un vecteur de caracteristiques pour les sequences riches en GT.
         */ 
        private void initFeat1() throws Exception{
            feat1 = new Distribution[10];
            for(int i = 0; i < feat1.length; i++){
                feat1[i] = new SimpleDistribution(DNATools.getDNA());
                //gt rich
                feat1[i].setWeight(DNATools.a(), 0.1);
                feat1[i].setWeight(DNATools.c(), 0.1);
                feat1[i].setWeight(DNATools.g(), 0.4);
                feat1[i].setWeight(DNATools.t(), 0.4);
            }
        }
        
         /**
         * Initialise un vecteur de caracteristiques pour les sequences riches en AC.
         */ 
        private void initFeat2() throws Exception{
            feat2 = new Distribution[10];
            for(int i = 0; i < feat2.length; i++){
                feat2[i] = new SimpleDistribution(DNATools.getDNA());
                //ac rich
                feat2[i].setWeight(DNATools.a(), 0.4);
                feat2[i].setWeight(DNATools.c(), 0.4);
                feat2[i].setWeight(DNATools.g(), 0.1);
                feat2[i].setWeight(DNATools.t(), 0.1);
            }
        }
        
        /**
         * Runs the demo
         * @param args the command line arguments
         */
        public static void main(String[] args) throws Exception{
            TestRun tr = new TestRun();
            tr.classify();
        }
        
    }
