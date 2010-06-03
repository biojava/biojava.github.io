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

#### Resources

-   UniProt
    -   <http://www.uniprot.org/docs/ptmlist.txt>
    -   <http://www.uniprot.org/manual/mod_res>
    -   Paper: [Annotation of post-translational modifications in the
        Swiss-Prot knowledge
        base](http://www.ncbi.nlm.nih.gov/pubmed/15174124)
    -   Paper: [Annotation of glycoproteins in the SWISS-PROT
        database](http://www.ncbi.nlm.nih.gov/pubmed/11680872)
    -   Three types of PTM (FT): MOD\_RES, CROSSLNK, LIPID
    -   Contains DR records that point to other PTM databases (i.e.
        RESID)
-   RESID database
    -   <http://www.ebi.ac.uk/RESID/>
    -   <http://srs.ebi.ac.uk/srsbin/cgi-bin/wgetz>?-page+LibInfo+-id+2F9eD1VPLvp+-lib+RESID
    -   Paper: [The RESID Database of Protein Modifications as a
        resource and annotation
        tool](http://www.ncbi.nlm.nih.gov/pubmed/15174122)
    -   Has a link to a PDB file with PTM structure: Xref PDBHET
-   PSI-MOD
    -   <http://psidev.sourceforge.net/mod/>
    -   Paper: [The PSI-MOD community standard for representation of
        protein modification
        data](http://www.nature.com/nbt/journal/v26/n8/full/nbt0808-864.html)
-   ExPASy
    -   <http://ca.expasy.org/tools/findmod/findmod_masses.html>
-   Delta Mass
    -   <http://www.abrf.org/index.cfm/dm.home>
    -   Paper: [Proteomic analysis of post-translational
        modifications](http://www.ncbi.nlm.nih.gov/pubmed/12610572)
-   GlycoSciences
    -   <http://www.glycosciences.de/>
    -   <http://www.glycosciences.de/sweetdb/start.php?action=explore_linucsid&linucsid=22560&show=65#mass>
    -   <http://www.glycosciences.de/sweetdb/start.php?action=explore_linucsid&linucsid=297&show=4129#crosslinks>
    -   Paper: [Bioinformatics for glycomics: Status, methods,
        requirements and
        perspectives](http://bib.oxfordjournals.org/cgi/content/short/5/2/164)
    -   Paper: [pdb-care (PDB carbohydrate residue check): a program to
        support annotation of complex carbohydrate structures in PDB
        files](http://www.biomedcentral.com/1471-2105/5/69)
    -   Paper: [Data mining the protein data bank: automatic detection
        and assignment of carbohydrate
        structures](http://www.ncbi.nlm.nih.gov/pubmed/15010309)
-   [Glycobiology resources listed at
    NCI-Frederick](http://glycores.ncifcrf.gov/intr/index.html)
-   [Ted Baker: Erice 2008 talk on Isopeptide
    bonds](http://erice2008.docking.org/vcourse/04wed/1130-Baker/Ted%20Baker.pdf)

#### Procedure to get a list of PTMs

-   Retrieve the [Chemical Component
    Dictrionary](http://www.wwpdb.org/ccd.html)
-   Remove all obsolete or ambiguous chemical components by only keeping
    entries with
    -   \_chem\_comp.pdbx\_release\_status REL
    -   \_chem\_comp.pdbx\_ambiguous\_flag N
-   Create two subsets of the CCD
    -   A. All chemical components that are
        -   not the 20 standard amino acids and
        -   do not have a \_chem\_comp.mon\_nstd\_parent\_comp\_id field
            corresponding to one of the 20 standard amino acids.
    -   B. All chemical components that have a
        \_chem\_comp.mon\_nstd\_parent\_comp\_id field corresponding to
        one of the 20 standard amino acids.
-   For case 1 (attachments), match the RESID NameXref PDBHET ID with
    chemical component set A to get [a list of attachment
    groups](http://spreadsheets1.google.com/ccc?key=tCBmM83dURWTKEwM34MwRsg&hl=en).
-   For case 2 (modified amino acids), match the RESID NameXref PDBHET
    ID with set B to get [a list of modified amino acids that are
    PTMs](http://spreadsheets1.google.com/ccc?key=tmS1y7VhfTIIrapme6kSUug&hl=en).
-   [A initial list of
    PTMs](http://spreadsheets0.google.com/ccc?key=tCC48SYpb9v0ehoel6PlnZg&hl=en)
    were then manually selected.

### Task2. Defining data representation of PTMs

-   [An XML
    file](https://docs.google.com/leaf?id=0B6z8AlO4d-qMMzEwMjUyM2YtODM4Yy00ZmJlLWE0YmMtYzdiYWNjZmFmYjFj&hl=en)
    is used to store the information of PTMs.

<!-- -->

-   A Java class *ProteinModification* to store different types of PTMs.

<!-- -->

-   Two ways to representing modified residues.

<!-- -->

-   -   One way:

<java> public interface PTM {

`   public PTMType getType();`  
`   public org.biojava.bio.structure.AminoAcid getModifiedAminoAcid();`

}

// case 2 implementation public class PTMImpl {...}

// case 1 interface public interface AttachedPTM extends PTM {

`   // return the attached group, e.g. a glycan.`  
`   public org.biojava.bio.structure.Group getAttachedGroup();`  
  
`   // return the attachment atom on the modified amino acid.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAminoAcid();`  
  
`   // return the attachment atom on the attached group.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAttachedGroup();`  
  
`   // return the distance between the two attachment atoms.`  
`   public double getDistance();`

} </java>

-   -   Alternative way:

<java> public class ModifiedAminoAcid extends
org.biojava.bio.structure.AminoAcid {

`   public PTMType getType() {...}`

}

public class ModifiedAminoAcidByAttachment extends ModifiedAminoAcid {

`   // return the attached group, e.g. a glycan.`  
`   public org.biojava.bio.structure.Group getAttachedGroup() {...}`  
  
`   // return the attachment atom on the modified amino acid.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAminoAcid() {...}`  
  
`   // return the attachment atom on the attached group.`  
`   public org.biojava.bio.structure.Atom getAttachmentAtomOnAttachedGroup() {...}`  
  
`   // return the distance between the two attachment atoms.`  
`   public double getDistance() {...}`

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
-   05/26-06/02: Task 2-Defining data representation of PTMs.
-   06/03-06/09: Task 3-Reading and parsing 3D protein structure files
    (.pdb or .cif).
-   06/10-06/23: Task 4-Identifying PTMs in 3D protein structures.
-   06/24-06/25: Task 5-Representing PTMs in text.
-   06/26-07/30: Task 6.1-Refactor sequence diagram code from PDB.
-   07/31-08/06: Task 6.2-Annotating PTMs on sequence diagram view.
-   08/07-08/16: Task 7-Generating 2D tree images of glycan structures.

Weekly Report
-------------

-   05/31/2010
    -   A initial list of case 1 and case 2 PTMs has be identified.
    -   An XML format to store the information of PTMs has been defined.
    -   Java classes representing the PTMs have been committed to the
        code repository.

Comments
--------

*Please add comments here...*

-   Peter Rose (04/30): It's an ever increasing list of PTMs. So instead
    of hardcoding PTMs, it would be better to load them from a file,
    i.e. xml.

