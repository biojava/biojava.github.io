---
title: BioJava:CookbookFrench:Sequence:Reverse
---

Comment obtenir le brin complÉmentaire d'une Sequence ou d'une SymbolList?
--------------------------------------------------------------------------

Pour obtenir le brin complémentaire d'une *SymbolList* ou d'une
*Sequence* d'ADN, vous utilisez simplement la méthode statique
**DNATool.reverseComplement(SymbolList sl)**. Une méthode équivalente
existe dans la classe *RNATools* pour faire la même opération sur les
*Sequences* et *SymbolLists* d'ARN.

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.seq.*;

    public class ReverseComplement {
      public static void main(String[] args) {
       
        try {
          // créer une SymbolList d'ADN
          SymbolList symL = DNATools.createDNA("atgcacgggaactaa");

          // faire le brin complémentaire
          symL = DNATools.reverseComplement(symL);
         
          // prouver que cela à fonctionner
          System.out.println(symL.seqString());
        }
        catch (IllegalSymbolException ex) {
          // ce qui va arriver si vous tenter de faire une séquence
          // d'ADN qui utilise des symboles non-IUB
          ex.printStackTrace();
        }

        catch (IllegalAlphabetException ex) {
          // ce qui va arriver si vous tenter d"obtenir le complément
          // d'une séquence non-ADN avec DNATools
          ex.printStackTrace();
        }
      }
