---
title: BioJava:CookbookFrench:Locations:Feature
---

Comment créer une caractéristique (*Feature*)?
----------------------------------------------

Dans BioJava, les *Features* sont un peu comme des *Annotation* mais
avec une position (*Location*). Il existe plusieurs types de *Features*
qui tous implémentent l'interface *Feature*. Toutes les implémentations
de *Feature* contiennent une classe interne appellée 'Template'. Cette
classe *Template* spécifie le contenu minimum en information nécessaire
pour créer un *Feature*. Une caractéristique (un *Feature*) est créer
lorsque le patron du *Feature* est passer en argument à la méthode
**createFeature(Feature templ)** d'une implémentation de l'interface
*FeatureHolder*.

En pratique, la classe *Sequence* est un sous-interface de
*FeatureHolder*, afin de lui permettre de contenir des *Features*. Noter
cependant qu'un objet *SymbolList* ne peut contenir de *Features*. Une
autre particuliarité intéressante est le fait que l'interface *Feature*
est aussi un sous-interface de *FeatureHolder*. Ceci permet donc à un
objet *Feature* de contenir des sous-*Features* dans une hiérarchie
imbriquée. Ainsi, un *Feature* 'gene' peut contenir des *Features*
'exon' qui eux-même peuvent contenir des *Features* 'snp' et ainsi de
suite. Un mécanisme de sureté construit à même la classe empêche un
*Feature* de ce contenir lui-même.

Les gabarits de *Feature* peuvent être crées de novo ou copiés à partir
d'un *Feature* déjà existant; l'exemple qui suit montre les deux
méthodes.

    import org.biojava.bio.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.symbol.*;
    import org.biojava.utils.*;

    public class MakeAFeature {
      public static void main(String[] args) {
        //obtenir le gabarit du Feature pour un StrandedFeature
        StrandedFeature.Template templ = new StrandedFeature.Template();

        //remplir l"info pour ce gabarit
        templ.annotation = Annotation.EMPTY_ANNOTATION;
        templ.location = new RangeLocation(3,6);
        templ.source = "my feature";
        templ.strand = StrandedFeature.POSITIVE;
        templ.type = "interesting motif";

        try {
          //la séquence qui va avoir ce Feature
          Sequence seq = DNATools.createDNASequence("atgcgcttaag","seq1");
          System.out.println(seq.getName()+" contains "+seq.countFeatures()+" features");


          System.out.println("adding new feature...");

          //créer ce Feature sur cette séquence et obtenir un pointeur qui nous permettra d'en faire un autre
          Feature f = seq.createFeature(templ);
          System.out.println(seq.getName()+" contains "+seq.countFeatures()+" features");

          //créer un gabarit identique à celui utilisé pour faire f
          templ = (StrandedFeature.Template)f.makeTemplate();
          //on lui donne une position et un nom différent
          templ.location = new PointLocation(4);
          templ.type = "point mutation";


          System.out.println("adding nested feature...");
          //ajouter ce nouveau Feature comme imbriqué dans f
          f.createFeature(templ);

          //observer que countFeatures() ne compte que les Features de 1er niveau
          System.out.println(seq.getName()+" contains "+seq.countFeatures()+" features");
          System.out.println(f.getSource()+" contains "+seq.countFeatures()+" features");
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
      }
    }
