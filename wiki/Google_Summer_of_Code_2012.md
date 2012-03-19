---
title: Google Summer of Code 2012
---

Introduction
------------

The Open Bioinformatics foundation is [participating again in this
year's Google Summer of
Code](http://www.open-bio.org/wiki/Google_Summer_of_Code).

We are accepting applicants for projects for BioJava. If you want to
propose a project, have a look at the <BioJava:Modules> page, for areas
which are currently under development. Also take a look at the [Feature
Requests](BioJava3_Feature_Requests "wikilink") page.

Please read the [GSoC page at the Open Bioinformatics
Foundation](http://www.open-bio.org/wiki/Google_Summer_of_Code) and the
[main Google Summer of Code page](http://code.google.com/soc) for more
details about the program.

### Project Proposals

#### New File Parsers for BioJava

In the ideal word one would like to import the data from one program
directly into another without having to do any file parsing,
unfortunately in the real life this is not the case. Furthermore, having
access to a wide variety of the file parsers is a prerequisite for any
real work with the data. At least this is often the case in
Bioinformatics.

Yet, writing the file parsers is a tedious job that has to be done with
care and consideration to achieve reliability, easy of use and
performance. So it is best to be done as a main task rather the
afterthought of some other process. So if you want to help us to improve
BioJava and spare users from a lot of complicate work choose this
project! There is plenty of scope for multi-threaded programming,
advanced IO and complicated data structures to choose from, all depends
on what you want.

-   UniProt
-   [HMMER 3](http://hmmer.janelia.org)
-   [Phylip](http://evolution.genetics.washington.edu/phylip.html)
-   [MrBayes](http://mrbayes.sourceforge.net)
-   Genbank (using XML format as input and one of the standard Java XML
    parsers with the aim to provide and example for people that is easy
    to follow)
-   Tidy up existing parsers in BioJava, namely FASTA and FASTQ parsers

This project is be suitable to a confident Java developer.

Mentors for this project are Peter Troshin and Andreas Prlic

#### Take BioJava into the Cloud

-   Hadoop-ify and/or Map-Reduce some of the BioJava modules

#### Port an Algorithm to Java

Both Blast and Hmmer have had recent rewrites
Blast+(http://www.ncbi.nlm.nih.gov/staff/tao/URLAPI/unix\_setup.html)
C++ and Hmmer(http://hmmer.janelia.org/software) C. This is an excellent
opportunity for a computer scientist with a strong background in
programming languages and pattern matching to gain first hand knowledge
of two software packages that drive the foundation of bioinformatics.

-   Blast <http://en.wikipedia.org/wiki/BLAST>
-   HMMER (but read the [talk
    page](Talk:Google_Summer_of_Code_2012#HMMER "wikilink") for some
    caveats)

By porting these algorithms to Java the development community will be
able to easily integrate the functionality into future applications.
Currently, working with Blast involves a web service call to an external
BLAST server or kicking off the BLAST executable and then parsing the
output.

Converting C or C++ source code by hand is not a trivial undertaking and
it is recommended that a C/C++ to Java conversion tool be used to do as
much of the work as possible. It is also an option to consider a JNI
approach for integrating these applications into Java.

Mentors for this project are Andreas Prlic and Peter Troshin.

Previous Years
--------------

[Google Summer of Code 2011](Google Summer of Code 2011 "wikilink")

[Google Summer of Code 2010](Google Summer of Code 2010 "wikilink")
