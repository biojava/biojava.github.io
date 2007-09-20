---
title: UsageAnalysis
---

Usage Analysis
--------------

A question related to the discussion of how to design a future BioJava
is to have a look at which parts of BioJava are being actively used and
how to improve these.

So what are the most frequently used bits of BioJava? One way to look at
this is to go to the web-stats and see how many hits we have got on our
documentation web pages.

In an ideal world BioJava would be so simple to use, that nobody needs
to read any docu. Unfortunately we are far away from this, so actually
looking at these stats gives an impression on

-   topics / functionality which are of particular interest to the
    community
-   topics / functionality which might not be straightforward to use,
    therefore there are many hits on these pages.

A look at the webstats from the last couple of months gives these top 10
Cookbook pages that have been accessed frequently. This list is ordered
by nr. of pageviews

1. <BioJava:Cookbook:Alphabets>

2. <BioJava:CookBook:Blast:Parser>

3. <BioJava:Cookbook:SeqIO:ReadFasta>

4. <BioJava:Cookbook:SeqIO:ReadGES>

5. <BioJava:CookBook:DP:PairWise2>

6. <BioJava:CookBook:PDB:read>

7. <BioJava:Cookbook:Sequence>

8. <BioJava:Cookbook:SeqIO:WriteInFasta>

9. <BioJava:CookBook:Interfaces:ViewInGUI>

10. <BioJava:CookBook:Fasta:Parser>

Interpretation
==============

I would group these pages into 2 groups.

    A) How to work with core concepts of BioJava
    B) How to use a functionality of BioJava to achieve a certain goal

Conceptual pages
================

The "conceptual" pages (A) I would identify as

-   How to get an Alphabet
-   How to make a Sequence Object from a String or make a Sequence
    Object back into a String

Functionality pages
===================

The "functionality" pages (B) I would summarize as

-   How to parse a Blast output
-   How to read sequences from a Fasta file
-   How to read a GenBank, SwissProt or EMBL file
-   How to generate a global or local alignment with the
    Needleman-Wunsch- or the Smith-Waterman-algorithm
-   How to read a protein structure - PDB file
-   How to export a sequence to fasta
-   How to view a sequence in a gui
-   How to parse a Fasta database search output file

As a conclusion I would suggest that BioJava should have the goal to
provide easy access to the core "functionalities" (group B). I believe
that we should try to keep the "concepts" that are being used to achieve
these functionalities as simple as possible. In this sense, I feel that
we have too many hits on the group A pages.
