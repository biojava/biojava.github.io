---
title: BioJava:CookbookFrench:GA
---

Comment puis-je faire un algorithme génétique avec BioJava?
-----------------------------------------------------------

Avec l'introduction du package org.biojavax.ga dans la version
biojava-live, il est maintenant possible de créer des algorithmes
génétiques avec BioJava. Les algorithmes génétiques sont des algorithmes
de simulation, d'optimisation ou de solution de problèmes qui tentent de
faire "évoluer" une solution pour un problème. La solution en évolution
est représenée sous la forme d'un "chromosome", typiquement une chaîne
de caractères binaires quoique d'autres formes d'encodage puissent être
possibles. À chaque génération (ou itération), une population de
chromosomes est disponible. Tel de vrais chromosomes, ils sont capables
de muter et de se recombiner à une certaine fréquence pour chaque
génération. Le point critique est qu'à chaque ronde de
mutation/recombinaison potentielle, seul les chromosomes ayant la
meilleure solution sont sélectionnés pour réplication. Par conséquent,
la tendance de l'algorithme sera de produire des solutions de plus en
plus efficaces pour une population.

L'exemple ci-dessous démontre comment faire un algorithme génétique très
simple en utilisant l'architecture GA de BioJava. Cette architecture est
conçue afin d'être très flexible et utilise une philosophie utilisant
des pièces détachées interchangeables. L'interface au coeur de
l'architecture s'appelle GeneticAlgorithm qui a une implémentation par
défaut, SimpleGeneticAlgorithm. GeneticAlgorithm prends n'importe quelle
Population d'organismes afin de lui faire faire les itérations aux
travers des générations. À chaque étape, une MutationFunction et une
CrossOverFunction sont responsables de l'introduction de variations. Une
FitnessFunction est quand à elle responsable d'évaluer la capacité de
chaque Organisme dans le contexte de sa Population d'origine. Parce que
cette capacité se calcule dans le contexte d'une Population, il est
possible de modéliser la compétition à l'intérieur de cette Population.
Les Organismes sélectionnés pour réplication sont choisis par la
SelectionFunction, d'ordinaire sur la base de cette FitnessFunction. Le
GeneticAlgorithm s'arrêtera d'itérer quand L'obje GAStoppingCriteria le
lui dira. Ceci pourrais se faire sur la base de l'obtention d'une
solution adéquate ou après une certain nombre d'itérations.

Les fonctions ainsi que les critères d'arrêt sont tous des interfaces
Java et par conséquent, des implémentations personnalisées sont
possibles. Les seuls pré-requis pour le GeneticAlgorithm sont:

-   une Population;
-   une MutationFunction;
-   une CrossOverFunction;
-   une FitnessFunction;
-   une SelectionFunction;
-   un GAStoppingCriteria

Les implémentations actuelles sont interchangeables. De plus, le ou les
"chromosomes" des Organismes d'une Population donnée ne sont que des
SymbolLists BioJava et par conséquent, n'importe quel Alphabet peut être
utilisé pour encoder la solution.

Le package org.biojavax.ga est disponible dans la version biojava-live
disponible via CVS. Il sera compris dans la version 1.5 de BioJava à
venir. Il nécessite Java JDK 1.4.

### GADemo.java

<java> package GA;

import java.util.Iterator; import org.biojava.bio.dist.Distribution;
import org.biojava.bio.dist.DistributionTools; import
org.biojava.bio.dist.UniformDistribution; import
org.biojava.bio.symbol.SimpleSymbolList; import
org.biojava.bio.symbol.SymbolList; import
org.biojavax.ga.GAStoppingCriteria; import org.biojavax.ga.Population;
import org.biojavax.ga.Organism; import
org.biojavax.ga.GeneticAlgorithm; import
org.biojavax.ga.impl.SimplePopulation; import
org.biojavax.ga.impl.SimpleOrganism; import
org.biojavax.ga.impl.SimpleGeneticAlgorithm; import
org.biojavax.ga.util.GATools; import
org.biojavax.ga.functions.FitnessFunction; import
org.biojavax.ga.functions.CrossOverFunction; import
org.biojavax.ga.functions.SelectionFunction; import
org.biojavax.ga.functions.ProportionalSelection; import
org.biojavax.ga.functions.MutationFunction; import
org.biojavax.ga.functions.SimpleMutationFunction; import
org.biojavax.ga.functions.SimpleCrossOverFunction;

/\*\*

`* Demonstration d'un AG simple. Il fonctionenre jusqu'a ce qu'un`  
`* organisme contienne un chromosome fait a 75% de 1`  
`*`  
`* @author Mark Schreiber`  
`* @version 1.0`  
`*/`

