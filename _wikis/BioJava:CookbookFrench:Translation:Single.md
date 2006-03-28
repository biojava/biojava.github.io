---
title: BioJava:CookbookFrench:Translation:Single
---

Comment traduire un seul codon À son acide aminÉ correspondant?
---------------------------------------------------------------

La méthode générale de traduction donnée ici montre comment utiliser
*RNATools* pour traduire une *SymbolList* d'ARN en une *SymbolList* de
proteine mais la plus grande partie du traitement est cachée derrière la
méthode **translate()**. Si vous voulez seulement traduire un seul codon
pour obtenir son acide aminé correspondant, vous êtes exposé à un peu
plus des détails scabreux mais vous obtenez ainsi la chance de
comprendre ce qui se passe sous le capot.

Il y a plusieurs façons de faire, mais une seule est présentée ici.

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class SingleTranslationDemo {

` public static void main(String[] args) {`  
`   // faire un alphabet composé où les codons sont des Symbols`  
`   Alphabet a = AlphabetManager.alphabetForName("(RNA x RNA x RNA)");`

`   // obtenir notre table de traduction en utilisant `  
`   // un des noms statiques de TranslationTable`  
`   TranslationTable table = RNATools.getGeneticCode(TranslationTable.UNIVERSAL);`

`   try {`  
`     // faire un "codon"`  
`     SymbolList codon = RNATools.createRNA("UUG");`

`     // obtenir la représentation de ce codon comme un Symbol`  
`     Symbol sym = a.getSymbol(codon.toList());`

`     // traduire en acide aminé`  
`     Symbol aminoAcid = table.translate(sym);`

`     /*`  
`      * Cette partie n'est pas nécessaire pour la traduction mais prouve que `  
`      * le Symbol vient du bon Alphabet. Une Exception sera lancee s'il `  
`      * ne l'ai pas.`  
`      */`  
`     ProteinTools.getTAlphabet().validate(aminoAcid);`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
