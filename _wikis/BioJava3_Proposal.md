---
title: BioJava3 Proposal
---

Executive Summary
-----------------

It is suggested that development stop on the existing
BioJava/BioJavaX/BioJava2 aggregation and start afresh as BioJava3.

Reasoning
---------

-   The existing code is disorganised, poorly commented, and hard to
    maintain due to the use of numerous different coding styles.
-   Existing documentation is poor and it would be hard to try and write
    any given the lack of code comments.
-   Unit testing is limited and hard to tack on to existing code.
-   The build scripts are out of date and the release process is hard.
-   There is demand for a number of smaller jars as opposed to one
    monolithic one.
-   We do not make use of any Java features since Java 4. Generics is
    the obvious one.
-   There is no support for changing file formats. It supports one
    version or another, but cannot handle both.
-   The only database support is for BioSQL, which uses Hibernate but
    not in a fully flexible manner (i.e. cannot connect to more than one
    db at a time).
-   It is sequence-focused. Users have moved on.

Proposal
--------

-   Analyse how BioJava is being used by the community. See the
    [UsageAnalysis](UsageAnalysis "wikilink") page.
-   To start from scratch, creating a number of smaller jars as
    sub-projects within an umbrella BioJava3 project. Each jar would
    provide tools for a specific purpose. Additional jars would provide
    cross-purpose tools such as format converters or text-to-object
    interfaces. Possibly built using [Maven](http://maven.apache.org/)
    instead of [Ant](http://ant.apache.org/).
-   Although starting from scratch, much existing code could be reused
    or refactored to suit the new design.
-   We would take full advantage of [Java
    6](http://java.sun.com/javase/6/), including generics,
    (@)annotations, the built-in property change support. Everything
    would be a bean - absolutely everything.
-   We would aim to be fully [Java EE](http://java.sun.com/javaee/)
    compliant, with the majority of components fully reusable as a bean
    in any other application, just like
    [Spring](http://www.springframework.org/)'s components are.
-   We would write a [JUnit](http://junit.sourceforge.net/) test for
    every single class, writing the test first then the class
    afterwards. If other test frameworks are out there we could
    investigate these too - one suggestion is
    [TestNG](http://testng.org/doc/). We would also write documentation
    for every single class with additional full documentation for each
    separate jar.
-   We would adhere rigidly to a common coding style and heavily comment
    the code.
-   We should make it able to focus on any aspect the user requires and
    keep its efficiency, removing its dependency on everything being
    sequence-related.
-   SymbolLists and Alphabets to be rethought as these are the most
    common stumbling block.

Data structure
--------------

-   RecordSource is an object which provides data. It can represent a
    file, a directory of files, a database, a web search engine, etc.
    etc. etc.. It has a RecordFormat which reads/writes Records to/from
    the RecordSource. It provides an iterator over Records which match a
    given RecordSearch.
-   A RecordFormat is version-specific to the format, as are the Record
    objects it produces.
-   RecordSearch defines search criteria to be applied to a RecordSource
    (or group thereof). It provides an iterator which returns all the
    combined Records from all RecordSources the RecordSearch was applied
    to. It uses RDF or something similar to map fields between different
    kinds of Records and the search parameters.
-   Record is a piece of data in any format, as a bean. It should be as
    lightweight as possible - lazyloading of all non-key data would be
    ideal. Each different kind of Record has an object structure
    suitably matched to the RecordFormat that produced it - e.g. Genbank
    Record objects should be structured internally in almost exactly the
    same way as the Genbank file. This allows minimal loss of
    information and maximum flexibility.
-   RecordConverters convert Record objects between different formats,
    e.g. Genbank Record to FASTA Record. They allow sensible defaults to
    be provided where one format does not supply enough info to satisfy
    the minimum requirements of another. Some kind of bean conversion
    system based on RDF would be suitable for this. One possible
    candidate would be [Dozer](http://dozer.sourceforge.net/).
-   A set of tools for converting flat data (e.g. sequence strings,
    taxononmy strings) into BioJava-like objects (e.g. SymbolLists,
    NCBITaxon). These BioJava-like objects could then be used for more
    advanced applications.
-   A set of tools for manipulating the BioJava-like objects.

Action plan
-----------

1.  Please modify this page and the [Talk
    page](Talk:BioJava3_Proposal "wikilink") as you see fit in order to
    flesh out details and/or make new points.
2.  Tentative Singapore meeting to get the ball rolling on the final
    design and initial coding front.

Categories of Improvement
-------------------------

Initally suggested by Andreas this attempts to group the currently
recognized *issues* surrounding Biojava. See also
[UsageAnalysis](UsageAnalysis "wikilink").

### Category A

How to work with core concepts of BioJava:

-   How to get an Alphabet
-   How to make a Sequence Object from a String or make a Sequence
    Object back into a String

### Category B

Functionality; taking on concepts/practices from *Category A* and
applying them to a bioinformatics problem.

-   How to parse a Blast output
-   How to read sequences from a Fasta file
-   How to read a GenBank, SwissProt or EMBL file
-   How to generate a global or local alignment with the
    Needleman-Wunsch or the Smith-Waterman-algorithm
-   How to read a protein structure - PDB file
-   How to export a sequence to fasta
-   How to view a sequence in a gui
-   How to parse a Fasta database search output file

