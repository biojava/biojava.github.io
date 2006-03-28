---
title: BioJava:Cookbook:Locations:Circular
---

How do CircularLocations work?
------------------------------

A number of interesting DNA molecules, such as plasmids and bacterial
chromosomes are circular. Locations on a circular molecule are specified
relative to some arbitrary origin.

In BioJava circular SymbolLists don't really exist. The underlying
Symbols are ultimately stored as an array of pointers to Symbols. The
circular effect can be faked using a CircularView object (which
implements SymbolListView).

In a standard SymbolList it is not possible to access a Symbol using a
Location that lies outside the SymbolList. Trying to get the Symbol at 0
or length+1 will throw an IndexOutOfBounds exception. In the case of a
CircularView it is perfectly sensible to ask for the Symbol at 0 or -5
and expect to get a Symbol. Because BioJava uses the biological
numbering system a Sequence is number from 0 to length.

No limits are placed on indexing a CircularView and a special convention
is used for numbering. The Symbol indexed by 1 is the first Symbol in
the underlying SymbolList. The Symbol indexed by 0 is the base
immediately before the Symbol 1, which in this case is also the last
base in the underlying SymbolList.

CircularLocations are dealt with using the CircularLocation class.
CircularLocations are best constructed using the LocationTools class.
This is demonstrated in the example below.

**NOTE: due to bugs in earlier versions of BioJava this recipe will give
strange results unless you are working off a fairly recent version of
BioJava. To get the most up to date version follow the "[How do I get
and install BioJava](BioJava:GetStarted "wikilink")" link on the main
page and read the section on cvs. biojava-live BioJava version 1.3 (when
released) will be adequate.**

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class SpecifyCircular {

` public static void main(String[] args) {`  
`   try {`  
`     Location[] locs = new Location[3];`  
`     //make a CircularLocation specifying the residues 3-8 on a 20mer`  
`     locs[0] = LocationTools.makeCircularLocation(3,8,20);`  
`     //make a CircularLocation specifying the residues 0-4 on a 20mer`  
`     locs[1] = LocationTools.makeCircularLocation(0,4,20);`  
`     //make a CircularLocation specifying the residues 18-24 on a 20mer`  
`     locs[2] = LocationTools.makeCircularLocation(18,24,20);`

`     for (int i = 0; i < locs.length; i++){`  
`       //print the location`  
`       System.out.println("Location: "+locs[i].toString());`

`       //make a SymbolList`  
`       SymbolList sl = DNATools.createDNA("gcagctaggcggaaggagct");`  
`       System.out.println("SymbolList: "+sl.seqString());`

`       //get the SymbolList specified by the Location`  
`       SymbolList sym = locs[i].symbols(sl);`  
`       System.out.println("Symbol specified by Location: "+sym.seqString());`  
`     }`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     //illegal symbol used to make sl`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
