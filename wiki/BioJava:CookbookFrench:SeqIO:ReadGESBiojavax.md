---
title: BioJava:CookbookFrench:SeqIO:ReadGESBiojavax
---

Comment faire pour lire une fichier de séquence, quel que soit son format avec Biojavax?
----------------------------------------------------------------------------------------

Depuis le début de son développement, Biojava permet la lecture de
fichiers de séquence écrit dans divers formats. Depuis Biojava 1.5 et
l'ajout de l'extension Biojavax, la façon de faire pour lire les
fichiers a quelque peu changer. Vous pouvez toujours utiliser la classe
**SeqIOTools** mais elle est maintenant marquée comme obsolète et a été
remplacé par la classe **RichSequenceIO.Tools**. Cette nouvelle classe
crée des objets de la classe**RichSequence** qui préservent mieux le
contenu en information des différents formats afin de s'hormoniser avec
les bases de données se conformant à BioSQL; cette classe inaugure
également l'utilisation des *namespaces*. L'extension Biojavax permet
aussi la création de nouvelles classes permettant la lecture de nouveaux
formats.

Cependant pour la plupart des utilisateurs, ça reste académique! La
procédure suivante montre les similitudes et les différences avec les
techniques précédentes. **RichSequenceIO.Tools** vous permet de lire les
fichiers (qu'ils soient d'ADN, d'ARN ou de protéines) écrits dans l'un
des formats suivant:

-   EMBL (natif ou XML)
-   FASTA
-   GenBank
-   INSDseq
-   UniProt (natif ou XML)

**RichSequenceIO.Tools** a aussi une méthode, *readFile*, qui tentera de
lire le fichier en devinant son format.

<java> import java.io.BufferedReader; import java.io.FileReader;

import org.biojavax.SimpleNamespace; import
org.biojavax.bio.seq.RichSequence; import
org.biojavax.bio.seq.RichSequenceIterator;

public class ReadGES\_BJ1\_6{

`   /* `  
`    * ReadGES_BJ1_6.java - Une petite demo de lecture d'un fichier de sequence`  
`    * de format connu avec l'extension Biojavax (necessite BJ1.5 ou plus récent) `  
`    * `  
`    * args[0] correspond à un fichier de sequence`  
`    */`  
`   public static void main(String[] args) {`  
`       BufferedReader br = null;`  
`       SimpleNamespace ns = null;`  
`       `  
`       try{`  
`           br = new BufferedReader(new FileReader(args[0]));`  
`           ns = new SimpleNamespace("biojava");`  
`           `  
`           // L'API (BJ1.5 et plus) décrit les différents formats lus`  
`           RichSequenceIterator rsi = RichSequence.IOTools.readFastaDNA(br,ns);`  
`   `  
`           // Comme un fichier peut contenir plus d'une sequence, il est necessaire `  
`                       // d'utiliser un iterateur et de le parcourir pour obtenir les sequences.`  
`           while(rsi.hasNext()){`  
`               RichSequence rs = rsi.nextRichSequence();`  
`               System.out.println(rs.getName());`  
`           }`  
`       }`  
`       catch(Exception be){`  
`           be.printStackTrace();`  
`           System.exit(-1);`  
`       }`  
`   }`

} </java>
