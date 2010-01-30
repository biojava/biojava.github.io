---
title: BioJava:Cookbook:Proteomics:AAindex
---

**Note**: The classes mentioned in this article are not integrated in
the BioJava 1.4 library, yet. However, they are avaiable via
[CVS](http://cvs.biojava.org/cgi-bin/viewcvs/viewcvs.cgi/biojava-live/src/org/biojava/bio/proteomics/aaindex/?cvsroot=biojava).

How do I analyze the symbol properties of an amino acid sequence using the Amino Acid Index database?
-----------------------------------------------------------------------------------------------------

To analyze the symbol properties of an amino acid sequence, e.g. the
average hydrophobicity of the protein, one can use the interface
`[http://www.biojava.org/docs/api14/org/biojava/bio/symbol/SymbolPropertyTable.html SymbolPropertyTable]`.
Its
`[http://www.biojava.org/docs/api14/org/biojava/bio/symbol/SymbolPropertyTable.html#getDoubleValue(org.biojava.bio.symbol.Symbol) getDoubleValue]`
method returns a numeric value for a given amino acid symbol, e.g. a
negative or positive value that indicates the hydrophobicity of the
amino acid relative to the other amino acids. The [Amino Acid
Index](http://www.genome.ad.jp/dbget/aaindex.html) database contains
over 500 different amino acid property tables in a simple text file
called
*[aaindex1](ftp://ftp.genome.ad.jp/pub/db/genomenet/aaindex/aaindex1)*.
[AAindex1](http://www.genome.jp/dbget-bin/show_man?aaindex) is also the
format name.

This file can be loaded through the `AAindexStreamReader` class.
Afterwards, the property tables can be enumerated by calling the
`nextTable` method, which returns for each property table an `AAindex`
object that implements the `SymbolPropertyTable` interface. If the file
must be hold in memory and random access to the property tables (via the
table name) is needed, one can use a `SimpleSymbolPropertyTableDB`
object and initialize it with a `AAindexStreamReader` object.

The following example shows how to calculate the average hydrophobicity
for a given amino acid sequence (in this example the sequence only
contains the twenty amino acids) on the basis of the *CIDH920105* table
from the AAindex1 file *aaindex1*:

<java>SimpleSymbolPropertyTableDB db = new
SimpleSymbolPropertyTableDB(new AAindexStreamReader(new
FileReader("aaindex1"))); AAindex hydrophobicity = (AAindex)
db.table("CIDH920105"); SymbolList symbols =
ProteinTools.createProtein("ARNDCEQGHILKMFPSTWYV"); double hp = 0.0; for
(int i = 1; i \<= symbols.length(); i++) {

`   hp += hydrophobicity.getDoubleValue(symbols.symbolAt(i));`

} System.out.println("Average hydrophobicity: " + (hp /
symbols.length()));</java>
