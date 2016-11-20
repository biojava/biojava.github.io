---
title: BioJava:CookBookLegacy
permalink: wikis/BioJava%3ACookBookLegacy
---

BioJava 3.\* release
--------------------

BioJava 3 is a major re-write of BioJava 1. The cookbook for the new API
is available from here: <BioJava:CookBook>. The content on this page is
still available to support the legacy code base, which is now available
through the biojava-legacy project on Github at
[<https://github.com/biojava/biojava-legacy>](https://github.com/biojava/biojava-legacy).

BioJava 1 reference
-------------------

If you use BioJava 1 please cite:

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

If you have any suggestions, questions or comments contact the [biojava
mailing list](mailto:biojava-l@biojava.org). To subscribe to this list
go [here](http://biojava.org/mailman/listinfo/biojava-l)

If you re-use code from the cookbook please cite:

Announcing
----------

You can now read BioJava in Anger in
[French](/wikis/BioJava:CookbookFrench "wikilink") (Translated by Sylvain
Foisy; mise à jour / updated : 28 décembre 2009).

You can also read Biojava in Anger in
[Portuguese](/wikis/BioJava:CookbookPortuguese "wikilink") (Translated by
Dickson Guedes)

You can also read BioJava in Anger in
[Japanese](http://www.geocities.jp/bio_portal/bj_in_anger_ja/)
(Translated by Takeshi Sasayama and Kentaro Sugino, updated 14 Aug
2004).

How about simplified
[Chinese](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)?
(Translated by Wu Xin).

And lets not forget this new
[Italian](/wikis/BioJava:CookBookItaliano "wikilink") translation (translated
by Alessandro Cipriani; last update: 9 Sep 2010).

How Do I....?
-------------

### Setup

-   [Where do I get a Java
    installation](http://java.sun.com/javase/downloads/index.jsp)?
-   [How do I get and install BioJava](/wikis/BioJava:GetStarted "wikilink")?
-   [How do I integrate BioJava with NetBeans
    IDE](How_to_integrate_BioJava_in_NetBeans_IDE "wikilink")?

### Alphabets and Symbols

-   [How do I get a DNA, RNA or Protein
    Alphabet](/wikis/BioJava:Cookbook:Alphabets "wikilink")?
-   [How do I make a custom Alphabet from custom
    Symbols](/wikis/BioJava:Cookbook:Alphabets:Custom "wikilink")?
-   [How do I make a CrossProductAlphabet such as a codon
    Alphabet](/wikis/BioJava:Cookbook:Alphabets:CrossProduct "wikilink")?
-   [How do I break Symbols from CrossProduct Alphabets into their
    component Symbols](/wikis/BioJava:Cookbook:Alphabets:Component "wikilink")?
-   [How can I tell if two Alphabets or Symbols are
    equal](/wikis/BioJava:Cookbook:Alphabets:Cononical "wikilink")?
-   [How can I make an ambiguous Symbol like Y or
    R](/wikis/BioJava:Cookbook:Alphabets:Ambiguous "wikilink")?

### Basic Sequence Manipulation

-   [How do I make a Sequence from a String or make a Sequence Object
    back into a String](/wikis/BioJava:Cookbook:Sequence "wikilink")?
-   [How do I get a subsection of a
    Sequence](/wikis/BioJava:Cookbook:Sequence:SubSequence "wikilink")?
-   [How do I transcribe a DNA Sequence to a RNA
    Sequence](/wikis/BioJava:Cookbook:Sequence:Transcribe "wikilink")?
-   [How do I reverse complement a DNA or RNA
    Sequence](/wikis/BioJava:Cookbook:Sequence:Reverse "wikilink")?
-   [Sequences are immutable so how can I change it's
    name](/wikis/BioJava:Cookbook:Sequence:ChangeName "wikilink")?
-   [How can I edit a Sequence or
    SymbolList](/wikis/BioJava:Cookbook:Sequence:Edit "wikilink")?
-   [How can I make a sequence motif into a regular
    expression](/wikis/BioJava:Cookbook:Sequence:Regex "wikilink")?
-   [How can I extract all regions beeing marked (or not) with a special
    feature (e.g. 'gene' or
    'CDS')](/wikis/BioJava:Cookbook:Sequence:ExtractGeneRegions "wikilink")?

### Translation

-   [How do I translate a DNA or RNA Sequence or SymbolList to
    Protein](/wikis/BioJava:Cookbook:Translation "wikilink")?
-   [How do I translate a single codon to a single amino
    acid](/wikis/BioJava:Cookbook:Translation:Single "wikilink")?
-   [How do I use a non standard translation
    table](/wikis/BioJava:Cookbook:Translation:NonStandart "wikilink")?
-   [How do I translate a nucleotide sequence in all six
    frames](/wikis/BioJava:Cookbook:Translation:SixFrames "wikilink")?
-   [How do I retrieve the 1-Letter code of a translated sequence
    containing
    ambiguities](/wikis/BioJava:Cookbook:Translation:OneLetterAmbi "wikilink")?

### Proteomics

-   [How do I calculate the mass and pI of a
    peptide](/wikis/BioJava:Cookbook:Proteomics "wikilink")?
-   [How do I analyze the symbol properties of an amino acid sequence
    using the Amino Acid Index
    database](/wikis/BioJava:Cookbook:Proteomics:AAindex "wikilink")?

### Sequence I/O

-   [How do I write Sequences in Fasta
    format](/wikis/BioJava:Cookbook:SeqIO:WriteInFasta "wikilink")?
-   [How do I read in a Fasta
    file](/wikis/BioJava:Cookbook:SeqIO:ReadFasta "wikilink")?
-   [How do I read a GenBank/EMBL/SwissProt
    file](/wikis/BioJava:Cookbook:SeqIO:ReadGES "wikilink")?(deprecated)
-   [How do I read a GenBank/EMBL/UniProt/FASTA/INSDseq
    file](/wikis/BioJava:Cookbook:SeqIO:ReadGESBiojavax "wikilink")?
-   [How do I extract GenBank/EMBL/UniProt/FASTA/INSDseq sequences and
    write them as Fasta](/wikis/BioJava:Cookbook:SeqIO:GBtoFasta "wikilink")?
-   [How do I turn an ABI sequence trace into a BioJava
    Sequence](/wikis/BioJava:Cookbook:SeqIO:ABItoSequence "wikilink")?
-   [How do I work with nextgen sequencing reads in FASTQ
    format](/wikis/BioJava:Cookbook:SeqIO:FASTQ "wikilink")?
-   [How does sequence I/O work in
    BioJava](/wikis/BioJava:Cookbook:SeqIO:Echo "wikilink")?

### Annotations

-   [How do I list the Annotations in a
    Sequence](/wikis/BioJava:Cookbook:Annotations:List "wikilink")?
-   [How do I extract Annotations for a set of
    Features](/wikis/BioJava:Cookbook:Annotations:List2 "wikilink")?
-   [How do I filter a Sequences based on their species (or another
    Annotation
    property)](/wikis/BioJava:Cookbook:Annotations:Filter "wikilink")?

### Locations and Features

-   [How do I specify a
    PointLocation](/wikis/BioJava:Cookbook:Locations:Point "wikilink")?
-   [How do I specify a
    RangeLocation](/wikis/BioJava:Cookbook:Locations:Range "wikilink")?
-   [How do CircularLocations
    work](/wikis/BioJava:Cookbook:Locations:Circular "wikilink")?
-   [How can I make a
    Feature](/wikis/BioJava:Cookbook:Locations:Feature "wikilink")?
-   [How can I filter Features by
    type](/wikis/BioJava:Cookbook:Locations:Filter "wikilink")?
-   [How can I remove
    features](/wikis/BioJava:Cookbook:Locations:Remove "wikilink")?

### BLAST and FASTA

-   [How do I set up a BLAST
    parser](/wikis/BioJava:CookBook:Blast:Parser "wikilink")?
-   [How do I set up a FASTA
    parser](/wikis/BioJava:CookBook:Fasta:Parser "wikilink")?
-   [How do I extract information from parsed
    results](/wikis/BioJava:CookBook:Blast:Extract "wikilink")?
-   [How do I parse a large file; Or, How do I make a custom
    SearchContentHandler](/wikis/BioJava:CookBook:Blast:Echo "wikilink")?
-   [How do I convert an XML BLAST result into HTML
    page](/wikis/BioJava:CookBook:Blast:XML "wikilink")?

### Counts and Distributions

-   [How do I count the residues in a
    Sequence](/wikis/BioJava:CookBook:Count:Residues "wikilink")?
-   [How do I calculate the frequency of a Symbol in a
    Sequence](/wikis/BioJava:CookBook:Count:Frequency "wikilink")?
-   [How can I turn a Count into a
    Distribution](/wikis/BioJava:CookBook:Count:ToDistrib "wikilink")?
-   [How can I generate a random sequence from a
    Distribution](/wikis/BioJava:CookBook:Distribution:RandomSeqs "wikilink")?
-   [How can I find the amount of information or entropy in a
    Distribution](/wikis/BioJava:CookBook:Distribution:Entropy "wikilink")?
-   [What is an easy way to tell if two Distributions have equal
    weights](/wikis/BioJava:CookBook:Distribution:Emission "wikilink")?
-   [How can I make an OrderNDistribution over a custom
    Alphabet](/wikis/BioJava:CookBook:Distribution:Custom "wikilink")?
-   [How can I write a Distribution as
    XML](/wikis/BioJava:CookBook:Distribution:XML "wikilink")?
-   [Using Distributions to make a Gibbs
    sampler](/wikis/BioJava:CookBook:Distribution:Gibbs "wikilink")
-   [Using Distributions to make a naive Bayes
    classifier](/wikis/BioJava:CookBook:Distribution:Bayes "wikilink")
-   [How do I calculate the composition of a Sequence or collection of
    Sequences?](/wikis/BioJava:CookBook:Distribution:Composition "wikilink")
    This example uses JDK 1.5 and BioJavaX

### Weight Matrices and Dynamic Programming

-   [How do I use a WeightMatrix to find a
    motif](/wikis/BioJava:CookBook:DP:WeightMatrix "wikilink")?
-   [How do I make a HMMER like profile
    HMM](/wikis/BioJava:CookBook:DP:HMM "wikilink")?
-   |How do I set up a custom HMM? (Link to
    Tutorial?? --[Guedes](User:Guedes "wikilink") 11:43, 8 February 2006
    (EST) )
-   [How do I generate a pair-wise alignment with a Hidden Markov
    Model](/wikis/BioJava:CookBook:DP:PairWise "wikilink")?
-   [How do I generate a global or local alignment with the
    Needleman-Wunsch- or the
    Smith-Waterman-algorithm](/wikis/BioJava:CookBook:DP:PairWise2 "wikilink")?

### User Interfaces

-   [How can I visualize Annotations and Features as a
    tree](/wikis/BioJava:CookBook:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](/wikis/BioJava:CookBook:Interfaces:ViewInGUI "wikilink")?
-   [How can I create a RichSequence
    viewer](/wikis/BioJava:CookBook:Interfaces:ViewInGUI2 "wikilink")?
-   [How do I display Sequence
    coordinates](/wikis/BioJava:CookBook:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](/wikis/BioJava:CookBook:Interfaces:Features "wikilink")?
-   [How can I view an
    Alignment](/wikis/BioJava:CookBook:Interfaces:Alignments "wikilink")?
-   [How can I view an Alignment
    II](/wikis/BioJava:CookBook:Interfaces:Alignments II "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](/wikis/BioJava:CookBook:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL?](/wikis/BioJava:CookBook:BioSQL:SetupPostGre "wikilink") (by
    [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle?](/wikis/BioJava:CookBook:BioSQL:SetupOracle "wikilink") (by
    [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB?](/wikis/BioJava:CookBook:BioSQL:Manage "wikilink")
-   [How can I get a sequence straight from
    NCBI?](/wikis/BioJava:CookBook:ExternalSources:NCBIFetch "wikilink")

### External Applications and Services

-   [How can I use QBlast to do my alignments
    remotely](/wikis/BioJava:CookBook:Services:Qblast "wikilink")?
-   [How to create multi-Alignments using ClustalW and
    BioJava](/wikis/BioJava:Tutorial:MultiAlignClustalW "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](/wikis/BioJava:CookBook:GA "wikilink")?

### Protein Structure

Since BioJava 1.8, all protein structure modules have moved to
[BioJava3](/wikis/BioJava:CookBook "wikilink").

### Ontologies

-   [How can I parse an OBO
    file?](/wikis/BioJava:CookBook:OBO:parse "wikilink")
-   [How can I visualize an OBO file as a directed acyclic
    graph?](/wikis/BioJava:CookBook:OBO:visualize "wikilink")

### Cloud computing

-   [How do I use Biojava in the Amazon EC2
    cloud?](/wikis/BioJava:CookBook:Cloud:ec2 "wikilink")

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
of open-source can be found [here](http://www.opensource.org/docs/osd).
If you agree with that definition then you can use it.
