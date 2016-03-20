---
title: BioJava:CookBookItaliano:Translation:OneLetterAmbi
---

Come è possibile ottenere una traduzione con codice a una lettera di una sequenza che contiene ambiguità?
---------------------------------------------------------------------------------------------------------

In un contesto di ricerca sull'HIV, si effettua il sequenziamento del
genoma della popolazione per mutazioni che possono indurre una
resistenza contro determinate droge. Per questo motivo le sequenze
provenienti dall'HIV spesso contengono ambiguità. Le annotazioni
utilizzate per le mutazioni dell'HIV seguono la seguente convenzione:
I47VA ("47" è la posizione di riferimento nella sequenza, I l'aminoacido
nella sequenza di riferimento, "V,A" gli aminoacidi nella sequenza su
cui stiamo lavorando).

Questo esempio mostra come ottenere la codifica ad una lettera
necessaria per questo tipo di annotazione in ogni posizione della
sequenza tradotta:

<java> import java.util.Iterator; import org.biojava.bio.BioException;
import org.biojava.bio.seq.DNATools; import
org.biojava.bio.seq.io.SymbolTokenization; import
org.biojava.bio.symbol.Alphabet; import
org.biojava.bio.symbol.FiniteAlphabet; import
org.biojava.bio.symbol.Symbol; import org.biojava.bio.symbol.SymbolList;

public class TranslationOneLetter {

`   public static void main(String[] args) {`  
`       try {`  
`           SymbolList symL = DNATools.createDNA("atnatggnnatg");`  
`           SymbolList symL2 = DNATools.toProtein(symL);`

`           System.out.println("Translated sequence: " + symL2.seqString() + "\n");`

`           System.out.println("Show codons in three letter code taking ambiguities into account:");`  
`           for (Iterator i = symL2.iterator(); i.hasNext();) {`  
`               Symbol sym = (Symbol) i.next();`  
`               System.out.println("" + sym.getName());`  
`           }`

`           System.out.println("Show codons in one letter code: " + symL2.seqString());`

`           SymbolTokenization toke = symL2.getAlphabet().getTokenization("token");`  
`           for (Iterator i = symL2.iterator(); i.hasNext();) {`  
`               Symbol sym = (Symbol) i.next();`

`               Alphabet arg = sym.getMatches();`

`               for (Iterator i2 = ((FiniteAlphabet) arg).iterator(); i2.hasNext();) {`

`                   Symbol sym2 = (Symbol) i2.next();`

`                   //questo stampa il codice a 1 lettera`  
`                   System.out.println("one letter code: " + toke.tokenizeSymbol(sym2));`

`               //questo stampa il codice a 3 lettere`  
`               System.out.println("name: " + sym2.getName());`  
`               }`  
`               System.out.println("\n");`  
`           }`  
`       } catch (BioException ex) {`  
`           ex.printStackTrace();`  
`       }`  
`   }`

} </java>
