---
title: BioJava:CookbookFrench:Sequence:Edit
---

Comment éditer une Sequence?
----------------------------

Il est parfois nécessaire de modifier l'ordre des *Symbols* dans une
*SymbolList* ou une *Sequence* comme par exemple, d'enlever, ajouter ou
modifier des bases dans une séquence d'ADN. Les *SymbolLists* de Biojava
ont une méthode appelée **edit(Edit e)** qui prend un objet *Edit* et
exécute cette modification sur la *SymbolList*. L'objet *Edit* prends
des arguments qui spécifient où la modification devrait commencer,
combien d'éléments seront changés et une *SymbolList* qui va remplacer
ces éléments.

Il vaut la peine de mentionner que plusieurs des implémentations Biojava
de *Sequence* et de *SymbolList* ne permettent pas de faire des
modifications, parce que celles-ci pourraient invalider des
caractéristiques (*Features*) et des notes (*Annotations*) qui en
dépendent. La meilleure stratégie dans ce cas est de faire une copie des
*Symbols* dans la *Sequence* ou *SymbolList* et modifier la copie. Ceci
est démontré dans l'example de code ci-dessous.

    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;

    public class EditExamples {
      public static void main(String[] args) throws Exception{
        
        // il est impossible de modifier la séquence
        Sequence seq = DNATools.createDNASequence("atggct", "seq");

        // donc il est nécessaire de faire une copie de ses Symbols
        // en utilisant un "constructeur de copie"
        SimpleSymbolList syms = new SimpleSymbolList(seq);

        // ajouter à la fin, en effaçant 0 symbols, "cc"
        Edit e = new Edit(seq.length()+1, 0, DNATools.createDNA("cc"));
        
        // appliquer la modification
        syms.edit(e);
        
        // devrait afficher la chaîne atggctcc
        System.out.println(syms.seqString());

        // ajouter au début, en effaçant 0 symbols, "tt"
        e = new Edit(1, 0, DNATools.createDNA("tt"));
        syms.edit(e);
        //devrait être ttatggctcc
        System.out.println(syms.seqString());

        //insérer à la  position 4, en effacant 0 symbols, "aca"
        e = new Edit(4, 0, DNATools.createDNA("aca"));
        syms.edit(e);

        // devrait être ttaacatggctcc
        System.out.println(syms.seqString());

        // insérer à la position 2 en remplaçant 3 bases avec "ggg"
        e = new Edit(2, 3, DNATools.createDNA("ggg"));
        syms.edit(e);

        // devrait afficher la chaîne tgggcatggctcc
        System.out.println(syms.seqString());

        // enlever les 5 premières bases (remplacer 5 bases avec rien)
        e = new Edit(1, 5, SymbolList.EMPTY_LIST);
        syms.edit(e);

        // devrait afficher la chaîne atggctcc
        System.out.println(syms.seqString());

        // maintenant un example plus compliqué

        // remplacer les positions 2 and 3 avec aa et après y insérer tt
        e = new Edit(2, 2, DNATools.createDNA("aatt"));
        syms.edit(e);

        // devrait afficher la chaîne aaattgctcc
        System.out.println(syms.seqString());
      }
    }
