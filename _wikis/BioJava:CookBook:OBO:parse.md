---
title: BioJava:CookBook:OBO:parse
---

How to parse an Ontology (OBO) file
===================================

BioJava now contains a parser for .OBO files. The BioJava parser is
re-using parts of the parser contained in the OBO-Edit software
package,but does not require to have the obo-edit library and user
interface installed in order to parse the files. Thanks to the OBO-Edit
developers for giving permission to re-use part of their source code.

This code will be released with the next biojava release. To use it at
the moment you will require a recent build from SVN.

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
