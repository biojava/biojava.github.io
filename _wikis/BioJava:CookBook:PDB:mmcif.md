---
title: BioJava:CookBook:PDB:mmcif
---

### How do I read a .mmcif file?

[mmcif](http://ndbserver.rutgers.edu/mmcif/index.html) is an alternative
file format to PDB files (
[1](#westbrook2000 "wikilink"),[2](#westbrook2003 "wikilink") ). It is
not entirely easy to write a parser for it, as such BioJava solves this
problem for you. The mmcif files are parsed into the same BioJava data
structure as the [PDB files](BioJava:CookBook:PDB:read "wikilink").

This code will be released with the next biojava release. To use it at
the moment you will require a [recent build from
SVN](Autobuild_events "wikilink").

<java> @since 1.7 public static void main(String[] args){

`       String fileName = args[0];`  
`       `  
`       InputStream inStream =  new FileInputStream(fileName);`  
`       `  
`       MMcifParser parser = new SimpleMMcifParser();`

`       SimpleMMcifConsumer consumer = new SimpleMMcifConsumer();`

`       // The Consumer builds up the BioJava - structure object.`  
`               // you could also hook in your own and build up you own data model.          `  
`       parser.addMMcifConsumer(consumer);`

`       try {`  
`           parser.parse(new BufferedReader(new InputStreamReader(inStream)));`  
`       } catch (IOException e){`  
`           e.printStackTrace();`  
`       }`

`               // now get the protein structure.`  
`       Structure cifStructure = consumer.getStructure();`  
`                     `

}

</java>

For more info on how to work with the BioJava structure data model see
<BioJava:CookBook:PDB:atoms>.

References
----------

<biblio>

1.  westbrook2000 pmid=10842738
2.  westbrook2003 pmid=12647386

</biblio>
