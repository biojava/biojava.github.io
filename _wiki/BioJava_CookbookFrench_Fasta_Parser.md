---
title: BioJava:CookbookFrench:Fasta:Parser
permalink: wikis/BioJava%3ACookbookFrench%3AFasta%3AParser
---

Comment lire les résultats d'un fichier de sortie FASTA?
--------------------------------------------------------

La procédure pour lire les résultats FASTA est très similaire à celle
utiliser pour lire les résultats BLAST. En prenant la recette pour le
lecteur BLAST, remplacer la ligne suivante:

```javaXMLReader parser = new BlastLikeSAXParser();```

par

```javaXMLReader parser = new FastaSearchSAXParser();```

Vous avez maintenant un parser FASTA fonctionnel ;-)
