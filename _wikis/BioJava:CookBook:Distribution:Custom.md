---
title: BioJava:CookBook:Distribution:Custom
---

How do I make a custom Alphabet then take an OrderNDistribution over it?
------------------------------------------------------------------------

This example demonstrates the creation of a custom Alphabet that will
have seven Symbols. The custom made Symbols and Alphabet can then be
used to make SymbolLists, Sequences, Distributions etc. When the
AlphabetManager creates the CrossProductAlphabet, it will infer that the
order of the conditioning alphabet is (order - 1) and the order of the
conditioned alphabet is 1.

Contributed by Russell Smithies.

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.\*; import org.biojava.bio.dist.\*; import
org.biojava.bio.symbol.\*; import org.biojava.utils.\*;

public class DistTest {

` public static void main(String[] args) throws Exception {`

`   //create a custom dwarf Alphabet`  
`   String[] dNames = {`  
`       "Grumpy", "Sleepy", "Dopey", "Doc", "Happy", "Sneezy", "Bashful"`  
`   };`  
`   Symbol[] dwarfs = new Symbol[7];`  
`   SimpleAlphabet dwarfAlphabet = new SimpleAlphabet();`

`   //give the new Alphabet a name`  
`   dwarfAlphabet.setName("Dwarf");`

`   for (int i = 1; i <= 7; i++) {`  
`     try {`  
`       dwarfs[i - 1] = AlphabetManager.createSymbol((char) ('0' + i), "" + dNames[i - 1],Annotation.EMPTY_ANNOTATION);`  
`        //add your new Symbols to the Alphabet`  
`           dwarfAlphabet.addSymbol(dwarfs[i - 1]);`  
`     }`  
`     catch (Exception e) {`  
`       throw new NestedError(e, "Can't create symbols to represent dwarf");`  
`     }`

`   //it is usual (but not essential) to register newly creates Alphabets with the AlphabetManager`  
`   AlphabetManager.registerAlphabet(dwarfAlphabet.getName(), dwarfAlphabet);`

`   }`

</java>

Create an OrderNDstribution using the newly built Dwarf Alphabet

<java>

`   //order of the distribution`  
`   int order = 3;`

`   //create the cross-product Alphabet`  
`   Alphabet a = AlphabetManager.getCrossProductAlphabet(Collections.nCopies(order, dwarfAlphabet));`

`   //use the OrderNDistributionFactory to create the Distribution`  
`   OrderNDistribution ond = (OrderNDistribution)OrderNDistributionFactory.DEFAULT.createDistribution(a);`

`   //create the DistributionTrainer`  
`   DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();`

`   //register the Distribution with the trainer`  
`   dtc.registerDistribution(ond);`

</java>

This shows the creation of of a SymbolList from the Dwarf Alphabet so we
can test our new OrderNDistribution. This is done by making, a
UniformDistribution which is randomly sampled and adding the Symbols to
an ArrayList. The ArrayList is then used to build the SymbolList.

<java>

`   //create a random symbolList of dwarves`  
`   UniformDistribution udist = new UniformDistribution((FiniteAlphabet)dwarfAlphabet);`

`   int size = 100;`  
`   List list = new ArrayList();`

`   for (int i = 0; i < size; i++) {`  
`     list.add(udist.sampleSymbol());`  
`   }`

`   //create a symbolList to test the Distribution`  
`   SymbolList symbl = new SimpleSymbolList(dwarfAlphabet, list);`

</java>

The SymbolList is changed into an OrderNSymbolList to enable an
OrderNDistribution to be made over it.

<java>

`   //make it into an orderNSymbolList`  
`   symbl = SymbolListViews.orderNSymbolList(symbl, order);`

`   //or you could have a windowed symbolList`  
`   //symbl = SymbolListViews.windowedSymbolList(symbl, order);`

`   //add counts to the distribution`  
`   for (Iterator i = symbl.iterator(); i.hasNext(); ) {`  
`     try {`  
`       dtc.addCount(ond, (Symbol) i.next(), 1.0);`  
`     }`  
`     catch (IllegalSymbolException ex) {`  
`      //you  tried to add a Symbol not in your Alphabet`  
`       ex.printstacktrace()}`  
`   }`

`   // don't forget to train or none of your weights will be added`  
`   dtc.train();`

`   //write the distribution to XML`  
`   XMLDistributionWriter writer = new XMLDistributionWriter();`

`   writer.writeDistribution(ond, new FileOutputStream("dwarf.xml"));`  
` }`

} </java>
