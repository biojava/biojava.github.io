---
title: BioJava:CookbookFrench:Blast:Echo
---

Comment extraire les informations d'un très gros fichier ou comment écrire son propre SearchContentHandler?
-----------------------------------------------------------------------------------------------------------

Si vous voulez parcourir un rapport BLAST (ou FASTA), vous pouvez
utiliser la procédure standard, mais vous voulez peut-être savoir
comment les objets utilisés pour cette recherche ont été crée. Vous
voulez peut-être aussi construire votre propre *SearchContentHandler*.
Ceci est peut devenir intéressant si vous faites l'extraction à partir
d'énormes fichiers BLAST parce que tous ces objets finiront par utiliser
d'énormes portions de mémoire vive. Une situation particulièrement
frustrante si vous êtes interessé par une petite portion de
l'information du fichier!

Le programme ci-dessous montre des fonctionnalités très utiles lorsqu'on
veut créer des manipulations sur mesure; il montre aussi la manière de
le créer. Essentiellement, le programme contient un *handler* sur mesure
qui est à l'écoute de tous les évènements de lecture et les renvois sur
STDOUT. Ceci vous permet d'observer quels evènements sont créés et
lesquels contiennent les informations que vous recherchez. Vous pouvez
alors créer un *SearchContentHandler* qui fera le travail en étendant
*SearchContentAdapter* et en redéfinissant les méthodes qui prendront en
charge les évènements qui vous intéressent.

<java> import org.xml.sax.\*;

import java.io.\*;

import org.biojava.bio.program.sax.\*; import
org.biojava.bio.program.ssbind.\*; import org.biojava.bio.search.\*;

/\*\*

`*  Retransmets sur STDOUT les évènements`  
`*  d'un parser SAX Blast-like  `  
`*/ public class BlastEcho { `  
` public BlastEcho() { `  
` } `

` private void echo (InputSource source) throws IOException, SAXException{ `  
`   // créer un BlastLikeSAXParser `  
`   BlastLikeSAXParser parser = new BlastLikeSAXParser(); `  
`   `  
`   // Appeller cette méthode pour que le parser ne se préoccupe`  
`   // pas de vérifier la version de Blast utilisée par ce rapport`  
`   // avant de le parcourir`  
`   parser.setModeLazy(); `

`   ContentHandler handler = new SeqSimilarityAdapter();`  
`   `  
`   // utiliser vos propres SearchContentHandler (voir ci-dessous)`  
`   SearchContentHandler scHandler = new EchoSCHandler(); `  
`   ((SeqSimilarityAdapter)handler).setSearchContentHandler(scHandler); `

`   parser.setContentHandler(handler); `  
`   parser.parse(source); `  
` } `

` /**`  
`  * Création d'un SearchContentHandler personnalisé. `  
`  * Intercepte tous les évènements et les transmets à STDOUT`  
`  */`  
` private class EchoSCHandler extends SearchContentAdapter{ `  
`   public void startHit(){ `  
`     System.out.println("startHit()"); `  
`   } `  
`   public void endHit(){ `  
`     System.out.println("endHit()"); `  
`   } `  
`   public void startSubHit(){ `  
`     System.out.println("startSubHit()"); `  
`   } `  
`   public void endSubHit(){ `  
`     System.out.println("endSubHit()"); `  
`   } `  
`   public void startSearch(){ `  
`     System.out.println("startSearch"); `  
`   } `  
`   public void endSearch(){ `  
`     System.out.println("endSearch"); `  
`   } `  
`   public void addHitProperty(Object key, Object val){ `  
`     System.out.println("\tHitProp:\t"+key+": "+val); `  
`   } `  
`   public void addSearchProperty(Object key, Object val){ `  
`     System.out.println("\tSearchProp:\t"+key+": "+val); `  
`   } `  
`   public void addSubHitProperty(Object key, Object val){ `  
`     System.out.println("\tSubHitProp:\t"+key+": "+val); `  
`   } `  
` } `

` public static void main(String[] args) throws Exception{ `  
`   InputSource is = new InputSource(new FileInputStream(args[0])); `  
`   BlastEcho blastEcho = new BlastEcho(); `  
`   blastEcho.echo(is); `  
` } `

} </java>
