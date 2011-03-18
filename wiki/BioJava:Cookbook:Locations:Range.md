---
title: BioJava:Cookbook:Locations:Range
---

How do I specify a RangeLocation?
---------------------------------

In BioJava a RangeLocation is an object that holds the minimum and
maximum bounds of a region on a SymbolList or Sequence. The minimum and
maximum are inclusive.

The following example demonstrates the use of a RangeLocation.

Note that, as of BioJava 1.8, you may want to consider using
[RichLocation](http://www.biojava.org/docs/api1.8/org/biojavax/bio/seq/RichLocation.html)
from the [BioJavax](BioJava:BioJavaXDocs "wikilink") extension.

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class SpecifyRange {

` public static void main(String[] args) {`  
`   try {`  
`     //make a RangeLocation specifying the residues 3-8`  
`     Location loc = LocationTools.makeLocation(3,8);`  
`     //print the location`  
`     System.out.println("Location: "+loc.toString());`

`     //make a SymbolList`  
`     SymbolList sl = RNATools.createRNA("gcagcuaggcggaaggagc");`  
`     System.out.println("SymbolList: "+sl.seqString());`

`     //get the SymbolList specified by the Location`  
`     SymbolList sym = loc.symbols(sl);`  
`     System.out.println("Symbols specified by Location: "+sym.seqString());`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     //illegal symbol used to make sl`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
