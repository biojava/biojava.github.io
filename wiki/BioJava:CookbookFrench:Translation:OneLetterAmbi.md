---
title: BioJava:CookbookFrench:Translation:OneLetterAmbi
---

Comment obtenir la séquence en acide aminés avec le code à une lettre si la séquence nucléotidique traduite contient des ambiguités?
------------------------------------------------------------------------------------------------------------------------------------

Dans certains contextes (par exemple, chez certains virus tel HIV), le
séquençage de populations est fait afin de trouver les mutations pouvant
induire la résistance à certaines drogues. Dans le cas du HIV,
l'annotation d'une mutation se fait selon la convention suivante: par
exmeple, I47VA signifie qu'à la position 47, l'acide aminé de référence
I est remplacé par V ou A dans la population séquencée.

L'exemple suivant montre comment faire afin de récupérer les valeurs du
code à une lettre nécessaire pour faire une telle annotation pour chaque
position d'une séquence nucléotidique traduite.

<java> import java.util.Iterator; import org.biojava.bio.BioException;
import org.biojava.bio.seq.DNATools; import
org.biojava.bio.seq.io.SymbolTokenization; import
org.biojava.bio.symbol.Alphabet; import
org.biojava.bio.symbol.FiniteAlphabet; import
org.biojava.bio.symbol.Symbol; import org.biojava.bio.symbol.SymbolList;

public class AmbiguitySolution {

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

`                   // Pour imprimer le code à une lettre`  
`                   System.out.println("one letter code: " + toke.tokenizeSymbol(sym2));`

`               // Pour imprimer le code à trios lettres,`  
`               // Decommenter cette ligne`  
`               //System.out.println("name: " + sym2.getName());`  
`               }`  
`               System.out.println("\n");`  
`           }`  
`       } catch (BioException ex) {`  
`           ex.printStackTrace();`  
`       }`  
`   }`

} </java>
