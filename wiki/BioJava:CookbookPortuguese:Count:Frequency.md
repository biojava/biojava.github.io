---
title: BioJava:CookbookPortuguese:Count:Frequency
---

Translating...

Como eu calculo a frequencia de um simbolo em uma Sequence?
-----------------------------------------------------------

Uma das classes mais úteis no BioJava é a classe Distribution. Esta
classe é um mapa de frequencias referentes aos simbolos. As
distribuições são calculadas com base nos simbolos observados
utilizando-se a classe DistributionTrainerContext. Esta classe, por sua
vez, pode treinar diversas distribuições registradas no contexto
compreendendo os simbolos de qualquer alfabeto.

O programa a seguir demonstra o treinamento de 3 (tres) Distribuições
com sequencias de 3 (tres) alfabetos diferentes.

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;
import org.biojava.bio.dist.\*; import org.biojava.utils.\*; import
java.util.\*;

public class Frequency {

` public static void main(String[] args) {`

`   try {`  
`     //Cria uma SymbolList de DNA`  
`     SymbolList dna = DNATools.createDNA("atcgctagcgtyagcntatsggca");`

`     //Cria uma SymbolList de RNA`  
`     SymbolList rna = RNATools.createRNA("aucgcuaucccaggga");`

`     //Cria uma SymbolList de Proteina`  
`     SymbolList protein = ProteinTools.createProtein("asrvgchvhilmkapqrt");`

`     SymbolList[] sla = {dna, rna, protein};`

`     //instancia a classe DistributionTrainerContext`  
`     DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();`

`     //Cria 3 (tres) Distributions`  
`     Distribution dnaDist =`  
`         DistributionFactory.DEFAULT.createDistribution(dna.getAlphabet());`  
`     Distribution rnaDist =`  
`         DistributionFactory.DEFAULT.createDistribution(rna.getAlphabet());`  
`     Distribution proteinDist =`  
`         DistributionFactory.DEFAULT.createDistribution(protein.getAlphabet());`

`     Distribution[] da = {dnaDist, rnaDist, proteinDist};`

`     //registra as Distributions no treinador`  
`     dtc.registerDistribution(dnaDist);`  
`     dtc.registerDistribution(rnaDist);`  
`     dtc.registerDistribution(proteinDist);`

`     //para cada Sequence`  
`     for (int i = 0; i < sla.length; i++) {`  
`       //conte cada Symbol na sua Distribution apropriada`  
`       for(int j = 1; j <= sla[i].length(); j++){`  
`         dtc.addCount(da[i], sla[i].symbolAt(j), 1.0);`  
`       }`  
`     }`

`     //treine as Distributions`  
`     dtc.train();`

`     //imprime os pesos de cada Distribution`  
`     for (int i = 0; i < da.length; i++) {`  
`       for (Iterator iter = ((FiniteAlphabet)da[i].getAlphabet()).iterator();`  
`            iter.hasNext(); ) {`

`         Symbol sym = (Symbol)iter.next();`  
`         System.out.println(sym.getName()+" : "+da[i].getWeight(sym));`  
`       }`  
`       System.out.println("\n");`  
`     }`

`   }`  
`   catch (Exception ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
