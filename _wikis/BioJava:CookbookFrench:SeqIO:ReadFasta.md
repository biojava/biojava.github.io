---
title: BioJava:CookbookFrench:SeqIO:ReadFasta
---

Comment lire les Sequences contenues dans un fichier en format Fasta?
---------------------------------------------------------------------

Une des tâches d'entrée/sortie les plus fréquentes est la lecture d'un
simple fichier contenant la/les sequence(s) pour les mettre en mémoire.
*SeqIOTools* vous procure des méthodes statiques de base pour lire les
fichiers et extraire les infos pour BioJava. Il existe en fait plus
d'une manière de le faire. La plus spécifique est démontré en premier,
la plus générale en second.

### Méthode spécifique

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.db.\*; import
org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class ReadFasta {

/\*\*

`* Ce programme prends 2 args: le 1er,le nom du fichier Fasta, le 2ème est le nom `  
`* de l'Alphabet. Les noms permis sont DNA, RNA ou PROTEIN.`  
`*/`  
`public static void main(String[] args) {`  
`   try {`  
`   // configurer la lecture du fichier`  
`   String filename = args[0];`  
`   BufferedInputStream is =`  
`       new BufferedInputStream(new FileInputStream(filename));`

`   // obtenir l'Alphabet approprié`  
`   Alphabet alpha = AlphabetManager.alphabetForName(args[1]);`

`   // obtenir une SequenceDB pour contenir toutes les séquences du fichier`  
`   SequenceDB db = SeqIOTools.readFasta(is, alpha);`  
`   }`  
`   catch (BioException ex) {`  
`   // pas un format Fasta ou mauvais Alphabet`  
`   ex.printStackTrace();`  
`   }catch (NoSuchElementException ex) {`  
`   // aucune séquence Fasta dans le fichier`  
`   ex.printStackTrace();`  
`   }catch (FileNotFoundException ex) {`  
`   // probleme à lire le fichier`  
`   ex.printStackTrace();`  
`   }`  
`}`

} </java>

### Méthode générale

    import java.io.*;
    import java.util.*;

    import org.biojava.bio.*;
    import org.biojava.bio.seq.db.*;
    import org.biojava.bio.seq.io.*;
    import org.biojava.bio.symbol.*;

    public class ReadFasta {

      /**
        * Ce programme prends 2 args: le 1er,le nom du fichier Fasta, le 2ème est le nom 
        * de l"Alphabet. Les noms permis sont DNA, RNA ou PROTEIN.
        */
      public static void main(String[] args) {
        try {
          // configurer la lecture du fichier
          String filename = args[0];
          BufferedInputStream is =
                 new BufferedInputStream(new FileInputStream(filename));
          // obtenir l'Alphabet approprié
          Alphabet alpha = AlphabetManager.alphabetForName(args[1]);

          // obtenir une SequenceDB pour contenir toutes les séquences du fichier
          SequenceDB db = SeqIOTools.readFasta(is, alpha);
        }
        catch (BioException ex) {
          // pas un format Fasta ou mauvais Alphabet
          ex.printStackTrace();
        }catch (NoSuchElementException ex) {
          // aucune séquence Fasta dans le fichier
          ex.printStackTrace();
        }catch (FileNotFoundException ex) {
          //probleme à lire le fichier
          ex.printStackTrace();
        }
      }
    }
