---
title: BioJava:CookBook1.7
---

BioJava In Anger - A Tutorial and Recipe Book for Those in a Hurry
------------------------------------------------------------------

BioJava can be both big and intimidating. For those of us who are in a
hurry there really is a whole lot there to get your head around. This
document is designed to help you develop BioJava programs that do 99% of
common tasks without needing to read and understand 99% of the BioJava
API.

The page was inspired by various programming cookbooks and follows a
"How do I...?" type approach. Each "How do I?" is linked to some example
code that does what you want and sometimes more. Basically if you find
the code you want and copy and paste it into your program you should be
up and running quickly. I have endeavoured to over document the code to
make it more obvious what I am doing so some of the code might look a
bit bloated.

'BioJava in Anger' is maintained by [Mark
Schreiber](User:Mark "wikilink"). If you have any suggestions, questions
or comments contact the [biojava mailing
list](mailto:biojava-l@biojava.org). To subscribe to this list go
[here](http://biojava.org/mailman/listinfo/biojava-l)

These demos are tested with BioJava 1.3 and Java 1.4

Announcing
----------

You can now read BioJava in Anger in
[French](Biojava:CookbookFrench "wikilink") (Translated by Sylvain
Foisy).

You can also read BioJava in Anger in
[Japanese](http://www.geocities.jp/bio_portal/bj_in_anger_ja/)
(Translated by Takeshi Sasayama and Kentaro Sugino, updated 14 Aug
2004).

How about simplified
[Chinese](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)?
(Translated by Wu Xin).

Presentations
-------------

This is a powerpoint presentation on the BioJava core API that I have
given a few times.

Publications
------------

Click here to search [Google
Scholar](http://scholar.google.com/scholar?q=biojava) for papers using
BioJava.

How Do I....?
-------------

### Setup

-   [Where do I get a Java
    installation](http://java.sun.com/downloads/)?
-   [How do I get and install BioJava](BioJava:GetStarted "wikilink")?

### Alphabets and Symbols

-   [How do I get a DNA, RNA or Protein
    Alphabet](Biojava:Cookbook:Alphabets "wikilink")?
-   [How do I make a custom Alphabet from custom
    Symbols](Biojava:Cookbook:Alphabets:Custom "wikilink")?
-   [How do I make a CrossProductAlphabet such as a codon
    Alphabet](Biojava:Cookbook:Alphabets:CrossProduct "wikilink")?
-   [How do I break Symbols from CrossProduct Alphabets into their
    component Symbols](Biojava:Cookbook:Alphabets:Component "wikilink")?
-   [How can I tell if two Alphabets or Symbols are
    equal](Biojava:Cookbook:Alphabets:Cononical "wikilink")?
-   [How can I make an ambiguous Symbol like Y or
    R](Biojava:Cookbook:Alphabets:Ambiguous "wikilink")?

### Basic Sequence Manipulation

-   [How do I make a Sequence from a String or make a Sequence Object
    back into a String](Biojava:Cookbook:Sequence "wikilink")?
-   [How do I get a subsection of a
    Sequence](Biojava:Cookbook:Sequence:SubSequence "wikilink")?
-   [How do I transcribe a DNA Sequence to a RNA
    Sequence](Biojava:Cookbook:Sequence:Transcribe "wikilink")?
-   [How do I reverse complement a DNA or RNA
    Sequence](Biojava:Cookbook:Sequence:Reverse "wikilink")?
-   [Sequences are immutable so how can I change it's
    name](Biojava:Cookbook:Sequence:ChangeName "wikilink")?
-   [How can I edit a Sequence or
    SymbolList](Biojava:Cookbook:Sequence:Edit "wikilink")?
-   [How can I make a sequence motif into a regular
    expression](Biojava:Cookbook:Sequence:Regex "wikilink")?

### Translation

-   [How do I translate a DNA or RNA Sequence or SymbolList to
    Protein](Biojava:Cookbook:Translation "wikilink")?
-   [How do I translate a single codon to a single amino
    acid](Biojava:Cookbook:Translation:Single "wikilink")?
-   [How do I use a non standard translation
    table](Biojava:Cookbook:Translation:NonStandart "wikilink")?
-   [How do I translate a nucleotide sequence in all six
    frames](Biojava:Cookbook:Translation:SixFrames "wikilink")?

### Proteomics

-   [How do I calculate the mass and pI of a
    peptide](Biojava:Cookbook:Proteomics "wikilink")?
-   [How do I analyze the symbol properties of an amino acid sequence
    using the Amino Acid Index
    database](Biojava:Cookbook:Proteomics:AAindex "wikilink")?

### Sequence I/O

-   [How do I write Sequences in Fasta
    format](Biojava:Cookbook:SeqIO:WriteInFasta "wikilink")?
-   [How do I read in a Fasta
    file](Biojava:Cookbook:SeqIO:ReadFasta "wikilink")?
-   [How do I read a GenBank/EMBL/SwissProt
    file](Biojava:Cookbook:SeqIO:ReadGES "wikilink")?
-   [How do I extract GenBank/EMBL/Swissprot sequences and write them as
    Fasta](Biojava:Cookbook:SeqIO:GBtoFasta "wikilink")?
-   [How do I turn an ABI sequence trace into a BioJava
    Sequence](Biojava:Cookbook:SeqIO:ABItoSequence "wikilink")?
-   [How does sequence I/O work in
    BioJava](Biojava:Cookbook:SeqIO:Echo "wikilink")?

### Annotations

-   [How do I list the Annotations in a
    Sequence](BioJava:Cookbook:Annotations:List "wikilink")?
-   [How do I filter a Sequences based on their species (or another
    Annotation
    property)](BioJava:Cookbook:Annotations:Filter "wikilink")?

### Locations and Features

-   How do I specify a PointLocation?
-   How do I specify a RangeLocation?
-   How do CircularLocations work?
-   How can I make a Feature?
-   How can I filter Features by type?
-   How can I remove features?

### BLAST and FASTA

-   How do I set up a BLAST parser?
-   How do I set up a FASTA parser?
-   How do I extract information from parsed results?
-   How do I parse a large file; Or, How do I make a custom
    SearchContentHandler?
-   Expert information on the BioJava SAX2 event based parsing framework
    by Cambridge Antibody Technology. Contains a UML diagram. Warning,
    this information may be a little dated now.

### Counts and Distributions

-   How do I count the residues in a Sequence?
-   How do I calculate the frequency of a Symbol in a Sequence?
-   How can I turn a Count into a Distribution?
-   How can I generate a random sequence from a Distribution?
-   How can I find the amount of information or entropy in a
    Distribution?
-   What is an easy way to tell if two Distributions have equal weights?
-   How can I make an OrderNDistribution over a custom Alphabet?
-   How can I write a Distribution as XML?
-   Using Distributions to make a Gibbs sampler

### Weight Matrices and Dynamic Programming

-   How do I use a WeightMatrix to find a motif?
-   How do I make a HMMER like profile HMM?
-   How do I set up a custom HMM?
-   How do I generate a pair-wise alignment?

### User Interfaces

-   How can I visualize Annotations and Features as a tree?
-   How can I display a Sequence in a GUI?
-   How do I display Sequence coordinates?
-   How can I display features?

### BioSQL and Sequence Databases

-   How do I set up BioSQL with PostgreSQL? (by David Huen)
-   How do I set up BioSQL with Oracle? (by Richard Holland)
-   How do I add, view and remove Sequence Objects from a BioSQL DB?

### Genetic Algorithms

-   How can I make a Genetic Algorithm with BioJava?

### Protein Alignments and Secondary Structure Prediction with STRAP (by Christophe Gille)

-   Introduction to the STRAP API
-   STRAP / BioJava interoperability
-   How do I make a multiple sequence alignment?
-   How can predict protein secondary structure?

Disclaimer
----------

This code is generously donated by people who probably have better
things to do. Where possible we test it but errors may have crept in. As
such, all code and advice here in has no warranty or guarantee of any
sort. You didn't pay for it and if you use it we are not responsible for
anything that goes wrong. Be a good programmer and test it yourself
before unleashing it on your corporate database.

Copyright
---------

The documentation on this site is the property of the people who
contributed it. If you wish to use it in a publication please make a
request through the [biojava mailing
list](mailto:biojava-l@biojava.org).

The code is [open-source](wp:Open source "wikilink"). A good definition
of open-source can be found
[here](http://www.opensource.org/docs/definition_plain.php). If you
agree with that definition then you can use it.

--[Guedes](User:Guedes "wikilink") 20:59, 6 February 2006 (EST)
