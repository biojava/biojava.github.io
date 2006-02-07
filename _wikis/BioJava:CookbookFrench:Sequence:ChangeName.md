---
title: BioJava:CookbookFrench:Sequence:ChangeName
---

Comment changer le nom d'une Sequence?
--------------------------------------

La plus grande partie des objets BioJava sont immuables. C'est une
mesure de sécurité pour prévenir des changements pouvant corrompre
l'intégrité des données. Une conséquence de cette politique est que la
méthode **setName()** n'existe pas pour des objets de type *Sequence*.
Une façon de changer votre "aperçu" d'une *Sequence* est de créer un
objet de type *ViewSequence* en utilisant l'objet *Sequence* original en
argument dans le constructeur. En arrière-scène, *ViewSequence*,
agissant en wrapper, intercepte certains des appels de méthodes à la
*Sequence* sous-jacente et donne la possibilité de changer le nom. Le
programme suivant montre la manière de faire.

    import java.io.*;

    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;
    import org.biojava.bio.symbol.*;

    public class NameChange {
      public static void main(String[] args) {
        try {
          Sequence seq =
              DNATools.createDNASequence("atgcgctaggctag","gi|12356|ABC123");

          // créer un aperçu de la séquence et en changer le nom
          Sequence view = SequenceTools.view(seq, "ABC123");

          // imprime en FASTA pour prouver le changement de nom
          SeqIOTools.writeFasta(System.out, view);
        }
        catch (IllegalSymbolException ex) {
          // tentative de créer seq avec des symboles non-ADN
          ex.printStackTrace();
        }
        catch (IOException ex) {
          // impossible d'imprimer seq2 sur System.out??
          ex.printStackTrace();
        }
      }
    }
