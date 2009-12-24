---
title: BioJava:CookBookItaliano:Translation:NonStandart
---

Come posso utilizzare una tavola di traduzione non standard?
------------------------------------------------------------

L'utile metodo translate() appartenente a RNATools, utilizzato
nell'esempio generale di traduzione, viene utilizzato solamente quando
si utilizza la tavola di traduzione Universale. Questo metodo non
funziona se si ha la necessità di utilizzare le rare tavole di
traduzione Mitocondriali. Fortunatamente questo può essere fatto con
Biojava. RNATools ha metodo statico getGeneticCode(String name) che ci
permette di ottenere una diversa tavola di traduzione, un oggetto della
classe TranslationTable, a partire dal nome.

Sono disponibili le seguenti tavole di traduzione:

-   FLATWORM\_MITOCHONDRIAL
-   YEAST\_MITOCHONDRIAL
-   ASCIDIAN\_MITOCHONDRIAL
-   EUPLOTID\_NUCLEAR
-   UNIVERSAL
-   INVERTEBRATE\_MITOCHONDRIAL
-   BLEPHARISMA\_MACRONUCLEAR
-   ALTERNATIVE\_YEAST\_NUCLEAR
-   BACTERIAL
-   VERTEBRATE\_MITOCHONDRIAL
-   CILIATE\_NUCLEAR
-   MOLD\_MITOCHONDRIAL
-   ECHINODERM\_MITOCHONDRIAL

Questi nomi possono essere passati come argomento al metodo statico
RNATools.getGeneticCode(String name). Questi nomi sono anche presenti
come Stringhe costanti della classe TranslationTools.

Il seguente programma mostra l'utilizzo della tavola di traduzione
relativa a Euplotid Nuclear (dove UGA = Cys).

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class AlternateTranslation {

` public static void main(String[] args) {`

`   //ottengo una diversa tavola di traduzione`  
`   TranslationTable eup = RNATools.getGeneticCode(TranslationTable.EUPL_NUC);`

`   try {`  
`     //creo una sequenza di DNA che include il codono 'tga'`  
`     SymbolList seq = DNATools.createDNA("atgggcccatgaaaaggcttggagtaa");`

`     //lo trascrivo in RNA`  
`     seq = RNATools.transcribe(seq);`

`     //creo una vista della sequenza di RNA in codoni, normalmente questo è fatto internamente nel metodo RNATool.translate()`  
`     seq = SymbolListViews.windowedSymbolList(seq, 3);`

`     //traduciamo`  
`     SymbolList protein = SymbolListViews.translate(seq, eup);`

`     //stampa a video la proteina`  
`     System.out.println(protein.seqString());`  
`   }`  
`   catch (Exception ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
