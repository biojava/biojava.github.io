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

Esta tradução para o Portugues (Brasil) é mantida por [ Dickson S.
Guedes](User:Guedes "wikilink"), porém, por se tratar de um sistema
Wiki, correções podem ser feitas desde que estejam de acordo com o
documento original [neste link](BioJava:Cookbook "wikilink").

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

Publicações
-----------

Busque informações no [Google
Scholar](http://scholar.google.com/scholar?q=biojava) sobre publicações
a respeito do BioJava.

Como eu faço para....?
----------------------

### Instalação

-   [Onde eu encontro a instalação do
    Java](http://java.sun.com/downloads/)?
-   [Como obter a instalação do BioJava](BioJava:GetStarted "wikilink")?

### Alfabetos e Simbolos

-   [Como obter o Alfabeto de DNA, RNA ou
    Proteina](Biojava:CookbookPortuguese:Alphabets "wikilink")?
-   [Como crio alfabetos customizados a partir de simbolos
    customizados?](Biojava:CookbookPortuguese:Alphabets:Custom "wikilink")?
-   [Como crio um CrossProductAlphabet, por exemplo, um alfabeto de
    codons](Biojava:CookbookPortuguese:Alphabets:CrossProduct "wikilink")?
-   [Como eu divido os Simbolos de um CrossProductAlphabet em seus
    componentes](Biojava:CookbookPortuguese:Alphabets:Component "wikilink")?
-   [Como eu verifico se Alfabetos ou Simbolos são
    iguais](Biojava:CookbookPortuguese:Alphabets:Cononical "wikilink")?
-   [Como eu crio simbolos ambíguos como Y ou
    R](Biojava:CookbookPortuguese:Alphabets:Ambiguous "wikilink")?

### Basic Sequence Manipulation

-   [How do I make a Sequence from a String or make a Sequence Object
    back into a String](Biojava:CookbookPortuguese:Sequence "wikilink")?
-   [How do I get a subsection of a
    Sequence](Biojava:CookbookPortuguese:Sequence:SubSequence "wikilink")?
-   [How do I transcribe a DNA Sequence to a RNA
    Sequence](Biojava:CookbookPortuguese:Sequence:Transcribe "wikilink")?
-   [How do I reverse complement a DNA or RNA
    Sequence](Biojava:CookbookPortuguese:Sequence:Reverse "wikilink")?
-   [Sequences are immutable so how can I change it's
    name](Biojava:CookbookPortuguese:Sequence:ChangeName "wikilink")?
-   [How can I edit a Sequence or
    SymbolList](Biojava:CookbookPortuguese:Sequence:Edit "wikilink")?
-   [How can I make a sequence motif into a regular
    expression](Biojava:CookbookPortuguese:Sequence:Regex "wikilink")?

### Translation

-   [How do I translate a DNA or RNA Sequence or SymbolList to
    Protein](Biojava:CookbookPortuguese:Translation "wikilink")?
-   [How do I translate a single codon to a single amino
    acid](Biojava:CookbookPortuguese:Translation:Single "wikilink")?
-   [How do I use a non standard translation
    table](Biojava:CookbookPortuguese:Translation:NonStandart "wikilink")?
-   [How do I translate a nucleotide sequence in all six
    frames](Biojava:CookbookPortuguese:Translation:SixFrames "wikilink")?

### Proteomics

-   [How do I calculate the mass and pI of a
    peptide](Biojava:CookbookPortuguese:Proteomics "wikilink")?
-   [How do I analyze the symbol properties of an amino acid sequence
    using the Amino Acid Index
    database](Biojava:CookbookPortuguese:Proteomics:AAindex "wikilink")?

### Sequence I/O

-   [How do I write Sequences in Fasta
    format](Biojava:CookbookPortuguese:SeqIO:WriteInFasta "wikilink")?
-   [How do I read in a Fasta
    file](Biojava:CookbookPortuguese:SeqIO:ReadFasta "wikilink")?
-   [How do I read a GenBank/EMBL/SwissProt
    file](Biojava:CookbookPortuguese:SeqIO:ReadGES "wikilink")?
-   [How do I extract GenBank/EMBL/Swissprot sequences and write them as
    Fasta](Biojava:CookbookPortuguese:SeqIO:GBtoFasta "wikilink")?
-   [How do I turn an ABI sequence trace into a BioJava
    Sequence](Biojava:CookbookPortuguese:SeqIO:ABItoSequence "wikilink")?
-   [How does sequence I/O work in
    BioJava](Biojava:CookbookPortuguese:SeqIO:Echo "wikilink")?

### Annotations

-   [How do I list the Annotations in a
    Sequence](BioJava:CookbookPortuguese:Annotations:List "wikilink")?
-   [How do I filter a Sequences based on their species (or another
    Annotation
    property)](BioJava:CookbookPortuguese:Annotations:Filter "wikilink")?

### Locations and Features

-   [How do I specify a
    PointLocation](BioJava:CookbookPortuguese:Locations:Point "wikilink")?
-   [How do I specify a
    RangeLocation](BioJava:CookbookPortuguese:Locations:Range "wikilink")?
-   [How do CircularLocations
    work](BioJava:CookbookPortuguese:Locations:Circular "wikilink")?
-   [How can I make a
    Feature](BioJava:CookbookPortuguese:Locations:Feature "wikilink")?
-   [How can I filter Features by
    type](BioJava:CookbookPortuguese:Locations:Filter "wikilink")?
-   [How can I remove
    features](BioJava:CookbookPortuguese:Locations:Remove "wikilink")?

### BLAST and FASTA

-   [How do I set up a BLAST
    parser](BioJava:CookbookPortuguese:Blast:Parser "wikilink")?
-   [How do I set up a FASTA
    parser](BioJava:CookbookPortuguese:Fasta:Parser "wikilink")?
-   [How do I extract information from parsed
    results](BioJava:CookbookPortuguese:Blast:Extract "wikilink")?
-   [How do I parse a large file; Or, How do I make a custom
    SearchContentHandler](BioJava:CookbookPortuguese:Blast:Echo "wikilink")?
-   Expert information on the BioJava SAX2 event based parsing framework
    by Cambridge Antibody Technology. Contains a UML diagram. Warning,
    this information may be a little dated now. (to be
    continued --[Guedes](User:Guedes "wikilink") 16:30, 7 February 2006
    (EST))

### Counts and Distributions

-   [How do I count the residues in a
    Sequence](BioJava:CookbookPortuguese:Count:Residues "wikilink")?
-   [How do I calculate the frequency of a Symbol in a
    Sequence](BioJava:CookbookPortuguese:Count:Frequency "wikilink")?
-   [How can I turn a Count into a
    Distribution](BioJava:CookbookPortuguese:Count:ToDistrib "wikilink")?
-   [How can I generate a random sequence from a
    Distribution](BioJava:CookbookPortuguese:Distribution:RandomSeqs "wikilink")?
-   [How can I find the amount of information or entropy in a
    Distribution](BioJava:CookbookPortuguese:Distribution:Entropy "wikilink")?
-   [What is an easy way to tell if two Distributions have equal
    weights](BioJava:CookbookPortuguese:Distribution:Emission "wikilink")?
-   [How can I make an OrderNDistribution over a custom
    Alphabet](BioJava:CookbookPortuguese:Distribution:Custom "wikilink")?
-   [How can I write a Distribution as
    XML](BioJava:CookbookPortuguese:Distribution:XML "wikilink")?
-   [Using Distributions to make a Gibbs
    sampler](BioJava:CookbookPortuguese:Distribution:Gibbs "wikilink")
-   [Using Distributions to make a naive Bayes
    classifier](BioJava:CookbookPortuguese:Distribution:Bayes "wikilink")
-   [How do I calculate the composition of a Sequence or collection of
    Sequences?](Biojava:CookbookPortuguese:Distribution:Composition "wikilink")
    This example uses JDK 1.5 and BioJavaX

### Weight Matrices and Dynamic Programming

-   [How do I use a WeightMatrix to find a
    motif](BioJava:CookbookPortuguese:DP:WeightMatrix "wikilink")?
-   [How do I make a HMMER like profile
    HMM](BioJava:CookbookPortuguese:DP:HMM "wikilink")?
-   |How do I set up a custom HMM? (Link to
    Tutorial?? --[Guedes](User:Guedes "wikilink") 11:43, 8 February 2006
    (EST) )
-   [How do I generate a pair-wise
    alignment](BioJava:CookbookPortuguese:DP:PairWise "wikilink") with a
    Hidden Markov Model?
-   [How do I generate a global or local
    alignment](BioJava:CookbookPortuguese:DP:PairWise2 "wikilink") with
    the Needleman-Wunsch- or the Smith-Waterman-algorithm?

### User Interfaces

-   [How can I visualize Annotations and Features as a
    tree](BioJava:CookbookPortuguese:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](BioJava:CookbookPortuguese:Interfaces:ViewInGUI "wikilink")?
-   [How do I display Sequence
    coordinates](BioJava:CookbookPortuguese:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](BioJava:CookbookPortuguese:Interfaces:Features "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](BioJava:CookbookPortuguese:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL](BioJava:CookbookPortuguese:BioSQL:SetupPostGre "wikilink")?
    (by [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle](BioJava:CookbookPortuguese:BioSQL:SetupOracle "wikilink")?
    (by [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB](BioJava:CookbookPortuguese:BioSQL:Manage "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](BioJava:CookbookPortuguese:GA "wikilink")?

### Protein Structure

-   [How can I read a PDB
    file?](BioJava:CookbookPortuguese:PDB:read "wikilink")
-   [How can I mutate a
    residue?](BioJava:CookbookPortuguese:PDB:mutate "wikilink")

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
