---
title: BioJava:CookBook:Blast:Parser
---

How Do I Parse A BLAST Result?
------------------------------

Much of the credit for this example belongs to Keith James.

A frequent task in bioinformatics is the generation of BLAST search
results. BioJava has the ability to parse "Blast-like" output such as
Blast and HMMER using a trick that makes the BLAST output into SAX
events that can be listened for by registered listeners.

The basic pipeline is as follows:

`Blast_output -> Generate SAX events  --> Convert SAX events --> Build result objects --> Store `  
`them in a list.`

`InputStream--> BLASTLikeSAXParser --> SeqSimilartyAdapter --> BlastLikeSearchBuilder --> List`

The API is very flexible however for most purposes the following simple
recipe will get you what you want.

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.program.sax.\*; import
org.biojava.bio.program.ssbind.\*; import org.biojava.bio.search.\*;
import org.biojava.bio.seq.db.\*; import org.xml.sax.\*; import
org.biojava.bio.\*;

public class BlastParser {

` /**`  
`  * args[0] is assumed to be the name of a Blast output file`  
`  */`  
` public static void main(String[] args) {`  
`   try {`  
`     //get the Blast input as a Stream`  
`     InputStream is = new FileInputStream(args[0]);`

`     //make a BlastLikeSAXParser`  
`     BlastLikeSAXParser parser = new BlastLikeSAXParser();`

`     //make the SAX event adapter that will pass events to a Handler.`  
`     SeqSimilarityAdapter adapter = new SeqSimilarityAdapter();`

`     //set the parsers SAX event adapter`  
`     parser.setContentHandler(adapter);`

`     //The list to hold the SeqSimilaritySearchResults`  
`     List results = new ArrayList();`

`     //create the SearchContentHandler that will build SeqSimilaritySearchResults`  
`     //in the results List`  
`     SearchContentHandler builder = new BlastLikeSearchBuilder(results,`  
`         new DummySequenceDB("queries"), new DummySequenceDBInstallation());`

`     //register builder with adapter`  
`     adapter.setSearchContentHandler(builder);`

`     //parse the file, after this the result List will be populated with`  
`     //SeqSimilaritySearchResults`  
`     parser.parse(new InputSource(is));`

`     //output some blast details`  
`     for (Iterator i = results.iterator(); i.hasNext(); ) {`  
`       SeqSimilaritySearchResult result =`  
`           (SeqSimilaritySearchResult)i.next();`

`       Annotation anno = result.getAnnotation();`

`       for (Iterator j = anno.keys().iterator(); j.hasNext(); ) {`  
`         Object key = j.next();`  
`         Object property = anno.getProperty(key);`  
`         System.out.println(key+" : "+property);`  
`       }`  
`       System.out.println("Hits: ");`

`       //list the hits`  
`       for (Iterator k = result.getHits().iterator(); k.hasNext(); ) {`  
`         SeqSimilaritySearchHit hit =`  
`             (SeqSimilaritySearchHit)k.next();`  
`         System.out.print("\tmatch: "+hit.getSubjectID());`  
`         System.out.println("\te score: "+hit.getEValue());`  
`       }`

`       System.out.println("\n");`  
`     }`

`   }`  
`   catch (SAXException ex) {`  
`     //XML problem`  
`     ex.printStackTrace();`  
`   }catch (IOException ex) {`  
`     //IO problem, possibly file not found`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
