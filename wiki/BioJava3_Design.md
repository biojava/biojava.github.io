---
title: BioJava3 Design
---

References
----------

This document was based on comments made on the following pages:

-   <http://biojava.org/wiki/BioJava3_Proposal>
-   <http://biojava.org/wiki/Talk:BioJava3_Proposal>
-   <http://biojava.org/wiki/UsageAnalysis>
-   <http://www.derkholm.net/svn/repos/bjv2/website/docs/index.html>

Basic principles
----------------

-   BioJava3 (BJ3) will freely incorporate features from Java 6.
-   Maven will be used to build the project.
-   Full unit testing for every aspect from the ground up using JUnit.
-   Modular design without any cyclic dependencies, with separate JARs
    for key components (IO, databases, genetic algorithms, sequence
    manipulation, etc.)
-   Separation of APIs from implementation code by means of packages.
-   Base package name: org.biojava3 (to prevent clashes with org.biojava
    and org.biojavax, both of which will have backwards-compatibility
    extensions to BJ3 in order to make old code reusable).
-   Use of JavaBeans concepts wherever possible, e.g. getters/setters.
    This would enhance Java EE compliance and improve integration into
    larger things.
-   Fully commented code in LOTS of detail INCLUDING package-level docs
    AND wiki-docs such as the cookbook.
-   Use of annotations for things like database mappings.
-   A consistent coding style to be developed and applied.
-   No Swing code to be included, but graphics code is OK for obviously
    useful things such as protein structures or sequence traces. Swing
    code is impossible to write in a way that will integrate fully with
    each different individual's own program requirements.

Compromises and Unfinished bits
-------------------------------

-   TestNG was suggested instead of JUnit, but knowledge of this tool is
    not so widespread and this may impact on quality of testing.
-   A tool for analysing comment coverage and coding style was
    suggested, but none have been identified. Please amend this document
    with the names of any good ones you know.

Priorities
----------

Andreas' very useful Usage Analysis page shows the most frequently
requested documentation. In the absence of any real usage statistics, we
must assume that the things people most often want to read about are the
things that people most often use. (It could also be said that the
things that people most read about are the things that work least well
in the present code... but we shall ignore that for now...).

Here are the priorities based on Andreas' work:

-   How to get an Alphabet
-   How to make a Sequence Object from a String or make a Sequence
    Object back into a String
-   How to parse a Blast output
-   How to read sequences from a Fasta file
-   How to read a GenBank, SwissProt or EMBL file
-   How to generate a global or local alignment with the
    Needleman-Wunsch- or the Smith-Waterman-algorithm
-   How to read a protein structure - PDB file
-   How to export a sequence to fasta
-   How to view a sequence in a gui
-   How to parse a Fasta database search output file

These can be broken down into the following modules:

-   Plain sequence \<-\> Enriched sequence
-   Sequence similarity -\> Sequence similarity IO (Blast, Fasta, etc.)
-   Plain sequence -\> Plain sequence IO (Genbank, FASTA, etc.)
-   Enriched sequence -\> Sequence alignments
-   Enriched sequence -\> Protein structures

