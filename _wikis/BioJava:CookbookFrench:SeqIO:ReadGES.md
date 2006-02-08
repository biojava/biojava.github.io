---
title: BioJava:CookbookFrench:SeqIO:ReadGES
---

Comment Faire pour lire un fichier en format GenBank, swissprot ou EMBL?
------------------------------------------------------------------------

La classe *SeqIOTools* contient des méthodes pour lire les fichiers en
format GenBank, SwissProt et EMBL. Parce qu'un fichier ecrit dans un de
ces formats peut contenir plus d'une séquence, *SeqIOTools* retournera
un *SequenceIterator* qui peut être utilisé pour itérer sur toutes les
séquences. Un des avantages de ce modèle est que les objets *Sequences*
ne sont lues et crées qu'au besoin ce qui permet de traiter de grandes
collections de séquences avec des ressources modestes.

### Lire un fichier GenBank

    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;
    import java.io.*;
    import org.biojava.bio.*;
    import java.util.*;

    public class ReadGB {
      public static void main(String[] args) {
        BufferedReader br = null;
        try {
         // créer un BufferedReader pour lire le fichier specifié par args[0]
          br = new BufferedReader(new FileReader(args[0]));
        }
        catch (FileNotFoundException ex) {
          // ne peut trouver le fichier spécifié par args[0]
          ex.printStackTrace();
          System.exit(-1);
        }

        // lire le fichier GenBank
        SequenceIterator sequences = SeqIOTools.readGenbank(br);

        // itérer parmi les séquences
        while(sequences.hasNext()){
          try {
            Sequence seq = sequences.nextSequence();
            // à vous de décider quoi faire avec la séquence
           }
          catch (BioException ex) {
            // pas en format GenBank
            ex.printStackTrace();
          }catch (NoSuchElementException ex) {
            // requête faite pour une séquence lorsqu'aucune n'existe
            ex.printStackTrace();
          }
        }
      }
    }

### Lire un fichier SwissProt

    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;
    import java.io.*;
    import org.biojava.bio.*;
    import java.util.*;

    public class ReadSwiss {
      public static void main(String[] args) {
        BufferedReader br = null;

        try {
          // créer un BufferedReader pour lire le fichier spécifié par args[0]
          br = new BufferedReader(new FileReader(args[0]));
        }
        catch (FileNotFoundException ex) {
          // ne peut trouver le fichier spécifié par args[0]
          ex.printStackTrace();
          System.exit(-1);
        }

        // lire le fichier SwissProt
        SequenceIterator sequences = SeqIOTools.readSwissprot(br);

        // itérer parmi les séquences
        while(sequences.hasNext()){
          try {
            Sequence seq = sequences.nextSequence();
            // votre traitement de la séquence
          }
          catch (BioException ex) {
            // pas en format SwissProt
            ex.printStackTrace();
          }catch (NoSuchElementException ex) {
            // requête faite pour une séquence lorsqu'aucune n'existe
            ex.printStackTrace();
          }
        }
      }
    }

### Lire un fichier EMBL

    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;
    import java.io.*;
    import org.biojava.bio.*;
    import java.util.*;

    public class ReadEMBL {
      public static void main(String[] args) {
        BufferedReader br = null;

        try {
          // créer un BufferedReader pour lire le fichier spécifié par args[0]
          br = new BufferedReader(new FileReader(args[0]));
        }
        catch (FileNotFoundException ex) {
          // ne peut trouver le fichier specifie par args[0]
          ex.printStackTrace();
          System.exit(-1);
        }
        // lire le fichier en format EMBL
        SequenceIterator sequences = SeqIOTools.readEmbl(br);

        // itérer parmi les séquences
        while(sequences.hasNext()){
          try {
            Sequence seq = sequences.nextSequence();
            // travail à faire sur votre séquence
          }
          catch (BioException ex) {
            // pas en format EMBL
            ex.printStackTrace();
          }catch (NoSuchElementException ex) {
            // requête faite pour une séquence lorsqu'aucune n'existe
            ex.printStackTrace();
          }
        }
      }
    }

### GeneralReader, un lecteur générique (avec BioJava 1.3)

    import java.io.*;

    import org.biojava.bio.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;

    public class GeneralReader {

      /**
       * Ce programme peut lire n'importe quel format de fichier supporté par SeqIOTools. Il prend
       * trois arguments: le 1er est le nom du fichier, le 2ème est le type de format et le
       * 3ème est le type de résidus contenus dans la séquence. Les combinaisons illégales
       * comme une séquence d'ADN en format SwissProt lanceront une exception.
       *
       * Les formats supportés sont: (minuscule ou majuscule).
       *
       * FASTA
       * EMBL
       * GENBANK
       * SWISSPROT (ou swiss)
       * GENPEPT
       *
       * Les séquences des types suivants sont permises: (minuscule ou majuscule).
       *
       * DNA
       * AA (or Protein)
       * RNA
       *
       */
      public static void main(String[] args) {
        try {
          // préparer un BufferedReader pour entrée/sortie de fichier
          BufferedReader br = new BufferedReader(new FileReader(args[0]));

          // le format du fichier de séquence
          String format = args[1];

          // l'Alphabet
          String alpha = args[2];

          /*
           * obtenir un SequenceIterator sur toutes les séquences du fichier.
           * SeqIOTools.fileToBiojava() retourne un Object. Si le fichier lu est
           * en un format d"alignement comme MSF, un objet de type Alignment 
           * est retourné. Sinon un SequenceIterator est retourné.
           */
          SequenceIterator iter =
              (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);

          // un travail à faire sur votre séquence
          SeqIOTools.writeFasta(System.out, iter);
        }
        catch (FileNotFoundException ex) {
          // ne peut trouver le fichier spécifié par args[0]
          ex.printStackTrace();
        }catch (BioException ex) {
          // format de fichier non-valide
          ex.printStackTrace();
        }catch (IOException ex){
          // erreur à l'écriture du fichier FASTA
          ex.printStackTrace();
        }
      }
    }
