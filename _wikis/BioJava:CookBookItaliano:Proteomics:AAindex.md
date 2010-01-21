---
title: BioJava:CookBookItaliano:Proteomics:AAindex
---

Come posso analizzare le proprietà dei vari simboli di una sequenza peptidica utilizzano Amino Acid Index DataBase?
-------------------------------------------------------------------------------------------------------------------

Per poter analizzare le proprietà dei vari residui che compongono la
sequenza amminoacidica, ad esempio l'idrofobicità media, è possibile
utilizzare l'interfaccia
`[http://www.biojava.org/docs/api14/org/biojava/bio/symbol/SymbolPropertyTable.html SymbolPropertyTable]`.
Il suo metodo
`[http://www.biojava.org/docs/api14/org/biojava/bio/symbol/SymbolPropertyTable.html#getDoubleValue(org.biojava.bio.symbol.Symbol) getDoubleValue]`
ritorna un valore numerico per un dato amminoacido. il database [Amino
Acid Index](http://www.genome.ad.jp/dbget/aaindex.html) contiene oltre
500 tipi differenti tavole di proprietà di amminoacidi e di coppie di
amminoacidi. Queste tavole sono reperibili a questo indirizzo ftp
*[aaindex1](ftp://ftp.genome.ad.jp/pub/db/genomenet/aaindex/aaindex1)* o
http [AAindex1](http://www.genome.jp/dbget-bin/show_man?aaindex) in
formato testo. Questo file può essere caricato tramite la classe
`AAindexStreamReader`. Poi, le tavole delle proprietà possono essere
gestite una dopo l'altra tramite il metodo `nextTable`, che restituisce
per ogni tavola un oggetto di tipo `AAindex` che implementa
l'interfaccia `SymbolPropertyTable`. Se il file deve essere mantenuto in
memoria e bisogna fare un accesso casuale a dette tavole basta
utilizzare `SimpleSymbolPropertyTableDB` inizializzandolo con un oggetto
di tipo `AAindexStreamReader`.

L'esempio seguente mostra come calcolare l'idrofobicità media di un
gruppo di residui di una data sequenza peptidica (in questo esempio la
sequenza contiene solamente 20 residui) sulla base della tavola
*CIDH920105* preso dall'indice *aaindex1*:

<java> SimpleSymbolPropertyTableDB db = new
SimpleSymbolPropertyTableDB(new AAindexStreamReader(new
FileReader("aaindex1"))); AAindex hydrophobicity = (AAindex)
db.table("CIDH920105"); SymbolList symbols =
ProteinTools.createProtein("ARNDCEQGHILKMFPSTWYV"); double hp = 0.0; for
(int i = 1; i \<= symbols.length(); i++) {

`   hp += hydrophobicity.getDoubleValue(symbols.symbolAt(i));`

} System.out.println("Average hydrophobicity: " + Double.toString(hp /
symbols.length()));</java> </java>
