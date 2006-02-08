---
title: BioJava:CookbookFrench:Translation
---

Comment traduire une SymbolList ou une Sequence?
------------------------------------------------

Pour traduire une séquence d'ADN, il vous faudra faire les choses
suivantes:

-   [Transcrire en
    ARN](BioJava:CookbookFrench:Sequence:Transcribe "wikilink");

<!-- -->

-   Obtenir une vue par codon sur la SymbolList.

<!-- -->

-   Traduire en protéine.

Presque tout cela peut se faire en utilisant des méthodes statiques
contenues dans les classes-outils de BioJava. Le code qui suit démontre
la procédure à suivre. Évidemment, si vous avez déjà une séquence d'ARN,
vous pouvez passer la portion transcription.

**Note:** si vous essayez de créer une vue par triplet d'une
*SymbolList* ou d'une *Sequence* dont la longueur ne se divise pas par
3, une exception de type *IllegalArgumentException* sera lancée. Jetez
un coup d'oeil sur la [manière de choisir une portion de la
séquence](BioJava:CookbookFrench:Sequence:SubSequence "wikilink") afin
de faire une bonne sélection.

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.seq.*;


    public class Translate {
      public static void main(String[] args) {
        try {
          // créer une SymbolList d'ADN
          SymbolList symL = DNATools.createDNA("atggccattgaatga");

          // transcrire en ARN (après Biojava1.4,
          // cette méthode sera obsolète) 
          symL = RNATools.transcribe(symL);
          
          // transcrire en ARN (après Biojava1.4,
          // utiliser plutôt cette méthode) 
          symL = RNATools.transcribe(symL);

          // traduire en protéine
          symL = RNATools.translate(symL);

          // démonstration que ça fonctionne
          System.out.println(symL.seqString());
        }

        catch (IllegalAlphabetException ex) {
             /* 
              * ce qui arrivera si vous essayez de transcrire une séquence
              * non-ADN ou de traduire une séquence qui n'est pas une vue 
              * par triplet d'une séquence d'ARN.
              */
          ex.printStackTrace();
        }
        catch (IllegalSymbolException ex) {
        // ce qui se passera si des symboles non-IUB sont 
        // utilisés pour créer la SymbolList d"ADN
          ex.printStackTrace();
        }
     }
    }
