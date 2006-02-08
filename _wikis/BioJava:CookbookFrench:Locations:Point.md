---
title: BioJava:CookbookFrench:Locations:Point
---

Comment faire pour spécifier une position ponctuelle (*PointLocation*)?
-----------------------------------------------------------------------

Dans BioJava, les positions dans une *Sequence* sont spécifiées avec des
objets qui implémentent l'interface *Location*.

Une position de type *PointLocation* est la position d'un unique
symbole, qui l'inclut, dans une *SymbolList* ou une *Sequence*. Les
positions de type *PointLocation* ont des constructeurs publiques et
sont faciles à instantier. L'exemple suivant montre comment créer une
*PointLocation* spécifiant un seul *Symbol* d'une *SymbolList*.

**Note:** Il faut se souvenir que BioJava utilise un système de
coordonnées biologiques. Par conséquent, la première *PointLocation*
possible d'une *Sequence* sera à l'index 1 et non 0.

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.seq.*;

    public class SpecifyPoint {
      public static void main(String[] args) {
        try {
          //créer une PointLocation désignant le 3ème résidu
          PointLocation point = new PointLocation(3);
          //imprimer cette position
          System.out.println("Location: "+point.toString());

          //crŽer une SymbolList
          SymbolList sl = RNATools.createRNA("gcagcuaggcggaaggagc");
          System.out.println("SymbolList: "+sl.seqString());

          //obtenir la SymbolList spécifiée par la  PointLocation point
          SymbolList sym = point.symbols(sl);
          //dans ce cas, la SymbolList ne contiendra qu'une seule base
          System.out.println("Symbol specified by Location: "+sym.seqString());
        }
        catch (IllegalSymbolException ex) {
          //création de sl avec un symbole illégal
          ex.printStackTrace();
        }
      }
    }
