---
title: BioJava:CookbookFrench:Alphabets:Ambiguity
---

Comment faire pour créer un Symbol ambiguë comme Y ou R?
--------------------------------------------------------

L'UIB defini des codes standard pour les symboles ambiguës tel que Y
(représentant C ou T) et R (représentant G ou C) et N (tous les
nucléotides). BioJava représente ces *Symbols* sous la forme de
*BasisSymbols*. Ces objets *BasisSymbol* peuvent contenir un ou
plusieurs composantes de type *Symbol* qui sont des membres valides du
même alphabet que celui qu'utilise *BasisSymbol*. Par conséquent, ils
peuvent donc devenir ambiguës.

Généralement, un *Symbol* ambiguë est récupéré en appelant la méthode
**getAmbiguity(Set symbols)** de l'Alphabet à partir du quel le *Symbol*
en question est supposé provenir. Dans le cas de la création du *Symbol*
Y, l'ensemble (Set) utilisé comme argument contiendra les *Symbols* 'C'
et 'T' de l*'Alphabet* ADN.

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.seq.*;
    import java.util.*;

    public class Ambiguity {
    public static void main(String[] args) {
    try {
          // obtenir l'alphabet d"ADN
          Alphabet dna = DNATools.getDNA();

          // créer le Symbol "Y"
          Set symbolsThatMakeY = new HashSet();
          symbolsThatMakeY.add(DNATools.c());
          symbolsThatMakeY.add(DNATools.t());
          Symbol y = dna.getAmbiguity(symbolsThatMakeY);

          // imprimer l'info à propos du BasisSymbol  "Y"
          System.out.println("Formal name of "Y" is: "+y.getName());
          System.out.println("Class type of "Y" is: "+y.getClass().getName());

          // décomposer le BasisSymbol Y en ces composantes AtomicSymbols
          Alphabet matches = y.getMatches();
          System.out.print("The "Y" Symbol is made of: ");

          // nous savons que l'ensemble est de nature fini(FiniteAlphabet)
          // donc nous pouvons en imposer le type
          for(Iterator i = ((FiniteAlphabet)matches).iterator(); i.hasNext();){
            Symbol sym = (Symbol)i.next();
            System.out.print(sym.getName());
            if(i.hasNext())
              System.out.print(", ");
          }

        }
        catch (IllegalSymbolException ex) {
          ex.printStackTrace();
        }
      }
    }
    <pre>
