---
title: BioJava:CookbookFrench
---

BioJava quand il y a le feu - Un tutoriel et un manuel pour les gens pressés
----------------------------------------------------------------------------

La librairie BioJava peut être à la fois imposante et intimidante. Pour
ceux parmi nous qui sommes pressés, il y a vraiment assez de matériel
pour faire tourner la tête. Ce document est conçu pour vous aider à
développer des applications utilisant BioJava, applications capables
d'accomplir 99% des tâches les plus courantes, sans avoir à comprendre
99% de l'API de BioJava.

Cet site est inspiré de tous ces livres de recettes en programmation et
suit la même approche du "Comment faire pour...". Chacune de ces
recettes contient également des codes de démonstration qui font ce que
vous voulez et parfois plus. En bref, si vous trouvez le code que vous
recherchez et faites un simple copier-coller dans votre programme, vous
devriez être en mesure de réussir rapidement. J'ai tenté (enfin, Mark
tente et je traduit!) de sur-documenter le code pour rendre plus évident
ce qui est tenté, ce qui fait que le code à l'air un peu obèse.

'BioJava in Anger' est maintenu par Mark Schreiber. Si vous avez des
suggestions, questions ou commentaire, contacter la [liste de
courriel](mailto://biojava-l@biojava.org) de BioJava. Pour s'y abonner,
cliquer [ici](http://www.biojava.org/mailman/listinfo/biojava-l).

Traduction française: [Sylvain
Foisy](mailto://sylvain.foisyCHEZbioneq.qc.ca). Donc toute erreur est
mienne; contactez-moi pour correction. Encore mieux: participer au
concept Wiki et faites-les vous-mêmes!!

Présentation
------------

Une présentation en format Powerpoint de Mark décrivant Biojava se
trouve ici.

Publications utilisant BioJava
------------------------------

Pour obtenir la liste des articles contenus dans Google Scholar et
citant BioJava, cliquer
[ici](http://scholar.google.com/scholar?q=biojava&ie=UTF-8&oe=UTF-8&hl=en).

Comment faire pour ...?
-----------------------

### Installation

-   [Comment obtenir Java?](http://java.sun.com/downloads) N.B.: Cette
    page est exclusivement en anglais.
-   [Comment obtenir et installer
    BioJava?](http://biojava.open-bio.org/wiki/BioJava:GetStarted) N.B.:
    cette page est exclusivement en anglais.

### Alphabets et Symbols

-   [Comment obtenir un Alphabet d'ADN, d'ARN ou de
    protéine?](BioJava:CookbookFrench:Alphabets "wikilink")
-   [Comment faire un Alphabet sur mesure à partir de Symbols sur
    mesure?](BioJava:CookbookFrench:Alphabets:CustomAlphabets "wikilink")
-   [Comment faire un CrossProductAlphabet, par exemple, un Alphabet de
    codons?](BioJava:CookbookFrench:Alphabets:CrossProduct "wikilink")
-   [Comment décomposer les Symbols d'Alphabets CrossProductAlphabet en
    leurs Symbols
    constituants?](BioJava:CookbookFrench:Alphabets:Component "wikilink")
-   [Comment dire si deux Alphabets ou Symbols sont
    identiques?](BioJava:CookbookFrench:Alphabets:Canonical "wikilink")
-   [Comment faire pour créer un Symbol ambigüe comme Y ou
    R?](BioJava:CookbookFrench:Alphabets:Ambiguity "wikilink")

### Manipulation simples des séquences

-   [Comment créer une Sequence à partir d'une chaîne de caractères ou
    transformer un objet Sequence en chaîne de
    caractères?](BioJava:CookbookFrench:Sequence "wikilink")
-   [Comment obtenir une portion d'une
    Sequence?](BioJava:CookbookFrench:Sequence:SubSequence "wikilink")
-   [Comment transcrire une Sequence d'ADN en Sequence
    d'ARN?](BioJava:CookbookFrench:Sequence:Transcribe "wikilink")
-   [Comment obtenir la séquence complémentaire à une Sequence d'ADN ou
    d'ARN?](BioJava:CookbookFrench:Sequence:Reverse "wikilink")
-   [Les Sequences sont immuables alors comment faire pour en changer le
    nom?](BioJava:CookbookFrench:Sequence:ChangeName "wikilink")
-   [Comment éditer une Sequence ou un
    SymbolList?](BioJava:CookbookFrench:Sequence:Edit "wikilink")
-   [Comment utiliser une sequence comme expression régulière pour
    chercher des
    motifs?](BioJava:CookbookFrench:Sequence:Regex "wikilink")

### Traduction

-   [Comment traduire une Sequence ou une SymbolList d'ADN ou d'ARN en
    proteine?](BioJava:CookbookFrench:Translation "wikilink")
-   [Comment traduire une seul codon en son acide aminé
    correspondant?](BioJava:CookbookFrench:Translation:Single "wikilink")
-   [Comment utiliser un code génétique
    non-standard?](BioJava:CookbookFrench:Translation:NonStandard "wikilink")
-   [Comment traduire une Sequence dans ses 6 cadres de
    lectures?](BioJava:CookbookFrench:Translation:SixFrame "wikilink")

### Protéomique

-   [Comment calculer la masse et le pI d'un
    peptide?](BioJava:CookbookFrench:Proteomics "wikilink")
-   [Comment analyser les propriétés d'une séquence protéique en
    utilisant la base de données *Amino Acid
    Index*?](BioJava:CookbookFrench:Proteomics:AAindex "wikilink")

### Entrée/Sortie des objets Sequence

-   [Comment écrire des Sequences en format Fasta (ou tout autre
    format)?](BioJava:CookbookFrench:SeqIO:WriteInFasta "wikilink")
-   [Comment lire un fichier en format
    Fasta?](BioJava:CookbookFrench:SeqIO:ReadFasta "wikilink")
-   [Comment lire un fichier en format
    GenBank/EMBL/SwissProt?](BioJava:CookbookFrench:SeqIO:ReadGES "wikilink")
-   [Comment extraire les séquence en format GenBank/EMBL/Swissprot et
    les écrire en format
    Fasta?](BioJava:CookbookFrench:SeqIO:GBToFasta "wikilink")
-   [Comment transformer un fichier ABI en Sequence
    BioJava?](BioJava:CookbookFrench:SeqIO:ABItoSequence "wikilink")
-   [Comment fonctionne les entrées / sorties de fichiers de séquence
    avec Biojava?](BioJava:CookbookFrench:SeqIO:Echo "wikilink")

### Annotations

-   [Comment faire la liste des Annotations d'une
    Sequence?](BioJava:CookbookFrench:Annotations:List "wikilink")
-   [Comment filtrer une Sequence en se basant sur l'espèce (ou tout
    autre propriété d'une
    Annotation)?](BioJava:CookbookFrench:Annotations:Filter "wikilink")

### Positions et caractéristiques (*Features*)

-   [Comment faire pour spécifier une position ponctuelle
    (*PointLocation*)?](BioJava:CookbookFrench:Locations:Point "wikilink")
-   [Comment faire pour spécifier une position par intervalle
    (*RangeLocation*)?](BioJava:CookbookFrench:Locations:Range "wikilink")
-   [Comment fonctionne les
    CircularLocations?](BioJava:CookbookFrench:Locations:Circular "wikilink")
-   [Comment créer une caractéristique
    (*Feature*)?](BioJava:CookbookFrench:Locations:Feature "wikilink")
-   [Comment filtrer les *Features* par
    type?](BioJava:CookbookFrench:Locations:Filter "wikilink")
-   [Comment supprimer un
    *Feature*?](BioJava:CookbookFrench:Locations:Remove "wikilink")

### BLAST et FASTA

-   [Comment lire un fichier de résultats
    BLAST?](BioJava:CookbookFrench:Blast:Parser "wikilink")
-   [Comment lire un fichier de résultats
    FASTA?](BioJava:CookbookFrench:Fasta:Parser "wikilink")
-   [Comment extraire les informations à partir des résultats
    lus?](BioJava:CookbookFrench:Blast:Extract "wikilink")
-   [Comment extraire les infos d'un gros fichier ou comment créer son
    propre
    SearchContentHandler?](BioJava:CookbookFrench:Blast:Echo "wikilink")
-   Vous voulez plus d'info sur l'infrastructure de lecture SAX2 de
    Biojava? -- À venir --[Foisys](User:Foisys "wikilink") 21:19, 8
    February 2006 (EST)

### Comptes et Distributions

-   [Comment compter les résidus d'une
    Sequence?](BioJava:CookbookFrench:Count:Residues "wikilink")
-   [Comment faire pour calculer la fréquence d'un Symbol dans une
    Sequence?](BioJava:CookbookFrench:Count:Frequency "wikilink")
-   [Comment transformer un Count en
    Distribution?](BioJava:CookbookFrench:Count:ToDistrib "wikilink")
-   [Comment générer une séquence aléatoire à partir d'une
    Distribution?](BioJava:CookbookFrench:Distribution:RandomSeqs "wikilink")
-   Comment trouver la quantité d'information ou d'entropie d'une
    Distribution?
-   Comment savoir facilement si deux Distributions sont identiques?
-   Comment créer une OrderNDistribution avec un Alphabet sur mesure?
-   Comment écrire une Distribution en format XML?
-   Comment construire un échantilloneur de Gibbs à l'aide de
    Distributions?

### Matrices et Programmation Dynamique

-   Comment utiliser une WeightMatrix pour trouver un motif?
-   Comment créer un HMM semblable à un profile HMMER?
-   Comment créer un HMM sur mesure? (N. B.: en anglais seulement)
-   Comment faire un alignement de deux séquences?

### Interfaces Usagers Graphiques

-   Comment visualiser Annotations et Features sous la forme d'un arbre?
-   Comment afficher une Sequence dans un interface graphique?
-   Comment afficher les coordonnées d'une séquence?
-   Comment afficher les caractéristiques d'une séquence?

### Intégration avec des bases de données externes: OBDC / JDBC / BioSQL

-   Comment créer une base de données avec BioSQL et PostgreSQL (N. B.:
    en anglais seulement. Contribution de D. Huen)
-   Comment créer une base de données avec BioSQL et Oracle (N. B.: en
    anglais seulement. Contribution de R. Holland)
-   Comment ajouter, voir et ôter des objets Séquences d'une base de
    données BioSQL?

### Algorithmes génétiques

-   Comment écrire un algorithme génétique avec BioJava?

### Analyse structurale des protéines

-   Comment faire pour lire un fichier en format PDB?
-   Comment puis-je modifié un résidu?

### Alignements de séquences et prédiction de structures secondaires de protéines avec STRAP (par Christophe Gille)

-   Introduction à l'API de STRAP
-   Interactions STRAP / BioJava
-   Comment faire un alignement multiple de séquences?
-   Comment prédire la structure secondaire d'une protéine?

Désaveu de responsabilité
-------------------------

Ces codes sont généreusement offerts par des gens qui ont probablement
mieux à faire. Lorsque c'est possible, nous les avons testés mais des
erreurs ont pu s'y glisser. Par conséquent, les codes et conseils
retrouvés ici ne contiennent aucune garantie de quelque nature que ce
soit. Vous n'avez rien payé et si vous les utilisez, nous ne sommes pas
responsables si quelque chose tourne mal. Soyez un bon programmeur et
testez vous-même vos codes avant de les insérer dans votre banque de
données.

Copyright
---------

La documentation retrouvée sur ce site demeure la propriété des
personnes qui y ont contribué. Si vous désirez l'utiliser dans une
publication, prière d'en faire la demande via la [liste de
distribution](mailto://biojava-l@biojava.org) de BioJava. Les codes
contenus dans ce site sont [à licence
libre](http://fr.wikipedia.org/wiki/Open_Source) (open source). Une
bonne définition de la licence libre se trouve
[ici](http://www.opensource.org/docs/definition_plain.php). Si vous
acceptez ces conditions, vous pouvez utiliser les codes de ce site.

--[Foisys](User:Foisys "wikilink") 12:06, 6 February 2006 (EST)
