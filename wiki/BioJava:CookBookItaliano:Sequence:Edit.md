---
title: BioJava:CookBookItaliano:Sequence:Edit
---

Come posso modificare una Sequence o una SymbolList?
----------------------------------------------------

Molte volte si ha la necessità di modificare l'ordine dei simboli in una
SymbolList o in una Sequence. Ad esempio si può voler eliminare,
inserire o riscrivere alcune basi di una Sequenza di DNA. Le SymbolList
BioJava hano un metodo chiamato edit(Edit e) che accetta come argomento
un oggetto edit che effettuerà la modifica sulla SymbolList. L'oggetto
Edit ammette un argomento che specifica da dove la modifica deve
avvenire, quanti residui devono cambiare e la SymbolList con i residui
aggiornati.

Vale la pena notare che molte implementazioni Biojava delle Sequence o
delle SymbolList non permettono operazioni di modifica perchè potrebbero
invalidare le Features o le Annotations sottostanti. La migliore
strategia da utilizzare è quella di effettuare una copia dei Symbols
della Sequence o della SymbolList e lavorare su quella.

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class EditExamples {

` public static void main(String[] args) throws Exception{`

`   //creo una sequenza che ora non è modificabile`  
`   Sequence seq = DNATools.createDNASequence("atggct", "seq");`

`   //effettuo una copia dei simboli utilizzando il "copy constructor"`  
`   SimpleSymbolList syms = new SimpleSymbolList(seq);`

`   //voglio aggiungere alla fine della sequenza i simboli "cc", senza sovrascrivere alcun simbolo`  
`   Edit e = new Edit(seq.length()+1, 0, DNATools.createDNA("cc"));`  
`   //applico la modifica`  
`   syms.edit(e);`  
`   //verifico che la sequenza sia atggctcc`  
`   System.out.println(syms.seqString());`

`   //voglio aggiungere all'inizio della sequenza i simboli "tt", senza sovrascrivere alcun simbolo`  
`   e = new Edit(1, 0, DNATools.createDNA("tt"));`  
`   syms.edit(e);`  
`   //verifico che la sequenza sia ttatggctcc`  
`   System.out.println(syms.seqString());`

`   //voglio aggiungere in posizione 4 della sequenza i simboli "aca", senza sovrascrivere alcun simbolo`  
`   e = new Edit(4, 0, DNATools.createDNA("aca"));`  
`   syms.edit(e);`  
`   //should now be ttaacatggctcc`  
`   System.out.println(syms.seqString());`

`   //voglio sovrascrivere in posizione 2 3 basi con "ggg"`  
`   e = new Edit(2, 3, DNATools.createDNA("ggg"));`  
`   syms.edit(e);`  
`   //verifico che la sequenza sia tgggcatggctcc`  
`   System.out.println(syms.seqString());`

`   //voglio eliminare dall'inizio della sequenza 5 basi (sovrascrivo 5 basi con nulla)`  
`   e = new Edit(1, 5, SymbolList.EMPTY_LIST);`  
`   syms.edit(e);`  
`   //verifico che la sequenza sia atggctcc`  
`   System.out.println(syms.seqString());`

`   //un ultimo esempio più complesso`

`   //sovrascriov la 2 e la 3 posizione con 'aa' e dopo inserisco 'tt'`  
`   e = new Edit(2, 2, DNATools.createDNA("aatt"));`  
`   syms.edit(e);`  
`   //verifico che la sequenza sia aaattgctcc`  
`   System.out.println(syms.seqString());`  
` }`

} </java>
