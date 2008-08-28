---
title: BioJava:CookbookFrench:Ontology:OBO
---

Comment extraire l'information d'un fichier d'ontologie en format OBO?
======================================================================

Dans le version de développement, BioJava contient maintenant un parser
pour les [fichiers
.OBO](http://www.geneontology.org/GO.format.obo-1_2.shtml). Ce parser
ré-utilise des portions du parser contenu dans le [logiciel
OBO-Edit](http://wiki.geneontology.org/index.php/OBO-Edit), mais la
librairie obo-edit et son interface graphique ne sont pas nécessaires
pour extraire les infos d'un fichier .OBO. Un gros merci aux
développeurs de OBO\_Edit pour la permission de ré-utiliser en partie
leur code source!

Le code du parser sera dans la prochaine version de BioJava. Pour
l'utiliser dans son état présent, il vous faudra utiliser la version du
[serveur SVN](Autobuild_events "wikilink").

<java> @since 1.7 public static void main (String[] args) {

`       String fileName = args[0];`

`   OboParser parser = new OboParser();`  
`   InputStream inStream =  new FileInputStream(fileName);`  
`       `  
`   BufferedReader oboFile = new BufferedReader ( new InputStreamReader ( inStream ) );`  
`       try {`  
`           Ontology ontology = parser.parseOBO(oboFile, "my Ontology name", "description of ontology");`  
`                       `  
`           Set keys = ontology.getTerms();`  
`           Iterator iter = keys.iterator();`  
`           while (iter.hasNext()){`  
`               Term term = (Term) iter.next();`  
`               System.out.println("TERM: " + term.getName() + " " + term.getDescription());`  
`               System.out.println(term.getAnnotation());`  
`               Object[] synonyms =  term.getSynonyms();`  
`               for ( Object syn : synonyms ) {`  
`                   System.out.println(syn);`  
`               }                   `  
`           }           `  
`       } catch (Exception e){`  
`           e.printStackTrace();`  
`       }`

} </java>
