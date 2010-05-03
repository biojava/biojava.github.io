---
title: GSoC:PTM
---

**BioJava Packages for Identification, Classification, and Visualization
of Posttranslational Modification of Proteins**

-   Student: [Jianjiong Gao](Jianjiong Gao "wikilink")
-   Mentor: [Peter Rose](http://www.linkedin.com/in/peterrose)
-   Co-menter: [Andreas Prlic](Andreas Prlic "wikilink")

The original proposal is
[here](http://docs.google.com/fileview?id=0B6z8AlO4d-qMMzAzZWFmYzQtMWRlNy00Y2Y2LThmZjktNjFhYzNlOTg3ZDEz&hl=en)

Background
----------

[Posttranslational modifications
(PTM)](http://en.wikipedia.org/wiki/Posttranslational_modification) are
modifications to proteins after protein biosynthesis, which play a key
role in many cellular processes such as cellular differentiation,
protein degradation, signaling and regulatory processes, regulation of
gene expression, and protein-protein interactions. PTMs are present in
the 3D structures in the [Protein Data Bank](http://www.pdb.org/). It is
of vast interst to query and classify proteins by their PTMs. PTMs can
be classified in multiple ways. From an implementation perspective we
need to distinguish 3 major cases:

-   Case 1: Attachment of a chemical group (i.e. glycan)
-   Case 2: Chemical modification of an amino acid (i.e. hydroxyproline)
-   Case 3: Cross-linking (i.e. disulfide bonds, iso-peptide bonds)

Major Project Contributions
---------------------------

The goal of this project is to develop BioJava packages that identify,
classify and visualize PTMs. Major deliverables of this project include:

-   A BioJava package to identify PTMs in a 3D protein structure (.pdb
    or .cif file).
-   A BioJava package to generate sequence diagrams with an option to
    add PTM annotations.
-   A BioJava package to generate 2D tree images of carbohydrate
    (glycan) structures.

Immediate applications of this project would be on Protein Data Bank
website:

-   Making PTMs searchable on PDB.
-   Updating the sequence diagram on PDB with an option to display PTM
    annotations.
-   Listing PTMs in PDB ProteinWorkshop.

This project will be beneficial to the research community by
facilitating structural analysis on PTMs and hence reinforcing our
understanding on the mechanisms of various PTMs.

Tasks and Implementation
------------------------

### Task1. Making a list of PTM types

-   UniProt maintains such a list:
    <http://www.uniprot.org/keywords/9991>.
-   A list of PTMs will be selected in the first stage.
    -   Glycosylation
    -   Phosphorylation
    -   Methylation
    -   Dimethylation
    -   Sulfation
    -   Ubiquitination
    -   Acetylation
    -   Palmitoylation
    -   SUMOylation
    -   Decarboxylation
    -   Hydroxyproline
    -   etc...
-   More PTMs will be supported later.

### Task2. Defining data representation of PTMs

<java> public interface PTM {

`   // return the modified amino acid.`  
`   public org.biojava.bio.structure.AminoAcid getModifiedAminoAcid ();`

} </java>

<java> public abstract class AbstractPTM implements PTM {

`   private org.biojava.bio.structure.AminoAcid aminoAcid;`

`   public AbstractPTM(org.biojava.bio.structure.AminoAcid modifiedAminoAcid) {`  
`       this.aminoAcid = modifiedAminoAcid;`  
`   }`

`   // return the modified amino acid.`  
`   public org.biojava.bio.structure.AminoAcid getModifiedAminoAcid () {`  
`       return aminoAcid;`  
`   }`

} </java>

<java> public class Hydroxyproline extends AbstractPTM {

`   public Hydroxyproline(org.biojava.bio.structure.AminoAcid modifiedAminoAcid) {`  
`       super(modifiedAminoAcid);`  
`   }`

} </java>

<java> public interface AttachedPTM extends PTM {

`   // return the attached group, e.g. a glycan.`  
`   public `<G extends org.biojava.bio.structure.Group>` G getAttachedGroup();`

`   // return the attachment atom on the modified amino acid.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAminoAcid();`

`   // return the attachment atom on the attached group.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAttachedGroup();`

`   // return the distance between the two attachment atoms.`  
`   public double getDistance();`

} </java>

<java> public abstract class AbstractAttachedPTM extends AbstractPTM
implements AttachedPTM {

`   private org.biojava.bio.structure.Group attachedGroup;`  
`   private org.biojava.bio.structure.Atom atomOnAminoAcid;`  
`   private org.biojava.bio.structure.Atom atomOnAttachedGroup;`

`   public AbstractAttachedPTM(`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid,`  
`           org.biojava.bio.structure.Group attachedGroup,`  
`           org.biojava.bio.structure.Atom atomOnAminoAcid,`  
`           org.biojava.bio.structure.Atom atomOnAttachedGroup`  
`           ) {`  
`       super(modifiedAminoAcid);`  
`       this.attachedGroup = attachedGroup;`  
`       this.atomOnAminoAcid = atomOnAminoAcid;`  
`       this.atomOnAttachedGroup = atomOnAttachedGroup;`  
`   }`

`   // return the attached group, e.g. a glycan.`  
`   public org.biojava.bio.structure.Group getAttachedGroup() {`  
`       return attachedGroup;`  
`   }`

`   // return the attachment atom on the modified amino acid.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAminoAcid() {`  
`       return atomOnAminoAcid;`  
`   }`

`   // return the attachment atom on the attached group.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAttachedGroup() {`  
`       return atomOnAttachedGroup;`  
`   }`

`   // return the distance between the two attachment atoms.`  
`   public double getDistance() {`  
`       // calculate the distance`  
`       return 0.0;`  
`   }`

} </java>

<java> public class Glycosylation extends AbstractAttachedPTM {

`   public Glycosylation(`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid,`  
`           org.biojava.bio.structure.Group attachedGroup,`  
`           org.biojava.bio.structure.Atom atomOnAminoAcid,`  
`           org.biojava.bio.structure.Atom atomOnAttachedGroup`  
`           ) {`  
`       super(modifiedAminoAcid, attachedGroup, atomOnAminoAcid, atomOnAttachedGroup);`  
`   }`

} </java>

<java> public abstract class AbstractCrossLink extends
AbstractAttachedPTM {

`   public AbstractCrossLink(`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid1,`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid2,`  
`           org.biojava.bio.structure.Atom atomOnAminoAcid,`  
`           org.biojava.bio.structure.Atom atomOnAttachedGroup`  
`           ) {`  
`       super(modifiedAminoAcid1, modifiedAminoAcid1, atomOnAminoAcid, atomOnAttachedGroup);`  
`   }`

`   // return the attached group, e.g. a glycan.`  
`   public org.biojava.bio.structure.AminoAcid getAttachedGroup() {`  
`       return (org.biojava.bio.structure.AminoAcid)super.getAttachedGroup();`  
`   }`

} </java>

<java> public abstract class DisulfideBond extends AbstractCrossLink {

`   public DisulfideBond(`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid1,`  
`           org.biojava.bio.structure.AminoAcid modifiedAminoAcid2,`  
`           org.biojava.bio.structure.Atom atomOnAminoAcid,`  
`           org.biojava.bio.structure.Atom atomOnAttachedGroup`  
`           ) {`  
`       super(modifiedAminoAcid1, modifiedAminoAcid1, atomOnAminoAcid, atomOnAttachedGroup);`  
`   }`

} </java>

### Task3. Reading and parsing 3D protein structure files (.pdb or .cif)

-   Utilizing org.biojava.bio.structure
    (http://www.biojava.org/wiki/BioJava:CookBook:PDB:read).
-   The code will be based on BioJava 3.

### Task4. Identifying PTMs in 3D protein structures

-   For case 1, finding the attachment points for PTMs.
    -   Reading modifications in HETATM.
    -   Scanning possible atoms on possible amino acids to locating
        attachment point of each PTM by checking if the distance between
        an amino acid atom and the PTM is less than a threshold.
        -   The threshold will be the sum of the covalent bond length
            (i.e. the sum of [covalent
            radiuses](http://en.wikipedia.org/wiki/Covalent_radius) of
            both atoms) plus a tolerance of error, say 0.4 Angstrom
            (this need to be decided later after analyzing the data).
        -   For different types of PTMs, only limited types of amino
            acids and atoms can be attached to. Thus, only those atoms
            need to be scanned.
        -   If multiple atoms in multiple amino acids are within the
            distance threshold to the PTM, choose the one with the
            shortest distance.
-   For case 2, finding the modified amino acids.
    -   Finding the corresponding 3-letter code of each PTM type in
        [Chemical Component Dictrionary](http://www.wwpdb.org/ccd.html).
        -   If \_chem\_comp.mon\_nstd\_parent\_comp\_id field
            corresponds one of the 20 standard amino acids, then it is a
            modified amino acid.
        -   3-letter code is contained in the \_chem\_comp.id field.
    -   Identifying PTMs by parsing through the residues in the protein
        chain using the 3-letter code.
-   For case 3, finding cross-linked amino acids.
    -   Identifying cross-linked amino acids by looking for short
        distances between amino acid pairs in a similar way as case 1.
        -   [Disulfide
            bonds](http://en.wikipedia.org/wiki/Disulfide_bond)
        -   [Iso-peptide
            bonds](http://en.wikipedia.org/wiki/Isopeptide_bond)
-   For both case 1 and 3, filtering out the close contacts that have
    nothing to do with PTMs.
    -   The filtering strategy will be developed after analyzing the
        data.

### Task5. Representing PTMs in text

-   For case 1: Attached PTM
    -   Two atoms that link between the amino acid and the attachment
        -   3-letter code
        -   Chain id
        -   Residue number
        -   Atom name
        -   Distance between the two atoms
        -   Example:
            -   ASN A 173 ND2
            -   NAG A 651 C1
            -   1.45 A
    -   Two atoms that link between additional chemical components
        -   3-letter code
        -   Chain id
        -   Residue number
        -   Atom name
        -   Distance between the two atoms
        -   Example:
            -   NAG A 651 O4
            -   NAG A 652 C1
            -   1.43 A
-   For case 2: modified amino acid
    -   3-letter code
    -   Chain id
    -   Residue number
    -   Example:
        -   HYP A 123
-   For case 3: cross-link
    -   3-letter code
    -   Chain id
    -   Residue number
    -   Insertion code
    -   Atom name
    -   Distance
    -   Example
        -   LYS A 36 NZ
        -   ASN A 168 CG
        -   1.5 A

### Task6. Annotating PTMs on sequence diagram view

-   Refactoring the Java classes that are being used in PDB to diaplay
    the sequence diagram into stand-alone Java classes and make it
    available in BioJava.
    -   In the sequence diagram of an entry in PDB (e.g. 3M6S), a user
        can select information/annotations (e.g. Pfam domain, InterPro
        domain, etc) of one's interest.
    -   When refactoring, a key issue is to keep the flexibility to add
        new annotations, such as PTM annotation.
-   Extending the diagram with an option to display PTMs in the
    structure.
    -   For attached PTMs (case 1) and modified amino acids (case 2),
        place triangles and abbreviations over the residue.
        -   Whether to display the PTM annotation is an option to the
            users, just like other annotations.
        -   Different colors of the triangles and texts could be used to
            distinguish case 1 and case 2 PTMs.
-   For cross-link, linking the two residues with a dotted line.
    -   Currently in PDB, disulfide bonds is displayed without an
        option.
    -   A better way will be leaving the cross-links as an optional
        annotation to users.
        -   Different types of cross-links (say disulfide bond and
            iso-peptide bond) will have separate options.
        -   Different line color or style (dotted, dashed, etc) could be
            used to represent different cross-link types.
-   Adding another option on the sequence diagram to display PTMs
    annotations from UniProt (or other sources).
    -   UniProt/Swiss-Prot contains tens of thousands of PTM
        annotations, which can be displayed in the sequence diagram.
    -   The UniPort XML file (e.g.,
        <http://www.uniprot.org/uniprot/P56524.xml>) can be utilized.
    -   Some code I have written in Musite could be refactored and used
        here.

### Task7. Generating 2D tree images of glycan structures

-   Generating images to present the linkage patterns of glycan using
    the guideline from the [Consortium for Functional
    Glyconomics](http://www.functionalglycomics.org/static/consortium/Nomenclature.shtml).

Timeline
--------

-   05/24-05/25: Task 1-Making a list of PTM types.
-   05/26-06/01: Task 2-Defining data representation of PTMs.
-   06/03-06/08: Task 3-Reading and parsing 3D protein structure files
    (.pdb or .cif).
-   06/10-06/22: Task 4-Identifying PTMs in 3D protein structures.
-   06/24-06/25: Task 5-Representing PTMs in text.
-   06/26-07/30: Task 6.1-Refactor sequence diagram code from PDB.
-   07/31-08/06: Task 6.2-Annotating PTMs on sequence diagram view.
-   08/07-08/16: Task 7-Generating 2D tree images of glycan structures.

Comments
--------

*Please add comments here...*

-   Peter Rose (04/30): It's an ever increasing list of PTMs. So instead
    of hardcoding PTMs, it would be better to load them from a file,
    i.e. xml.