public class GADemo{

` public static void main(String[] args) throws Exception{`  
`   //print the header`  
`   System.out.println("gen,average_fitness,best_fitness");`

`   //une Distribution uniforme sur un Alphabet binaire`  
`   Distribution bin_dist = new UniformDistribution(GATools.getBinaryAlphabet());`

`   //initialiser la population`  
`   Population pop = new SimplePopulation("demo population");`

`   //y ajouter 100 Organismes`  
`   for(int i = 0; i < 100; i++){`  
`     Organism o = new SimpleOrganism("organism"+i);`

`     /creer un chromosome aleatoire par organisme`  
`     SymbolList[] ch = new SymbolList[1];`  
`     //les symboles sont creer aléatoirement selon la distribution bin_dist`  
`     ch[0] = new SimpleSymbolList(DistributionTools.generateSequence(`  
`         "", bin_dist, 100));`

`     //fixer le choromosome de chaque organisme pour etre ch`  
`     o.setChromosomes(ch);`

`     //ajouter organisme a la population`  
`     pop.addOrganism(o);`  
`   }`

`   //creer une SelectionFunction`  
`   SelectionFunction sf = new ProportionalSelection();`  
`   //fixer sa FitnessFunction`  
`   sf.setFitnessFunction(new DemoFitness());`

`   //creer une nouvelle CrossOverFunction`  
`   CrossOverFunction cf = new SimpleCrossOverFunction();`  
`   //fixer le maximum de permutations par chromosome`  
`   cf.setMaxCrossOvers(1);`  
`   //fixer une probabilite de permutation a 0.01`  
`   cf.setCrossOverProbs(new double[]{0.01});`

`   //creer une nouvelle MutationFunction`  
`   MutationFunction mf = new SimpleMutationFunction();`  
`   //fixer une MutationProbability uniforme de 0.0001`  
`   mf.setMutationProbs(new double[]{0.0001});`  
`   //fixer la gamme des mutations de la fonction a la `  
`   //distribution standard des mutations pour cet Alphabet binaire`  
`   mf.setMutationSpectrum(`  
`       GATools.standardMutationDistribution(GATools.getBinaryAlphabet()));`

`   //creer un GeneticAlgorithm avec ces fonctions`  
`   GeneticAlgorithm genAlg = new SimpleGeneticAlgorithm(pop, mf, cf, sf);`  
`   //performer l'algorithme jusqu'a l'atteinte du critere DemoStopping`  
`   genAlg.run(new DemoStopping());`  
` }`

` /**`  
`  * Implémentation simple de GAStopping Criteria`  
`  *`  
`  */`  
` static class DemoStopping implements GAStoppingCriteria{`

`   /**`  
`    * Pour determiner quand terminer l'algorithme`  
`    */`  
`   public boolean stop (GeneticAlgorithm genAlg){`  
`     System.out.print(genAlg.getGeneration()+",");`  
`     Population pop = genAlg.getPopulation();`  
`     double totalFit = 0.0;`

`     FitnessFunction ff = genAlg.getSelectionFunction().getFitnessFunction();`

`     double fit = 0.0;`  
`     double bestFitness = 0.0;`

`     for (Iterator it = pop.organisms(); it.hasNext(); ) {`  
`       Organism o = (Organism)it.next();`  
`       fit = ff.fitness(o, pop, genAlg);`  
`       bestFitness = Math.max(fit, bestFitness);`  
`       totalFit += fit;`  
`     }`

`     //imprime la capacite moyenne`  
`     System.out.print((totalFit/ (double) pop.size())+",");`  
`     //imprime le meilleur score de capacite`  
`     System.out.println(bestFitness);`

`     //le critere de 75.0 est atteint alors stoppons l'algorithme`  
`     if(bestFitness >= 75.0){`  
`       System.out.println("Organism found with Fitness of 75%");`  
`       return true;`  
`     }`

`     //sinon, on continue`  
`     return false;`  
`   }`  
` }`

` /**`  
`  * Une fonction de valeur construite sur la base du plus riche chromosome en '1'`  
`  * d'un organisme.`  
`  *`  
`  */`  
` static class DemoFitness implements FitnessFunction{`  
`   public double fitness(Organism o, Population p, GeneticAlgorithm genAlg){`  
`     double bestfit = 0.0;`

`     for (int i = 0; i < o.getChromosomes().length; i++) {`  
`       SymbolList csome = o.getChromosomes()[i];`  
`       double fit = 0.0;`  
`       for(int j = 1; j <= csome.length(); j++){`  
`         if(csome.symbolAt(j) == GATools.one())`  
`           fit++;`  
`       }`  
`       bestfit = Math.max(fit, bestfit);`  
`     }`

`     return bestfit;`  
`   }`  
` }`

} </java>
