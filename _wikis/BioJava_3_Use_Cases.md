---
title: BioJava 3 Use Cases
---

This page will contain a bunch of use-cases which will drive development
for BioJava 3. Please add them below - as simple or as complex as you
wish!

Use cases
---------

-   Multiple GenBank sequences inside a single file
    (ftp://bio-mirror.net/biomirror/genbank/gbbct1.seq.gz) can be easily
    indexed.
-   Is it possible to write the sequence to any object instead of
    writing it to a PrintStream?

`           // existing method`  
`           genbankFormat.writeSequence(richSequence, printStream);`

--*Italic text The above two aren't really use-cases, they're more
technicalities. We will attempt to address them but they will need
clarification - 'any object' is too vague (you need to specify exactly
what you want to write it to), and it's not mentioned why the indexing
of a genbank file is going to be a good thing, or even if the indexes
already exist or whether BioJava should make them itself. A use-case is
'I need to load a subset of a GenBank file into a database then add some
of my own annotations, then produce a web search form for users to
search and identify my sequences by entering keywords from the
annotation, returning FASTA sequences as results', for example. Please
also do leave your name and contact email address so we can contact you
for clarification and more detail if we need to. --
**[Richard](User:Rholland "wikilink") 20/6/08***
