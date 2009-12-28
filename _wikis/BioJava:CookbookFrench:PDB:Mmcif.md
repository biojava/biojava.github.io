---
title: BioJava:CookbookFrench:PDB:Mmcif
---

### Comment lire un fichier en format MMCIF?

[MMCIF](http://ndbserver.rutgers.edu/mmcif/index.html) est une
alternative à PDB comme format de description des données structurales(
[1](#westbrook2000 "wikilink"),[2](#westbrook2003 "wikilink") ). Comme
il n'est pas trivial d'écrire un logiciel de lecture pour ce format,
BioJava contient les outils essentiels pour ce faire. Les fichiers en
format MMCIF sont lus afin de créer le même type d'objets Structure crée
à la suite de la lecture de [fichiers en format
PDB](BioJava:CookbookFrench:PDB:Read "wikilink").

L'exemple ci-dessous fait la démonstration de la lecture des données
afin de créer un objet correpondant au modèle de données structurales
implémenté dans BioJava. Le code source vous permet même de créer votre
propre modèle de données mais il vous faudra implémenter [l'interface
MMcifConsumer](http://www.spice-3d.org/public-files/javadoc/biojava/org/biojava/bio/structure/io/mmcif/MMcifConsumer.html).

<java> @A venir dans BioJava 1.7 mais disponible via SVN public static
void main(String[] args){

`       String fileName = args[0];`  
`       `  
`       InputStream inStream =  new FileInputStream(fileName);`  
`       `  
`       MMcifParser parser = new SimpleMMcifParser();`

`       SimpleMMcifConsumer consumer = new SimpleMMcifConsumer();`

`       // L'objet Consumer construit l'objet selon le modele`  
`               // de structure de BioJava.`  
`               // C'est ici que vous pourriez appeler votre propre modele.          `  
`       parser.addMMcifConsumer(consumer);`

`       try {`  
`           parser.parse(new BufferedReader(new InputStreamReader(inStream)));`  
`       } catch (IOException e){`  
`           e.printStackTrace();`  
`       }`

`               // A vous la structure`  
`       Structure cifStructure = consumer.getStructure();`  
`                     `

}

</java>

Pour plus d'information sur le modèle de données structurale de BioJava,
jetez un coup d'oeil [ici](BioJava:CookbookFrench:PDB:Atom "wikilink").

Bibliographie
-------------

<biblio>

1.  westbrook2000 pmid=10842738
2.  westbrook2003 pmid=12647386

</biblio>
