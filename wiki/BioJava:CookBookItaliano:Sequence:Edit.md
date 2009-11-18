---
title: BioJava:CookBookItaliano:Sequence:Edit
---

Come posso modificare una Sequence o una SymbolList?
----------------------------------------------------

Molte volte si ha la necessità di modificare l'ordine dei simboli in una
SymbolList o in una Sequence. Ad esempio si può voler eliminare,
inserire o riscrivere alcune basi in una Sequenza di DNA. Le SymbolList
BioJava hano un metodo chiamato edit(Edit e) che accetta come argomento
un oggetto edit che effettuerà la modifica sulla SymbolList. L'oggetto
Edit ammette un argomento che specifica da dove la modifica deve
avvenire, quanti residui devono cambiare e la SymbolList con i residui
aggiornati.

It is worth noting that many BioJava implementations of Sequence and
SymbolList do not allow edit operations as this may invalidate
underlying Features or Annotations. The best strategy is to make a copy
of the Symbols in the Sequence or SymbolList and operate on those.

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class EditExamples {

` public static void main(String[] args) throws Exception{`  
`   //you can't actually edit a sequence`  
`   Sequence seq = DNATools.createDNASequence("atggct", "seq");`

`   //so you need to get a copy of the Symbols in it`  
`   //using a "copy constructor"`  
`   SimpleSymbolList syms = new SimpleSymbolList(seq);`

`   //add to the end, while overwriting 0 symbols, "cc"`  
`   Edit e = new Edit(seq.length()+1, 0, DNATools.createDNA("cc"));`  
`   //apply the edit`  
`   syms.edit(e);`  
`   //should now be atggctcc`  
`   System.out.println(syms.seqString());`

`   //insert at the start, while overwriting 0 Symbols "tt"`  
`   e = new Edit(1, 0, DNATools.createDNA("tt"));`  
`   syms.edit(e);`  
`   //should now be ttatggctcc`  
`   System.out.println(syms.seqString());`

`   //insert at position 4, overwriting 0 symbols "aca"`  
`   e = new Edit(4, 0, DNATools.createDNA("aca"));`  
`   syms.edit(e);`  
`   //should now be ttaacatggctcc`  
`   System.out.println(syms.seqString());`

`   //overwrite at position 2, 3 bases with "ggg"`  
`   e = new Edit(2, 3, DNATools.createDNA("ggg"));`  
`   syms.edit(e);`  
`   //should now be tgggcatggctcc`  
`   System.out.println(syms.seqString());`

`   //delete from the start 5 bases (overwrite 5 bases with nothing)`  
`   e = new Edit(1, 5, SymbolList.EMPTY_LIST);`  
`   syms.edit(e);`  
`   //should now be atggctcc`  
`   System.out.println(syms.seqString());`

`   //now a more complex example`

`   //overwrite positions two and three with aa and then insert tt`  
`   e = new Edit(2, 2, DNATools.createDNA("aatt"));`  
`   syms.edit(e);`  
`   //should now be aaattgctcc`  
`   System.out.println(syms.seqString());`  
` }`

} </java>
