---
title: BioJava:CookbookFrench:Alphabets:CustomAlphabets
---

Comment créer un Alphabet sur mesure à partir de Symbols crées aussi sur mesure?
--------------------------------------------------------------------------------

Cet exemple présente la création d'un *Alphabet* appellé 'Binary' qui
contiendra deux *Symbols*: zéro et un. L*'Alphabet* et les *Symbols* sur
mesure peuvent alors être utilisé pour créer des *SymbolLists*, des
*Sequences*, des *Distributions*, etc.

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.\*;
import java.util.\*;

public class Binary {

` public static void main(String[] args) {`

`   // créer le Symbol "zero" sans annotation`  
`   Symbol zero =`  
`       AlphabetManager.createSymbol("zero", Annotation.EMPTY_ANNOTATION);`

`   // créer le Symbol "un", similaire`  
`   Symbol one =`  
`       AlphabetManager.createSymbol("one", Annotation.EMPTY_ANNOTATION);`

`   // regrouper les Symbols dans un Set`  
`   Set symbols = new HashSet();`  
`   symbols.add(zero); symbols.add(one);`

`   // créer l'Alphabet binaire: Binary`  
`   FiniteAlphabet binary = new SimpleAlphabet(symbols, "Binary");`

`   // faire une itération sur les Symbols pour montrer que tout fonctionne`  
`   for (Iterator i = binary.iterator(); i.hasNext(); ) {`  
`     Symbol sym = (Symbol)i.next();`  
`     System.out.println(sym.getName());`  
`   }`

`   // il est pratique usuel d'enregistrer les Alphabets nouvellement`  
`   // crées avec l'AlphabetManager`  
`   AlphabetManager.registerAlphabet(binary.getName(), binary);`

`    /*`  
`     * L'Alphabet nouvellement crée a été enregistré avec l'AlphabetManager`  
`     * sous le nom de "Binary". Si vous cherchez une copie de l'objet avec cet alphabet, il `  
`     * devrait etre identique à celui qui l'a créer`  
`     */`  
`   Alphabet alpha = AlphabetManager.alphabetForName("Binary");`

`   // vérifier que les deux objets sont identiques`  
`   System.out.println(alpha == binary);`  
` }`

} </java>
