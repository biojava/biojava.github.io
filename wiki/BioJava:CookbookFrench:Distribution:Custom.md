---
title: BioJava:CookbookFrench:Distribution:Custom
---

Comment créer un Alphabet sur mesure pour ensuite l'utiliser dans une OrderNDistribution?
-----------------------------------------------------------------------------------------

Cet exemple illustre la création d'un *Alphabet* sur mesure de sept
*Symbols*. Ces *Symbols* et *Alphabet* peuvent ensuite servir à créer
des *SymbolLists*, des *Sequences*, des *Distributions*, etc. Lorsque le
*AlphabetManager* crée le *CrossProductAlphabet*, il inferrera que
l'alphabet conditionnant est d'ordre (ordre -1) et que celui de
l'alphabet conditionné est de 1.

Contribution de Russel Smithies.

    import java.io.*;
    import java.util.*;

    import org.biojava.bio.*;
    import org.biojava.bio.dist.*;
    import org.biojava.bio.symbol.*;
    import org.biojava.utils.*;

    public class DistTest {
      public static void main(String[] args) throws Exception {

        //créer un Alphabet sur mesure pour les sept nains
        String[] dNames = {
            "Grumpy", "Sleepy", "Dopey", "Doc", "Happy", "Sneezy", "Bashful"
        };
        Symbol[] dwarfs = new Symbol[7];
        SimpleAlphabet dwarfAlphabet = new SimpleAlphabet();

        //donner un nom à ce nouvel Alphabet
        dwarfAlphabet.setName("Dwarf");

        for (int i = 1; i <= 7; i++) {
         try {
           dwarfs[i - 1] = 
            AlphabetManager.createSymbol((char) ("0" + i), "" + dNames[i - 1],Annotation.EMPTY_ANNOTATION);
               //ajouter vos nouveaux Symbols à cet Alphabet
                dwarfAlphabet.addSymbol(dwarfs[i - 1]);
          }
         catch (Exception e) {
            throw new NestedError(e, "Can"t create symbols to represent dwarf");
          }

        // il est usuel (mais pas essentiel) d'enregistrer les 
        // Alphabets nouvellement crées avec l'AlphabetManager
        AlphabetManager.registerAlphabet(dwarfAlphabet.getName(), dwarfAlphabet);

        }

Créer une *OrderNDstribution* qui utilise l*'Alphabet* Dwarf fraichement
crée.

        // ordre de la distribution
        int order = 3;

        // créer l'Alphabet des produits croisés
        Alphabet a = 
          AlphabetManager.getCrossProductAlphabet(Collections.nCopies(order, dwarfAlphabet));

        // utiliser OrderNDistributionFactory pour créer la Distribution
        OrderNDistribution ond = 
          (OrderNDistribution)OrderNDistributionFactory.DEFAULT.createDistribution(a);

        // créer le DistributionTrainer
        DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();

        // enregistrer la Distribution avec l'entraineur
        dtc.registerDistribution(ond);

Voici comment créer une *SymbolList* à partir de l'alphabet Dwarf pour
pouvoir tester notre nouvelle *OrderNDistribution*. Ceci se fait en
fabriquant une *UniformDistribution* échantillonnée de manière aléatoire
et en ajoutant les *Symbols* dans une *ArrayList*. L*'ArrayList* est
ensuite utilisée pour construire la *SymbolList*.

        // créer une SymbolList aléatoire de nains
        UniformDistribution udist = 
           new UniformDistribution((FiniteAlphabet)dwarfAlphabet);

        int size = 100;
        List list = new ArrayList();

        for (int i = 0; i <  size; i++) {
          list.add(udist.sampleSymbol());
        }

        // créer une SymbolList pour tester la Distribution
        SymbolList symbl = new SimpleSymbolList(dwarfAlphabet, list);

La *SymbolList* est ensuite convertie en *OrderNSymbolList* pour
permettre à une *OrderNDistribution* d'être creer avec elle.

        // convertir en OrderNSymbolList
        symbl = SymbolListViews.orderNSymbolList(symbl, order);

        // ou vous pourriez faire une SymbolList avec fenètre
        // symbl = SymbolListViews.windowedSymbolList(symbl, order);

        // ajouter les comptes à la Distribution
        for (Iterator i = symbl.iterator(); i.hasNext(); ) {
          try {
            dtc.addCount(ond, (Symbol) i.next(), 1.0);
          }
          catch (IllegalSymbolException ex) {
           // vous avez essayer d'ajouter un Symbol qui n'est pas dans votre Alphabet
            ex.printstacktrace()}
        }

        // n'oubliez pas votre entrainement ou aucune de vos valeurs ne sera ajouter
        dtc.train();

        //écrire la Distribution en XML
        XMLDistributionWriter writer = new XMLDistributionWriter();

        writer.writeDistribution(ond, new FileOutputStream("dwarf.xml"));
      }
    }
