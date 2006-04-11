---
title: BioJava:CookbookPortuguese
---

**UNDER CONSTRUCTION** --[Guedes](User:Guedes "wikilink") 15:22, 11
April 2006 (EDT)

BioJava in Anger - um livro de receitas para aquelas que tem pressa
-------------------------------------------------------------------

BioJava pode ser grande e intimidador. Para aqueles que, como nós, tem
pressa em obter resultados e ir direto ao ponto foi montado este
documento com a finalidade de auxilia-los no desenvolvimento de
programas utilizando Biojava. Cerca de 99% das tarefas comuns no uso do
Biojava estão descritas aqui, de forma que não se faz necessário decorar
99% de sua API.

A página foi inspirada em vários outros livros de receitas e segue a
linha "Como eu faço...?". Cada "Como eu faço?" esta linkado a alguns
codigos de exemplo que faz o que voce precisa e algumas vezes mais do
que espera. Basicamente se voce encontrar o código voce pode copiá-lo e
colá-lo em seu programa e ele irá executar normalmente. Eu esforcei-me
ao máximo para manter o código o mais óbvio possível.

Biojava in Anger é mantido por [Mark Schreiber](User:Mark "wikilink").
Se voce tem qualquer sugestão, dúvidas ou comentários contate a [lista
do biojava](mailto:biojava-l@biojava.org). Para se inscrever na lista
clique [aqui](http://biojava.org/mailman/listinfo/biojava-l)

Estas demonstrações foram testadas no BioJava 1.3 and BioJava 1.4

Anúncios
--------

Você encontra também a versão em
[Francês](Biojava:CookbookFrench "wikilink") do 'Biojava in Anger'
(traduzido por Sylvain Foisy).

Você também pode ler uma versão em
[Japonês](http://www.geocities.jp/bio_portal/bj_in_anger_ja/) (traduzida
por Takeshi Sasayama and Kentaro Sugino, atualizada em 14 Ago 2004).

Ou ainda em
[Chinês](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)?
(traduzido por Wu Xin).

Apresentações
-------------

Está é uma apresentação no PowerPoint para [BioJava API version
1.4](http://www.biojava.org/docs/bj_in_anger/BioJavaAPI.ppt)

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

-   [How do I specify a
    PointLocation](BioJava:Cookbook:Locations:Point "wikilink")?
-   [How do I specify a
    RangeLocation](BioJava:Cookbook:Locations:Range "wikilink")?
-   [How do CircularLocations
    work](BioJava:Cookbook:Locations:Circular "wikilink")?
-   [How can I make a
    Feature](BioJava:Cookbook:Locations:Feature "wikilink")?
-   [How can I filter Features by
    type](BioJava:Cookbook:Locations:Filter "wikilink")?
-   [How can I remove
    features](BioJava:Cookbook:Locations:Remove "wikilink")?

### BLAST and FASTA

-   [How do I set up a BLAST
    parser](BioJava:CookBook:Blast:Parser "wikilink")?
-   [How do I set up a FASTA
    parser](BioJava:CookBook:Fasta:Parser "wikilink")?
-   [How do I extract information from parsed
    results](BioJava:CookBook:Blast:Extract "wikilink")?
-   [How do I parse a large file; Or, How do I make a custom
    SearchContentHandler](BioJava:CookBook:Blast:Echo "wikilink")?
-   Expert information on the BioJava SAX2 event based parsing framework
    by Cambridge Antibody Technology. Contains a UML diagram. Warning,
    this information may be a little dated now. (to be
    continued --[Guedes](User:Guedes "wikilink") 16:30, 7 February 2006
    (EST))

### Counts and Distributions

-   [How do I count the residues in a
    Sequence](BioJava:CookBook:Count:Residues "wikilink")?
-   [How do I calculate the frequency of a Symbol in a
    Sequence](BioJava:CookBook:Count:Frequency "wikilink")?
-   [How can I turn a Count into a
    Distribution](BioJava:CookBook:Count:ToDistrib "wikilink")?
-   [How can I generate a random sequence from a
    Distribution](BioJava:CookBook:Distribution:RandomSeqs "wikilink")?
-   [How can I find the amount of information or entropy in a
    Distribution](BioJava:CookBook:Distribution:Entropy "wikilink")?
-   [What is an easy way to tell if two Distributions have equal
    weights](BioJava:CookBook:Distribution:Emission "wikilink")?
-   [How can I make an OrderNDistribution over a custom
    Alphabet](BioJava:CookBook:Distribution:Custom "wikilink")?
-   [How can I write a Distribution as
    XML](BioJava:CookBook:Distribution:XML "wikilink")?
-   [Using Distributions to make a Gibbs
    sampler](BioJava:CookBook:Distribution:Gibbs "wikilink")
-   [Using Distributions to make a naive Bayes
    classifier](BioJava:CookBook:Distribution:Bayes "wikilink")
-   [How do I calculate the composition of a Sequence or collection of
    Sequences?](Biojava:CookBook:Distribution:Composition "wikilink")
    This example uses JDK 1.5 and BioJavaX

### Weight Matrices and Dynamic Programming

-   [How do I use a WeightMatrix to find a
    motif](BioJava:CookBook:DP:WeightMatrix "wikilink")?
-   [How do I make a HMMER like profile
    HMM](BioJava:CookBook:DP:HMM "wikilink")?
-   |How do I set up a custom HMM? (Link to
    Tutorial?? --[Guedes](User:Guedes "wikilink") 11:43, 8 February 2006
    (EST) )
-   [How do I generate a pair-wise
    alignment](BioJava:CookBook:DP:PairWise "wikilink") with a Hidden
    Markov Model?
-   [How do I generate a global or local
    alignment](BioJava:CookBook:DP:PairWise2 "wikilink") with the
    Needleman-Wunsch- or the Smith-Waterman-algorithm?

### User Interfaces

-   [How can I visualize Annotations and Features as a
    tree](BioJava:CookBook:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](BioJava:CookBook:Interfaces:ViewInGUI "wikilink")?
-   [How do I display Sequence
    coordinates](BioJava:CookBook:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](BioJava:CookBook:Interfaces:Features "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](BioJava:CookBook:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL](BioJava:CookBook:BioSQL:SetupPostGre "wikilink")? (by
    [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle](BioJava:CookBook:BioSQL:SetupOracle "wikilink")? (by
    [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB](BioJava:CookBook:BioSQL:Manage "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](BioJava:CookBook:GA "wikilink")?

### Protein Structure

-   [How can I read a PDB file?](BioJava:CookBook:PDB:read "wikilink")
-   [How can I mutate a
    residue?](BioJava:CookBook:PDB:mutate "wikilink")

### Protein Alignments and Secondary Structure Prediction with STRAP (by Christophe Gille)

-   [Introduction to the STRAP
    API](http://www.charite.de/bioinf/strap/Scripting.html)
-   [STRAP/BioJava
    interoperability](http://www.charite.de/bioinf/strap/biojava.html)
-   [How do I make a multiple sequence
    alignment](http://www.charite.de/bioinf/strap/biojavaInAnger_SequenceAligner.html)?
-   [How can predict protein secondary
    structure](http://www.charite.de/bioinf/strap/biojavaInAnger_SecondaryStructure_Predictor.html)?

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
