---
title: BioJava:CookBook:PDB:mmcif
---

### How do I read a .mmcif file?

[mmcif](http://ndbserver.rutgers.edu/mmcif/index.html) is an alternative
file format to PDB files (
[1](#westbrook2000 "wikilink"),[2](#westbrook2003 "wikilink") ). The
mmcif files are parsed into the same BioJava data structure as the [PDB
files](BioJava:CookBook:PDB:read "wikilink"). The example below
demonstrates how to load the content into the BioJava data model for
protein structures.

The mmcif parsing code will be released with the next biojava release in
April 2009. To use it at the moment you will require a [recent build
from SVN](Autobuild_events "wikilink").

To parse an mmCif file do the following: <java> @since 1.7

`   public static void main(String[] args){`  
`       String file = "/path/to/myfile.cif.gz";`  
`       StructureIOFile pdbreader = new MMCIFFileReader();`  
`       try {`  
`           Structure s = pdbreader.getStructure(file);`  
`           System.out.println(s);`  
`           System.out.println(s.toPDB());`  
`       } catch (IOException e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`

</java>

Parse into custom data structures
---------------------------------

By default the file content will be loaded into the BioJava data
structures. The parser is contains a built-in event model, which allows
to load your own, custom data structures. For this you will require to
implement the [MMcifConsumer
interface](http://www.spice-3d.org/public-files/javadoc/biojava/org/biojava/bio/structure/io/mmcif/MMcifConsumer.html)
If you don;t have that, just use the SimpleMMcifConsumer

<java> @since 1.7

`   public static void main(String[] args){`

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
