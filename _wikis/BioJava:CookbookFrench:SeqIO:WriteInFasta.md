---
title: BioJava:CookbookFrench:SeqIO:WriteInFasta
---

Comment imprimer une Sequence en format Fasta?
----------------------------------------------

Le format FASTA est un format de sortie pas mal standard de la
bioinformatique et est facile à lire. BioJava possède une classe-outil,
appelée *SeqIOTools*, qui procure au programmeur des méthodes statiques
pour exécuter une variété de tâches d'entrée/sortie communes en
bio-informatique. Les morceaux de code qui suivent montrent comment
imprimer une *Sequence* ou un ensemble de séquences contenues dans un
objet de type *SequenceDB* en format FASTA vers un *OutputStream* tel
que System.out. Toutes les méthodes du type **writeFormatType**
retrouvées dans *SeqIOTools* prennent un *OutputStream* comme argument.
De cette façon, vous pouvez diriger la nouvelle séquence formattée vers
un fichier ou une autre méthode, ou STDOUT, STDERR etc. *SeqIOTools* se
trouve dans le package org.biojava.bio.seq.io

### Imprimer les séquences contenues dans un objet SequenceDB

<java> // créer une instance de l'interface SequenceDB SequenceDB db =
new HashSequenceDB();

// ajouter des séquences à la DB db.addSequence(seq1);
db.addSequence(seq2);

/\*

`* imprimer maintenant à un flux de sortie en format FASTA en utilisant la méthode`  
`* statique retrouvée dans la classe-utilitaire SeqIOTools. Ici, la sortie se fait sur`  
`* STDOUT`  
`*/`

SeqIOTools.writeFasta(System.out, db); </java>

### Imprimer à partir d'un objet SequenceIterator

Plusieurs des méthodes readXYZ() de SeqIOTools retournent un
SequenceIterator qui fait l'iteration de toutes les séquences d'un
fichier. La plupart des méthodes writeXXX() de SeqIOTools ont donc une
version qui prends un SequenceIterator comme argument.

<java> SequenceIterator iter = (SequenceIterator)
SeqIOTools.fileToBiojava(fileType,br);

// écrire le tout en FASTA, (n'importe quel OutputStream est valide, pas
juste System.out) SeqIOTools.writeFasta(System.out,iter); <java>

### Imprimer une seule Sequence

<java> /\* SeqIOTools a aussi une méthode qui prends une seule séquence

`* pour ne pas avoir à créer une SequenceDB`  
`*/`

SeqIOTools.writeFasta(System.out,iter); </java>
