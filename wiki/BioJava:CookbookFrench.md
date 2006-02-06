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
mienne; contactez-moi pour correction.

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

`   * Comment obtenir Java? N.B.: Le fichier ne contient que le plus récent JRE, pas le JDK`  
`   * Comment obtenir et installer BioJava? N. B.: cette page est exclusivement en anglais`

### Alphabets et Symbols

`   * Comment obtenir un Alphabet d'ADN, d'ARN ou de protéine?`  
`   * Comment faire un Alphabet sur mesure à partir de Symbols sur mesure?`  
`   * Comment faire unCrossProductAlphabet, par exemple, un Alphabet de codons?`  
`   * Comment décomposer les Symbols d'Alphabets CrossProductAlphabet en leurs Symbols constituants?`  
`   * Comment dire si deux Alphabets ou Symbols sont identiques?`  
`   * Comment faire pour créer un Symbol ambigüe comme Y ou R?`

### Manipulation simples des séquences

`   * Comment créer une Sequence à partir d'une chaîne de caractères ou transformer un objet Sequence en chaîne de caractères?`  
`   * Comment obtenir une portion d'une Sequence?`  
`   * Comment transcrire une Sequence d'ADN en Sequence d'ARN?`  
`   * Comment obtenir la séquence complémentaire à une Sequence d'ADN ou d'ARN?`  
`   * Les Sequences sont immuables alors comment faire pour en changer le nom?`  
`   * Comment éditer une Sequence ou un SymbolList?`  
`   * Comment utiliser une sequence comme expression régulière pour chercher des motifs?`

### Protéomique

`   * Comment calculer la masse et le pI d'un peptide?`

### Traduction

`   * Comment traduire une Sequence ou une SymbolList d'ADN ou d'ARN en proteine?`  
`   * Comment traduire une seul codon en son acide aminé correspondant?`  
`   * Comment utiliser un code génétique non-standard?`  
`   * Comment traduire une Sequence dans ses 6 cadres de lectures?`

### Entrée/Sortie des objets Sequence

`   * Comment écrire des Sequences en format Fasta?`  
`   * Comment lire un fichier en format Fasta?`  
`   * Comment lire un fichier en format GenBank/EMBL/SwissProt?`  
`   * Comment extraire les séquence en format GenBank/EMBL/Swissprot et les écrire en format Fasta?`  
`   * Comment transformer un fichier ABI en Sequence BioJava?`  
`   * Comment fonctionne les entrées / sorties de fichiers de séquence avec Biojava?`

### Annotations

`   * Comment faire la liste des Annotations d'une Sequence?`  
`   * Comment filtrer une Sequence en se basant sur l'espèce (ou tout autre propriété d'une Annotation)?`

### Positions et caractéristiques (*Features*)

`   * Comment faire pour spécifier une PointLocation?`  
`   * Comment faire pour spécifier une RangeLocation?`  
`   * Comment fonctionne les CircularLocations?`  
`   * Comment créer une caractéristique (Feature)?`  
`   * Comment filtrer les Features par type?`  
`   * Comment supprimer un Feature?`

### BLAST et FASTA

`   * Comment lire un fichier de résultats BLAST?`  
`   * Comment lire un fichier de résultats FASTA?`  
`   * Comment extraire les informations à partir des résultats lus?`  
`   * Comment extraire les infos d'un gros fichier ou comment créer son propre`  
`     SearchContentHandler?`  
`   * Vous voulez plus d'info sur l'infrastructure de lecture SAX2 de Biojava?`

### Comptes et Distributions

`   * Comment compter les résidus d'une Sequence?`  
`   * Comment faire pour calculer la fréquence d'un Symbol dans une Sequence?`  
`   * Comment transformer un Count en Distribution?`  
`   * Comment générer une séquence aléatoire à partir d'une Distribution?`  
`   * Comment trouver la quantité d'information ou d'entropie d'une Distribution?`  
`   * Comment savoir facilement si deux Distributions sont identiques?`  
`   * Comment créer une OrderNDistribution avec un Alphabet sur mesure?`  
`   * Comment écrire une Distribution en format XML?`

### Matrices et Programmation Dynamique

`   * Comment utiliser une WeightMatrix pour trouver un motif?`  
`   * Comment créer un HMM semblable à un profile HMMER?`  
`   * Comment créer un HMM sur mesure? (N. B.: en anglais seulement)`  
`   * Comment faire un alignement de deux séquences?`

### Interfaces Usagers Graphiques

`   * Comment écrire un algorithme génétique avec BioJava?`

### Interfaces Usagers Graphiques

`   * Comment visualiser Annotations et Features sous la forme d'un arbre?`  
`   * Comment afficher une Sequence dans un interface graphique?`  
`   * Comment afficher les coordonnées d'une séquence?`  
`   * Comment afficher les caractéristiques d'une séquence?`

### Intégration avec des bases de données externes: OBDC

`   * Comment créer une base de données avec BioSQL et PostgreSQL (N. B.: en anglais seulement. Contribution de D. Huen)`  
`   * Comment créer une base de données avec BioSQL et Oracle (N. B.: en anglais seulement. Contribution de R. Holland)`  
`   * Comment ajouter, voir et ôter des objets Séquences d'une base de données BioSQL?`

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
publication, prière d'en faire la demande via la liste de distribution
de BioJava. Les codes contenus dans ce site sont à licence libre (open
source). Une bonne définition de la licence libre se trouve ici. Si vous
acceptez ces conditions, vous pouvez utiliser les codes de ce site.

--[Foisys](User:Foisys "wikilink") 12:06, 6 February 2006 (EST)
