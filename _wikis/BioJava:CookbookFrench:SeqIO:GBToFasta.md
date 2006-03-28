---
title: BioJava:CookbookFrench:SeqIO:GBToFasta
---

Comment extraire les Sequences à partir de fichiers en format GenBank/ EMBL/ SwissProt etc., pour ensuite les écrire en format Fasta?
-------------------------------------------------------------------------------------------------------------------------------------

Pour accomplir cette tâche de conversion, nous allons modifier le
lecteur de base de la démo précédente pour y inclure la possibilité
d'écrire les données de séquence en format FASTA. L'exmple fourni
fonctionne à partir de la version 1.3 de BioJava.

<java> import java.io.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*;

public class GeneralReader {

` /**`  
`  * Ce programme lira n'importe quel fichier dans un format supporté par SeqIOTools.`  
`  * Il prend trois arguments: le 1er est le nom du fichier, le 2ème le format et le 3ème `  
`  * est le type de molecule qui est lu. Les combinaisons illégales (par ex. séquence d'ADN `  
`  * en SwissProt) lancera une exception.`  
`  *`  
`  * Formats permis: (minuscule ou majuscule).`  
`  *`  
`  * FASTA`  
`  * EMBL`  
`  * GENBANK`  
`  * SWISSPROT (or swiss)`  
`  * GENPEPT`  
`  *`  
`  * Types de séquence permises: (minuscule ou majuscule).`  
`  *`  
`  * DNA`  
`  * AA (or Protein)`  
`  * RNA`  
`  *`  
`  */`  
`  public static void main(String[] args) {`  
`      try {`  
`          //prépare un BufferedReader pour lecture du fichier`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`          //le format du fichier`  
`     String format = args[1];`

`          //l'Alphabet`  
`     String alpha = args[2];`

`     /*`  
`      * créer un SequenceIterator pour parcourir toutes les séquences du fichier.`  
`      * SeqIOTools.fileToBiojava() retourne un Object. Si le fichier lu est un`  
`      * alignment, tel que MSF, un objet Alignment est retourné, sinon un`  
`      * SequenceIterator est retourné.`  
`      */`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);`

`     // faire quelque chose avec les séquences`  
`     SeqIOTools.writeFasta(System.out, iter);`  
`      }`  
`      catch (FileNotFoundException ex) {`  
`          //ne trouve pas le fichier spécifié en args[0]`  
`          ex.printStackTrace();`  
`      }catch (BioException ex) {`  
`          //nom de format de fichier invalide`  
`          ex.printStackTrace();`  
`      }catch (IOException ex){`  
`          //erreur d'écriture du format fasta`  
`          ex.printStackTrace();`  
`      }`  
`  }`

} </java>
