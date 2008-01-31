---
title: Dazzle:examplePlugin
---

How to write a plugin for Dazzle
================================

The source code
---------------

The full source code for this example is available from [the dazzle svn
repository](http://www.derkholm.net/svn/repos/dazzle/trunk/src/org/biojava/servlets/dazzle/datasource/UniProtDataSource.java)

How to set up a Reference and Annotation server
-----------------------------------------------

This example demonstrates how to set up a reference & annotation server
for Dazzle using the BioJava sequence model. There is also a second way
to provide features, which is using a simple GFF style bean object.
(Documentation to follow).

Step 1: declare what we want to implement. As you can see below, we want
to implement a ReferenceSource and we use the convenience class
AbstractDataSource, so we safe some time for the implmementation.

<java> public class UniProtDataSource extends AbstractDataSource
implements DazzleReferenceSource { </java>

These objects will collect the data: <java>

`   private Map seqs; // contains all the BioJava Sequence objects.`  
`   private Set allTypes; // all annotation types.`  
`   String fileName; // the filename to parse`

</java>

When the DAs source is requested, Dazzle will initiate this plugin. For
this the init method is called:

<java>

`   public void init(ServletContext ctx) `  
`   throws DataSourceException`  
`   {`  
`       super.init(ctx);`  
`       try {`  
`                    `

</java>

Now we init the variables and use BioJava to parse the uniprot file:

<java>

`           seqs = new HashMap();`  
`           allTypes = new HashSet();`  
`           BufferedReader br = new BufferedReader(new InputStreamReader(ctx.getResourceAsStream(fileName)));`

// read the SwissProt File

`           SequenceIterator sequences = SeqIOTools.readSwissprot(br);`

`           //iterate through the sequences`  
`           while(sequences.hasNext()){`

`               Sequence seq = sequences.nextSequence();`  
`           `  
`               seqs.put(seq.getName(), seq);`  
`           }`

</java>

If something goes wrong, we throw a DataSourceException

<java>

`       } catch (Exception ex) {`  
`           throw new DataSourceException(ex, "Couldn't load sequence file");`  
`       }`  
`   }`

`   /** try to parse a score out of the feature notes`  
`    * `  
`    */`  
`   public String getScore(Feature f) {`  
`       String score = "-";`

`       Annotation a = f.getAnnotation();`  
`       try {`  
`           `  
`           String note = (String) a.getProperty("swissprot.featureattribute");`  
`           `  
`           int scorePos =note.indexOf("Score: "); `  
`           if (  scorePos > 0 ) {`

`               String sc = note.substring(scorePos+7,note.length());`  
`               //System.out.println("parsed " + sc);`  
`               try {`  
`                   double scp  = Double.parseDouble(sc);`  
`                   score = "" + scp;`  
`               } catch (Exception e){`  
`                   e.printStackTrace();`  
`               }`  
`               try {`  
`                   int scp = Integer.parseInt(sc);`  
`                   score = "" + scp;`  
`               } catch (Exception e){ `  
`                   e.printStackTrace();`  
`               }`  
`               `  
`           }`  
`           `  
`           //score = ""+ (Double)a.getProperty(SCORE);`  
`           System.out.println("found score " + score);`  
`       } catch (NoSuchElementException e){`  
`           // igonre in this case...`  
`       }`  
`       return score;`

`   }`

</java>

Now some simple methods to provide some data to be returned to the user.

<java>

`   public String getDataSourceType() {`

`       return "UniProtFile";`  
`   }`

`   public String getDataSourceVersion() {`

`       return "1.00";`  
`   }`

</java>

This method is called, since in dazzecfg.xml we configured the filename
attribute.

<java>

`   public void setFileName(String s) {`  
`       fileName = s;`  
`   }`

</java>

And this method is called when the DAS - SEQUENCE command is being
called:

<java>

`   public Sequence getSequence(String ref) throws DataSourceException, NoSuchElementException {`  
`       Sequence seq = (Sequence) seqs.get(ref);`  
`       if (seq == null) {`  
`           throw new NoSuchElementException("No sequence " + ref);`  
`       }`  
`       return seq;`  
`   }`

`   public Set getAllTypes() {`  
`       return Collections.unmodifiableSet(allTypes);`  
`   }`

</java>

and here now the method that is used for the ENTRYPOINTS command

<java>

`   public Set getEntryPoints() {`  
`       return seqs.keySet();`  
`   }`

`   public String getMapMaster() {`  
`       // TODO Auto-generated method stub`  
`       return null;`  
`   }`

`   public String getLandmarkVersion(String ref) throws DataSourceException, NoSuchElementException {`  
`       // TODO Auto-generated method stub`  
`       return null;`  
`   }`

} </java>
