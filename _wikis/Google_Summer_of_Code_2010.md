---
title: Google Summer of Code 2010
---

Introduction
------------

The Open Bioinformatics foundation is [applying to participate in the
Google Summer of
Code](http://www.open-bio.org/wiki/Google_Summer_of_Code).

We are accepting applicants for projects for BioJava. If you want to
propose a project, have a look at the <BioJava:Modules> page, for areas
which are currently under development.

Please read the [GSoC page at the Open Bioinformatics
Foundation](http://www.open-bio.org/wiki/Google_Summer_of_Code) and the
[main Google Summer of Code page](http://code.google.com/soc) for more
details about the program.

Mentors
-------

-   [ Andreas Prlic](Andreas_Prlic "wikilink") - 1 student

<!-- -->

-   [ Peter Rose](Peter_Rose "wikilink") - 1 student

Projects
--------

BioJava offers the following Google Summer of Code projects:

All-Java Multiple Sequence Alignment (MSA)  
Develop an all-Java implementation of a multiple sequence alignment
algorithm.

<!-- -->

Rationale : Multiple sequence alignment is a frequently performed task in sequence analysis with the goal to identify new members of protein families and infer phylogenetic relationships between proteins and genes. At the present there is no Java-only implementation for this algorithm. As such the number of already existing and Java related BioInformatics tools and web sites would benefit from this implementation and sequence analysis could be more easily performed by the end-user. BioJava at the present already contains implementations for pairwise alignments and tools to create phylogenetic trees. This project will combine these tools in order to create a new implementation for this problem.  

<!-- -->

Approach : The multiple sequence alignment algorithm will consist of 3 steps:  

:\# Pairwise sequence alignments of all sequences will be calculated.
BioJava already contains code for this. This code needs to be updated to
be compliant with the new BioJava 3.

:\# The results of the pairwise alignments are used to build up a
distance matrix. This matrix is used to construct a tree using the
Neighbor Joining Algorithm.

:\# Apply a strategy similar to CLUSTALW to progressively build up the
multiple alignment. Align closer related sequences first and extend the
alignments to incorporate more distantly related sequences. Apply
sequence weighting to correct for closely related sequences and apply
residue specific gap penalties.

Challenges : Requires to join a number of existing tools into a unique solution. A successful student will have prior experience in software development in Java and will have to learn and modify various tools already provided through BioJava. Step 3 contains probably most risk. As such a first implementation will be based on a straightforward approach for building up the MSA progressively. If there is more time left during the project, more advanced rules can get implemented.  

<!-- -->

Involved toolkits or projects : Core, Alignment and Phylogeny modules of BioJava3  

<!-- -->

Degree of difficulty and needed skills : Difficult. Interested students should have a general knowledge of alignment algorithms and experience in Java-based software development.  

<!-- -->

Mentor: **[ Andreas Prlic](Andreas_Prlic "wikilink")**  

------------------------------------------------------------------------

Identification and Classification of Posttranslational Modification of Proteins  
Develop a Postranslational Modification package for the BioJava project.

<!-- -->

Rationale : Posttranslational modifications (PTM) [1](http://en.wikipedia.org/wiki/Posttranslational_modification) are modifications to proteins after protein biosynthesis that modulate protein function. These PTMs are present in the 3D structures of the Protein Data Bank. A frequently asked question is to query or classify proteins by their PTMs. The goal of this project is to develop a BioJava package that first identifies these modifications and then classifies them by the type of PTM. Controlled vocabulary will be used to uniquely annotate PTMs. For glycosylated proteins, the linkage patters will be established and presented as linear text or 2D graphical representations using the guidelines from the Consortium for Functional Glyconomics [2](http://www.functionalglycomics.org/static/consortium/Nomenclature.shtml).  

<!-- -->

Approach : The PTM identification and classification will include the following steps:  

:\# A list of known PTMs will be established. Then code will be
developed to locate these PTMs in a 3D protein structures.

:\# The protein link residues for the PTM will be determined based on
distance ranges.

:\# The link pattern for glycans will be defined by the connectivity of
the sugar molecules in the 3D protein structure.

:\# The results will be presented as text in a linear notation and 2D
graphical representations if time permits.

Challenges : A successful student will have prior experience in software development in Java and will have to learn and modify various tools already provided through BioJava. New algorithms will be added to BioJava to support this project.  

<!-- -->

Involved toolkits or projects : BioJava3, Eclipse IDE  

<!-- -->

Degree of difficulty and needed skills : Difficult. Interested students should have a general knowledge of alignment algorithms and experience in Java-based software development.  

<!-- -->

Mentor: **[ Peter Rose](Peter_Rose "wikilink")**  


