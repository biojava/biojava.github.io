---
title: BioJava:CookbookFrench:Fasta:Parser
---

Comment lire les résultats d'un fichier de sortie FASTA?
--------------------------------------------------------

La procédure pour lire les résultats FASTA est très similaire à celle
utiliser pour lire les résultats BLAST. En prenant la recette pour le
lecteur BLAST, remplacer la ligne suivante:

<java>XMLReader parser = new BlastLikeSAXParser();</java>

par

<java>XMLReader parser = new FastaSearchSAXParser();</java>

Vous avez maintenant un parser FASTA fonctionnel ;-)
