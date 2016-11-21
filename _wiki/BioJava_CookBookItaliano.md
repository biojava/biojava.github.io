---
title: BioJava:CookBookItaliano
permalink: wiki/BioJava%3ACookBookItaliano
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
[Francese](/wiki/BioJava:CookbookFrench "wikilink") (Tradotto da Sylvain
Foisy; ultimo aggiornamento : 9 Luglio 2009).

E' possibile leggere BioJava in Anger in
[Portoghese](/wiki/BioJava:CookbookPortuguese "wikilink") (Tradotto da Dickson
Guedes)

E' possibile leggere BioJava in Anger in
[Giapponese](http://www.geocities.jp/bio_portal/bj_in_anger_ja/)
(Tradotto da Takeshi Sasayama e Kentaro Sugino, ultimo aggiornamento 14
Aug 2004).

E' possibile leggere BioJava in Anger in
[Cinese](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)
(Tradotto da Xin).

E' possibile leggere BioJava in Anger in
[Italiano](/wiki/BioJava:CookBookItaliano "wikilink") (Tradotto da Alessandro
Cipriani; ultimo aggiornamento: 09 Maggio 2010).

Come posso....?
---------------

### Per Iniziare

-   [Come posso ottenere
    Java](http://java.sun.com/javase/downloads/index.jsp)?
-   [Come posso ottenere e installare
    BioJava](/wiki/BioJava:CookBookItaliano:GetStarted "wikilink")?

### Alfabeti e Simboli

-   [Come posso ottenere l'alfabeto del DNA, dell'RNA o
    Proteico](/wiki/BioJava:CookBookItaliano:Alphabets "wikilink")?
-   [Come posso creare un Alfabeto personalizzato con Simboli
    personalizzati](/wiki/BioJava:CookBookItaliano:Alphabets:Custom "wikilink")?
-   [Come posso creare un CrossProductAlphabet? (ad esempio un alfabeto
    di
    codoni)](/wiki/BioJava:CookBookItaliano:Alphabets:CrossProduct "wikilink")?
-   [Come posso dividere i Simboli di un CrossProductAlphabets i maniera
    tale da recuperare i Simboli che li
    compongo](/wiki/BioJava:CookBookItaliano:Alphabets:Component "wikilink")?
-   [Come posso stabilire l'identità fra Simboli e
    Alfabeti](/wiki/BioJava:CookBookItaliano:Alphabets:Canonical "wikilink")?
-   [Come posso costruire simboli ambigui come Y o
    R](/wiki/BioJava:CookBookItaliano:Alphabets:Ambiguous "wikilink")?

### Manipolazioni Elementari di Sequenze

-   [Come posso creare un oggetto Stringa a partire da una Sequenza e
    viceversa creare un oggetto Sequenza a partire da una
    Stringa](/wiki/BioJava:CookBookItaliano:Sequence "wikilink")?
-   [Come posso ottenere una parte di una
    Sequenza](/wiki/BioJava:CookBookItaliano:Sequence:SubSequence "wikilink")?
-   [Come posso trascrivere una Sequenze di DNA in una Sequenza di
    RNA](/wiki/BioJava:CookBookItaliano:Sequence:Transcribe "wikilink")?
-   [Come posso fare il complemento inverso di una sequenza o di una
    SymbolList](/wiki/BioJava:CookBookItaliano:Sequence:Reverse "wikilink")?
-   [Come posso cambiare il nome ad una Sequenza visto che è
    immutabile](/wiki/BioJava:CookBookItaliano:Sequence:ChangeName "wikilink")?
-   [Come posso modificare una Sequence o una
    SymbolList](/wiki/BioJava:CookBookItaliano:Sequence:Edit "wikilink")?
-   [Come posso trasformare un motivo di interesse biologico in una
    espressione
    regolare](/wiki/BioJava:CookBookItaliano:Sequence:Regex "wikilink")?
-   [Come posso estrarre tutte le regioni che rappresentano
    caratteristiche speciali (ad esempio 'geni' or 'sequenze
    codificanti')](/wiki/BioJava:CookBookItaliano:Sequence:ExtractGeneRegions "wikilink")?

### Traduzioni

-   [Come posso tradurre una Sequence o una SymbolList di DNA o RNA in
    una Proteina](/wiki/BioJava:CookBookItaliano:Translation "wikilink")?
-   [Come posso tradurre un singolo codone in un singolo
    aminoacido](/wiki/BioJava:CookBookItaliano:Translation:Single "wikilink")?
-   [Come posso utilizzare una tavola di traduzione non
    standard](/wiki/BioJava:CookBookItaliano:Translation:NonStandart "wikilink")?
-   [Come posso tradure una sequenza di nucleotidi secondo tutti i sei
    frame](/wiki/BioJava:CookBookItaliano:Translation:SixFrames "wikilink")?
-   [Come è possibile ottenere una traduzione con codice a una lettera
    di una sequenza che contiene
    ambiguità](/wiki/BioJava:CookBookItaliano:Translation:OneLetterAmbi "wikilink")?

### Proteomica

-   [Come posso calcolare la massa e il pI di un
    aminoacido](/wiki/BioJava:CookBookItaliano:Proteomics "wikilink")?
-   [Come posso analizzare le proprietà dei vari simboli di una sequenza
    peptidica utilizzano Amino Acid Index
    DataBase](/wiki/BioJava:CookBookItaliano:Proteomics:AAindex "wikilink")?

### Sequenze I/O

-   [Come posso scrivere le sequeze in formato
    FASTA](/wiki/BioJava:CookBookItaliano:SeqIO:WriteInFasta "wikilink")?
-   [ Come posso leggere un file in formato
    FASTA](/wiki/BioJava:CookBookItaliano:SeqIO:ReadFasta "wikilink")?
-   [Come posso leggere un file in formato
    GenBank/EMBL/UniProt/FASTA/INSDseq](/wiki/BioJava:CookBookItaliano:SeqIO:ReadGES "wikilink")?
-   [Come posso leggere una sequenza GenBank/EMBL/UniProt/FASTA/INSDseq
    e convertirla nel formato
    FASTA](/wiki/BioJava:CookBookItaliano:SeqIO:GBtoFasta "wikilink")?
-   [How do I turn an ABI sequence trace into a BioJava
    Sequence](/wiki/BioJava:Cookbook:SeqIO:ABItoSequence "wikilink")?
-   [How does sequence I/O work in
    BioJava](/wiki/BioJava:Cookbook:SeqIO:Echo "wikilink")?

### Annotazioni

-   [Come posso elencare le Annotazioni di una
    Sequenza](/wiki/BioJava:CookBookItaliano:Annotations:List "wikilink")?
-   [Come posso estrarre le Annotazioni per un insieme di
    Features](/wiki/BioJava:CookBookItaliano:Annotations:List2 "wikilink")?
-   [Come posso filtrare le sequenze in base alle specie o secondo altre
    proprietà](/wiki/BioJava:CookBookItaliano:Annotations:Filter "wikilink")?

### Locations and Features

-   [How do I specify a
    PointLocation](/wiki/BioJava:Cookbook:Locations:Point "wikilink")?
-   [How do I specify a
    RangeLocation](/wiki/BioJava:Cookbook:Locations:Range "wikilink")?
-   [How do CircularLocations
    work](/wiki/BioJava:Cookbook:Locations:Circular "wikilink")?
-   [How can I make a
    Feature](/wiki/BioJava:Cookbook:Locations:Feature "wikilink")?
-   [How can I filter Features by
    type](/wiki/BioJava:Cookbook:Locations:Filter "wikilink")?
-   [How can I remove
    features](/wiki/BioJava:Cookbook:Locations:Remove "wikilink")?

### BLAST and FASTA

-   [How do I set up a BLAST
    parser](/wiki/BioJava:CookBook:Blast:Parser "wikilink")?
-   [How do I set up a FASTA
    parser](/wiki/BioJava:CookBook:Fasta:Parser "wikilink")?
-   [How do I extract information from parsed
    results](/wiki/BioJava:CookBook:Blast:Extract "wikilink")?
-   [How do I parse a large file; Or, How do I make a custom
    SearchContentHandler](/wiki/BioJava:CookBook:Blast:Echo "wikilink")?
-   [How do I convert an XML BLAST result into HTML
    page](/wiki/BioJava:CookBook:Blast:XML "wikilink")?

### Counts and Distributions

-   [How do I count the residues in a
    Sequence](/wiki/BioJava:CookBook:Count:Residues "wikilink")?
-   [How do I calculate the frequency of a Symbol in a
    Sequence](/wiki/BioJava:CookBook:Count:Frequency "wikilink")?
-   [How can I turn a Count into a
    Distribution](/wiki/BioJava:CookBook:Count:ToDistrib "wikilink")?
-   [How can I generate a random sequence from a
    Distribution](/wiki/BioJava:CookBook:Distribution:RandomSeqs "wikilink")?
-   [How can I find the amount of information or entropy in a
    Distribution](/wiki/BioJava:CookBook:Distribution:Entropy "wikilink")?
-   [What is an easy way to tell if two Distributions have equal
    weights](/wiki/BioJava:CookBook:Distribution:Emission "wikilink")?
-   [How can I make an OrderNDistribution over a custom
    Alphabet](/wiki/BioJava:CookBook:Distribution:Custom "wikilink")?
-   [How can I write a Distribution as
    XML](/wiki/BioJava:CookBook:Distribution:XML "wikilink")?
-   [Using Distributions to make a Gibbs
    sampler](/wiki/BioJava:CookBook:Distribution:Gibbs "wikilink")
-   [Using Distributions to make a naive Bayes
    classifier](/wiki/BioJava:CookBook:Distribution:Bayes "wikilink")
-   [How do I calculate the composition of a Sequence or collection of
    Sequences?](/wiki/BioJava:CookBook:Distribution:Composition "wikilink")
    This example uses JDK 1.5 and BioJavaX

### Matrici Pesate e Programmazione Dinamica

-   [Come posso utilizzare una matrice di pesi per cercare un
    motivo](/wiki/BioJava:CookBook:DP:WeightMatrix "wikilink")?
-   [How do I make a HMMER like profile
    HMM](/wiki/BioJava:CookBook:DP:HMM "wikilink")?
-   |How do I set up a custom HMM? (Link to
    Tutorial?? --[Guedes](User:Guedes "wikilink") 11:43, 8 February 2006
    (EST) )
-   [How do I generate a pair-wise alignment with a Hidden Markov
    Model](/wiki/BioJava:CookBook:DP:PairWise "wikilink")?
-   [Come posso generare un allineamento globale o locale,
    rispettivamente, con gli algoritmi di Needleman-Wunsch o di
    Smith-Waterman](/wiki/BioJava:CookbookItaliano:DP:PairWise2 "wikilink")?

### User Interfaces

-   [How can I visualize Annotations and Features as a
    tree](/wiki/BioJava:CookBook:Interfaces:ViewAsTree "wikilink")?
-   [How can I display a Sequence in a
    GUI](/wiki/BioJava:CookBook:Interfaces:ViewInGUI "wikilink")?
-   [How can I create a RichSequence
    viewer](/wiki/BioJava:CookBook:Interfaces:ViewInGUI2 "wikilink")?
-   [How do I display Sequence
    coordinates](/wiki/BioJava:CookBook:Interfaces:Coordinates "wikilink")?
-   [How can I display
    features](/wiki/BioJava:CookBook:Interfaces:Features "wikilink")?
-   [How can I display Protein Features / a Peptide
    Digest](/wiki/BioJava:CookBook:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL?](/wiki/BioJava:CookBook:BioSQL:SetupPostGre "wikilink") (by
    [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle?](/wiki/BioJava:CookBook:BioSQL:SetupOracle "wikilink") (by
    [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB?](/wiki/BioJava:CookBook:BioSQL:Manage "wikilink")
-   [How can I get a sequence straight from
    NCBI?](/wiki/BioJava:CookBook:ExternalSources:NCBIFetch "wikilink")

### External Applications and Services

-   [How can I use QBlast to do my alignments
    remotely](/wiki/BioJava:CookBook:Services:Qblast "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](/wiki/BioJava:CookBook:GA "wikilink")?

### Protein Structure

-   [How can I read a PDB file?](/wiki/BioJava:CookBook:PDB:read "wikilink")
-   [How can I read a .mmcif
    file?](/wiki/BioJava:CookBook:PDB:mmcif "wikilink")
-   [How can I access the atoms in a
    structure?](/wiki/BioJava:CookBook:PDB:atoms "wikilink")
-   [How can I do calculations on
    atoms?](/wiki/BioJava:CookBook:PDB:atomsCalc "wikilink")
-   [How to work with Groups (AminoAcid, Nucleotide,
    Hetatom)?](/wiki/BioJava:CookBook:PDB:groups "wikilink")
-   [How can I access the header information of a PDB
    file?](/wiki/BioJava:CookBook:PDB:header "wikilink")
-   [How does BioJava deal with SEQRES and ATOM
    groups?](/wiki/BioJava:CookBook:PDB:seqres "wikilink")
-   [How can I mutate a
    residue?](/wiki/BioJava:CookBook:PDB:mutate "wikilink")
-   [How can I calculate a structure
    alignment?](/wiki/BioJava:CookBook:PDB:align "wikilink")
-   [How can I use a simple GUI to calculate an
    alignment?](/wiki/BioJava:CookBook:PDB:alignGUI "wikilink")
-   [How can I interact with
    Jmol?](/wiki/BioJava:CookBook:PDB:Jmol "wikilink")
-   [How can I serialize to a
    database?](/wiki/BioJava:CookBook:PDB:hibernate "wikilink")

### Ontologies

-   [How can I parse an OBO
    file?](/wiki/BioJava:CookBook:OBO:parse "wikilink")
-   [How can I visualize an OBO file as a directed acyclic
    graph?](/wiki/BioJava:CookBook:OBO:visualize "wikilink")

