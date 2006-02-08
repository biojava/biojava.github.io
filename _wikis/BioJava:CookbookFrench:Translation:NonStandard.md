---
title: BioJava:CookbookFrench:Translation:NonStandard
---

Comment utilisé un code génétique non-standard?
-----------------------------------------------

La méthode **translate()** de la classe *RNATools*, utilisée dans
l'exemple général de traduction, n'est utile que si vous voulez utilisez
le code génétique universel. C'est pas très pratique si vous voulez
utiliser un code plus exotique comme les codes mitochondriaux.
Heureusement, il est possible de le faire avec BioJava. *RNATools* a
aussi une méthode statique, **getGeneticCode(String name)**, qui vous
permet d'obtenir un objet *TranslationTable* par son nom.

Les codes génétiques suivants (TranslationTables) sont disponibles:

-   FLATWORM\_MITOCHONDRIAL

<!-- -->

-   FLATWORM\_MITOCHONDRIAL

<!-- -->

-   ASCIDIAN\_MITOCHONDRIAL

<!-- -->

-   EUPLOTID\_NUCLEAR

<!-- -->

-   UNIVERSAL

<!-- -->

-   INVERTEBRATE\_MITOCHONDRIAL

<!-- -->

-   BLEPHARISMA\_MACRONUCLEAR

<!-- -->

-   ALTERNATIVE\_YEAST\_NUCLEAR

<!-- -->

-   BACTERIAL

<!-- -->

-   VERTEBRATE\_MITOCHONDRIAL

<!-- -->

-   CILIATE\_NUCLEAR

<!-- -->

-   MOLD\_MITOCHONDRIAL

<!-- -->

-   ECHINODERM\_MITOCHONDRIAL

Ce sont des noms valides qui peuvent servir d'argument dans la méthode
statique **RNATools.getGeneticCode(String name)**. Ces noms sont aussi
disponibles comme *String* statiques dans la classe *TranslationTools*.

L'exemple suivant montre comment utiliser le code génétique pour la
traduction des gènes nucléaire chez les Euplotides (ici, UGA = Cys).

    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class SingleTranslationDemo {
      public static void main(String[] args) {
        // faire un alphabet composé où les codons sont des Symbols
        Alphabet a = AlphabetManager.alphabetForName("(RNA x RNA x RNA)");

        // obtenir notre table de traduction en utilisant un des noms statiques de TranslationTable
        TranslationTable table = RNATools.getGeneticCode(TranslationTable.UNIVERSAL);

        try {
          // faire un "codon"
          SymbolList codon = RNATools.createRNA("UUG");

          // obtenir la représentation de ce codon comme un Symbol
          Symbol sym = a.getSymbol(codon.toList());

          // traduire en acide aminé
          Symbol aminoAcid = table.translate(sym);

          /*
           * Cette partie n'est pas nécessaire pour la traduction mais prouve que 
           * le Symbol vient du bon Alphabet. Une Exception sera lancee s'il 
           * ne l'ai pas.
           */
          ProteinTools.getTAlphabet().validate(aminoAcid);
        }
        catch (IllegalSymbolException ex) {
          ex.printStackTrace();
        }
      }
    }
