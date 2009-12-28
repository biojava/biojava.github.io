---
title: BioJava:CookbookFrench:PDB:Read
---

### Comment faire pour lire un fichier de type PDB?

La [*Protein Data Bank*](http://www.pdb.org) est la principale source de
données struturales disponible sur l'Internet. Contrairement aux
fichiers de type GenBank ou EMBL qui contiennent des donnés de séquence,
les fichiers PDB contiennent plutôt des données de position d'atomes au
sein d'une structure 3D.

BioJava contient un modèle flexible permettant la gestion des données de
structure contenues dans un fichier PDB. Les exemples ci-dessous
montrent comment:

-   créer et manipuler une repertoire PDB local ou
-   faire la lecture d'un fichier PDB à partir d'un système de fichiers
    local.

Les fonctionnalités de base de cette capacité sont retrouvés dans la
classe
[PDBFileReader](http://www.biojava.org/docs/api/index.html?org/biojava/bio/structure/io/PDBFileReader.html).

Exemple bref: la manière rapide de lire un fichier local
--------------------------------------------------------

<java>

`// fonctionne egalement sur le fichiers compressés en gzip`  
`String filename =  "path/to/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`

`try{`

`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`} catch (Exception e){`  
`    e.printStackTrace();`  
`}`

</java>

Exemple: Utilisation d'une installation locale de PDB
-----------------------------------------------------

<java>

`   try {`  
`       PDBFileReader reader = new PDBFileReader();`

`       // Le chemin vers l'installation PDB locale`  
`       reader.setPath("/tmp");`  
`           `  
`       // Est-ce que tous les fichiers sont sous un seul répertoireare `  
`               // ou sont-ils divisés comme sur les serveurs FTP de PDB?`  
`       reader.setPdbDirectorySplit(true);`  
`           `  
`       // Faut-il aller récupérer un fichier PDB manquant `  
`               // automatiquement via FTP?`  
`       reader.setAutoFetch(true);`  
`           `  
`       // Devons nous aligner les residues ATOM et SEQRES`  
`       // a la creation du modele interne?`  
`               reader.setAlignSeqRes(false);`  
`           `  
`       // Devons-nous lire les infos de structure secondaire`  
`               // incluses dans le fichier?`  
`       reader.setParseSecStruc(false);`  
`           `  
`       Structure structure = reader.getStructureById("4hhb");`  
`           `  
`       System.out.println(structure);`  
`           `  
`   } catch (Exception e){`  
`       e.printStackTrace();`  
`   }`

</java>

L'exemple ci-dessus produira la sortie suivante:

    Fetching ftp://ftp.wwpdb.org/pub/pdb/data/structures/all/pdb/pdb4hhb.ent.gz
    writing to /tmp/hh/pdb4hhb.ent.gz
    structure  4HHB Authors: G.FERMI,M.F.PERUTZ Resolution: 1.74 Technique: X-RAY DIFFRACTION  Classification: OXYGEN TRANSPORT DepDate: Wed Mar 07 00:00:00 PST 1984 IdCode: 4HHB Title: THE CRYSTAL STRUCTURE OF HUMAN DEOXYHAEMOGLOBIN AT 1.74 ANGSTROMS RESOLUTION ModDate: Tue Feb 24 00:00:00 PST 2009 
     chains:
    chain 0: >A< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 0 length ATOM: 198 aminos: 141 hetatms: 57 nucleotides: 0
    chain 1: >B< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 0 length ATOM: 205 aminos: 146 hetatms: 59 nucleotides: 0
    chain 2: >C< HEMOGLOBIN (DEOXY) (ALPHA CHAIN)
     length SEQRES: 0 length ATOM: 201 aminos: 141 hetatms: 60 nucleotides: 0
    chain 3: >D< HEMOGLOBIN (DEOXY) (BETA CHAIN)
     length SEQRES: 0 length ATOM: 197 aminos: 146 hetatms: 51 nucleotides: 0
    DBRefs: 4
    DBREF  4HHB A    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB B    1   146  UNP    P68871   HBB_HUMAN        1    146
    DBREF  4HHB C    1   141  UNP    P69905   HBA_HUMAN        1    141
    DBREF  4HHB D    1   146  UNP    P68871   HBB_HUMAN        1    146
    Molecules: 
    Compound: 1 HEMOGLOBIN (DEOXY) (ALPHA CHAIN) Chains: ChainId: A C Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 
    Compound: 2 HEMOGLOBIN (DEOXY) (BETA CHAIN) Chains: ChainId: B D Engineered: YES OrganismScientific: HOMO SAPIENS OrganismTaxId: 9606 OrganismCommon: HUMAN 

Exemple: Lecture d'un fichier local en format PDB
-------------------------------------------------

L'exemple suivant permet le lecture d'un fichier PDB à partir de votre
système de fichiers, la création d'un objet
[Structure](http://www.biojava.org/docs/api/org/biojava/bio/structure/Structure.html)
et faire l'itération sur les objets
[Groups](http://www.biojava.org/docs/api/org/biojava/bio/structure/Group.html)
qui sont contenu dans ce fichier. Pour les exemples d'accession aux
objets
[Atoms](http://www.biojava.org/docs/api/org/biojava/bio/structure/Atom.html),
voir <BioJava:CookbookFrench:PDB:Atom>. Pour plus d'informations sur la
gestion des informations SEQRES et ATOM, voir
<BioJava:CookbookFrench:PDB:Seqres>.

<java>

`// fonctionne egalement avec les fichiers`  
`// compresses par zip`  
`String filename =  "parcours/vers/pdbfile.ent" ;`  
  
`PDBFileReader pdbreader = new PDBFileReader();`  
  
`// optionel: le lecteur peut aussi lire les structure secondaires `  
`// tel que decrites dans l'en-tet du fichier PDB pour les ajouter`  
`// aux acides amines`  
`pdbread.setParseSecStruc(true);     `  
  
`try{`  
`    Structure struc = pdbreader.getStructure(filename);`  
`    `  
`    System.out.println(struc);`  
  
`    GroupIterator gi = new GroupIterator(struc);`  
  
`    while (gi.hasNext()){`  
  
`          Group g = (Group) gi.next();`  
`         `  
`          if ( g instanceof AminoAcid ){`  
`              AminoAcid aa = (AminoAcid)g;`  
`              Map sec = aa.getSecStruc();`  
`              Chain  c = g.getParent();`  
`              System.out.println(c.getName() + " " + g + " " + sec);`  
`          }                `  
`    }`  
  
`} catch (Exception e) {`  
`    e.printStackTrace();`  
`}`

</java>
