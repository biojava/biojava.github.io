---
title: BioJava:CookBookItaliano
---

BioJava In Anger-Un tutorial e una raccolta di esempi per coloro che hanno "fretta"
-----------------------------------------------------------------------------------

Apparentemente il progetto BioJava può sembrare enorme e difficile da
comprendere. Per tutti coloro che necessitano di usare subito gli
strumenti forniti da Biojava, possono trovare tutto ciò di cui hanno
bisogno per iniziare... e anche qualcosa di più. Questo documento è
stato creato per favorire lo sviluppo di software con i programmi
forniti dal FrameWork BioJava; i quali eseguono il 99% dei task più
comuni senza l'obbligo di conoscere e comprendere il 99% delle API di
BioJava. Queste pagine nascono da vari cookbooks relativi ad altri
linguaggi di programmazione e seguono un approccio del tipo: "Come
posso....?". Ogni domanda è collegata a delle parti di codice che fanno
ciò di cui uno ha bisogno e anche qualcosa di più. In pratica basta
trovare il codice desiderato, copiarlo, incollarlo all'interno del
proprio programma e quindi ottenere poi i risultati desiderati in breve
tempo. Oltre che documentazione mi sono sforzato di rendere chiaro il
codice e tanto da farlo sembrare ovvio e in alcuni casi quasi superfluo.
Per suggerimenti, domande o commeti scrivere a [biojava mailing
list](mailto:biojava-l@biojava.org). Per Iscriversi alla mailing seguire
questo link [qui](http://biojava.org/mailman/listinfo/biojava-l)

Nel caso si riutilizzi il code di questo cookbook perfavore si citi:

Avvisi
------

E' possibile leggere BioJava in Anger in
[Francese](Biojava:CookbookFrench "wikilink") (Tradotto da Sylvain
Foisy; ultimo aggiornamento : 9 Luglio 2009).

E' possibile leggere BioJava in Anger in
[Portoghese](Biojava:CookbookPortuguese "wikilink") (Tradotto da Dickson
Guedes)

E' possibile leggere BioJava in Anger in
[Giapponese](http://www.geocities.jp/bio_portal/bj_in_anger_ja/)
(Tradotto da Takeshi Sasayama e Kentaro Sugino, ultimo aggiornamento 14
Aug 2004).

E' possibile leggere BioJava in Anger in
[Cinese](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)
(Tradotto da Xin).

E' possibile leggere BioJava in Anger in
[Italiano](Biojava:CookBookItaliano "wikilink") (Tradotto da Alessandro
Cipriani; ultimo aggiornamento: 9 Novembre 2009).

Come posso....?
---------------

### Setup

-   [Come ottenere
    Java](http://java.sun.com/javase/downloads/index.jsp)?
-   [Come posso ottenere e installare
    BioJava](BioJava:CookBookItaliano:GetStarted "wikilink")?

### Alfabeti e Simboli

-   [Come posso ottenere l'alfabeto del DNA, dell'RNA o
    Proteico](Biojava:CookBookItaliano:Alphabets "wikilink")?
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
-   [How can I extract all regions beeing marked (or not) with a special
    feature (e.g. 'gene' or
    'CDS')](Biojava:Cookbook:Sequence:ExtractGeneRegions "wikilink")?

### Translation

-   [How do I translate a DNA or RNA Sequence or SymbolList to
    Protein](Biojava:Cookbook:Translation "wikilink")?
-   [How do I translate a single codon to a single amino
    acid](Biojava:Cookbook:Translation:Single "wikilink")?
-   [How do I use a non standard translation
    table](Biojava:Cookbook:Translation:NonStandart "wikilink")?
-   [How do I translate a nucleotide sequence in all six
    frames](Biojava:Cookbook:Translation:SixFrames "wikilink")?
-   [How do I retrieve the 1-Letter code of a translated sequence
    containing
    ambiguities](Biojava:Cookbook:Translation:OneLetterAmbi "wikilink")?

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
-   [How do I read a sequence file with the Biojavax
    extension](Biojava:Cookbook:SeqIO:ReadGESBiojavax "wikilink")?
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
-   [How do I convert an XML BLAST result into HTML
    page](BioJava:CookBook:Blast:XML "wikilink")?

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
-   [How do I generate a pair-wise alignment with a Hidden Markov
    Model](BioJava:CookBook:DP:PairWise "wikilink")?
-   [How do I generate a global or local alignment with the
    Needleman-Wunsch- or the
    Smith-Waterman-algorithm](BioJava:CookBook:DP:PairWise2 "wikilink")?

### User Interfaces

-   [How can I visualize Annotations and Features as a
    tree](BioJava:CookBook:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](BioJava:CookBook:Interfaces:ViewInGUI "wikilink")?
-   [How can I create a RichSequence
    viewer](BioJava:CookBook:Interfaces:ViewInGUI2 "wikilink")?
-   [How do I display Sequence
    coordinates](BioJava:CookBook:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](BioJava:CookBook:Interfaces:Features "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](BioJava:CookBook:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL?](BioJava:CookBook:BioSQL:SetupPostGre "wikilink") (by
    [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle?](BioJava:CookBook:BioSQL:SetupOracle "wikilink") (by
    [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB?](BioJava:CookBook:BioSQL:Manage "wikilink")
-   [How can I get a sequence straight from
    NCBI?](BioJava:CookBook:ExternalSources:NCBIFetch "wikilink")

### External Applications and Services

-   [How can I use QBlast to do my alignments
    remotely](BioJava:CookBook:Services:Qblast "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](BioJava:CookBook:GA "wikilink")?

### Protein Structure

-   [How can I read a PDB file?](BioJava:CookBook:PDB:read "wikilink")
-   [How can I read a .mmcif
    file?](BioJava:CookBook:PDB:mmcif "wikilink")
-   [How can I access the atoms in a
    structure?](BioJava:CookBook:PDB:atoms "wikilink")
-   [How can I do calculations on
    atoms?](BioJava:CookBook:PDB:atomsCalc "wikilink")
-   [How to work with Groups (AminoAcid, Nucleotide,
    Hetatom)?](BioJava:CookBook:PDB:groups "wikilink")
-   [How can I access the header information of a PDB
    file?](BioJava:CookBook:PDB:header "wikilink")
-   [How does BioJava deal with SEQRES and ATOM
    groups?](BioJava:CookBook:PDB:seqres "wikilink")
-   [How can I mutate a
    residue?](BioJava:CookBook:PDB:mutate "wikilink")
-   [How can I calculate a structure
    alignment?](BioJava:CookBook:PDB:align "wikilink")
-   [How can I use a simple GUI to calculate an
    alignment?](BioJava:CookBook:PDB:alignGUI "wikilink")
-   [How can I interact with
    Jmol?](BioJava:CookBook:PDB:Jmol "wikilink")
-   [How can I serialize to a
    database?](BioJava:CookBook:PDB:hibernate "wikilink")

### Ontologies

-   [How can I parse an OBO
    file?](BioJava:CookBook:OBO:parse "wikilink")
-   [How can I visualize an OBO file as a directed acyclic
    graph?](BioJava:CookBook:OBO:visualize "wikilink")

