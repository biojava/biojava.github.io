---
title: BioJava 3 Use Cases
---

This page will contain a bunch of
[use-cases](http://en.wikipedia.org/wiki/Use_case) which will drive
development for BioJava 3. Please add them below - as simple or as
complex as you wish!

Use case template
=================

Copied from the use case template found in [Wikipedia use case
article](http://en.wikipedia.org/wiki/Use_case)

-   '''Use case name '''
-   '''Version '''
-   '''Goal '''
-   '''Summary '''
-   '''Actors '''
-   '''Preconditions '''
-   '''Triggers '''
-   '''Basic course of events '''
-   '''Alternative paths '''
-   '''Postconditions '''
-   '''Business rules '''
-   '''Notes '''
-   '''Author and date '''

*A use case should:*

-   Describe what the system shall do for the actor to achieve a
    particular goal.
-   Include no implementation-specific language.
-   Be at the appropriate level of detail.
-   Not include detail regarding user interfaces and screens. This is
    done in user-interface design.

Use cases
---------

-   Multiple GenBank sequences inside a single file
    (ftp://bio-mirror.net/biomirror/genbank/gbbct1.seq.gz) can be easily
    indexed.
-   Is it possible to write the sequence to any object instead of
    writing it to a PrintStream?

`           // existing method`  
`           genbankFormat.writeSequence(richSequence, printStream);`

--*The above two aren't really use-cases, they're more technicalities.
We will attempt to address them but they will need clarification - 'any
object' is too vague (you need to specify exactly what you want to write
it to), and it's not mentioned why the indexing of a genbank file is
going to be a good thing, or even if the indexes already exist or
whether BioJava should make them itself. A use-case is 'I need to load a
subset of a GenBank file into a database then add some of my own
annotations, then produce a web search form for users to search and
identify my sequences by entering keywords from the annotation,
returning FASTA sequences as results', for example. Please also do leave
your name and contact email address so we can contact you for
clarification and more detail if we need to. --
**[Richard](User:Rholland "wikilink") 20/6/08***

-   I have a protein sequence of unknown function and want to identify
    similar sequences in public databases. (Blast, PsiBlast)
-   For the matches that I find I want to access the UniProt records to
    obtain all possible information. (Read UniProt)
-   Align the original protein sequence against the best hits in high
    quality and find regions of similarity.(Needleman Wunsch, Swith
    waterman)
-   If the protein structure is known for one of the homologues try to
    extend the search by finding similar protein structures in the PDB.
    (structure alignment)
-   Create a multiple sequences alignment and multiple structure
    alignment for the found matches. derive a profile from this for this
    protein family and search for distant members in the sequences
    databases. (psi blast)

