---
title: BioJava:CookbookFrench:Count:ToDistrib
---

Comment transformer un Count en Distribution?
---------------------------------------------

Un *Count* se convertit simplement en *Distribution* en utilisant la
méthode statique **countToDistribution()** de la classe
*DistributionTools*.

<java> import org.biojava.bio.dist.\*; import org.biojava.bio.seq.\*;
import org.biojava.bio.symbol.\*;

public class Count2Dist {

` public static void main(String[] args) {`  
`   FiniteAlphabet alpha = RNATools.getRNA();`  
`   AlphabetIndex index = AlphabetManager.getAlphabetIndex(alpha);`  
`   try {`  
`     //faire un Count`  
`     Count c = new IndexedCount(alpha);`  
`     c.increaseCount(RNATools.a(),35.0);`  
`     c.increaseCount(RNATools.c(),44.0);`  
`     c.increaseCount(RNATools.g(),68.0);`  
`     c.increaseCount(RNATools.u(),34.0);`  
`     `  
`     System.out.println("COUNT");`  
`     `  
`     for (int i = 0; i < alpha.size(); i++) {`  
`       AtomicSymbol s = (AtomicSymbol)index.symbolForIndex(i);`  
`       System.out.println(s.getName()+" : "+c.getCount(s));`  
`     }`  
`     `  
`     //transformer en Distribution`  
`     Distribution d = DistributionTools.countToDistribution(c);`  
`     `  
`     System.out.println("\nDISTRIBUTION");`  
`     `  
`     for (int i = 0; i < alpha.size(); i++) {`  
`       Symbol s = index.symbolForIndex(i);`  
`       System.out.println(s.getName()+" : "+d.getWeight(s));`  
`     }`  
`   }`  
`   catch (Exception ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
