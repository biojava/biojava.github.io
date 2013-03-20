---
title: Google Summer of Code 2013
---

BioJava at GSoC Introduction
----------------------------

Google has not announced yet if there will be a Google Summer of Code
2013. This page is to prepare possible projects for if/when the GSoC
announcement comes out.

If you want to propose a project, have a look at the <BioJava:Modules>
page, for areas which are currently under development. Also take a look
at the [Feature Requests](BioJava3_Feature_Requests "wikilink") page.
There are also some ideas from last year at
[Google\_Summer\_of\_Code\_2012](Google_Summer_of_Code_2012 "wikilink")

Please read the [GSoC page at the Open Bioinformatics
Foundation](http://www.open-bio.org/wiki/Google_Summer_of_Code) and the
[main Google Summer of Code page](http://code.google.com/soc) for more
details about the program.

### Project Proposals

------------------------------------------------------------------------

#### Port the BioJava 1 or 2 functionality to BioJava 3

As you might have noticed some functionality present in BioJava 1/2 is
missing from the BioJava 3. This is not because this functionality is
obsolete or not needed; this is because nobody had time to refactor it
to work in the BioJava 3.

So your challenge is to identify such functionality and write a proposal
where you specify

-   What functionality you are going to port
-   How you are going to do that (e.g. what needs changing)

This project is be suitable to a confident Java developer.

Please send your proposals to the BioJava dev mailing list early, so we
can discuss them in details.

P.S. Actually you are not limited to the old versions of BioJava, there
are plenty of small little known Java projects in the Bioinformatics
field which can be of interest to a wider user community. You can
integrate them as a whole or cannibalize them and extract something
useful on its own. You are more than welcome to optimize and improve the
code while porting it to BioJava as you see fit.

------------------------------------------------------------------------

#### Improve structural alignment datastructures to support topology-independent alignments

BioJava contains a number of algorithms for aligning protein structures.
In the most general case, an alignment consists of a mapping between
residues of two (or more) proteins. However, for historical and
performance reasons alignments are stored as linear, sorted arrays. This
makes it difficult to express cases where the order of aligned residues
differs between the two proteins. For instance, storing the following
alignment requires some creative work-arounds:

` 123456`  
` 456123`

Additionally, the class to store structural alignments (AFPChain)
contains a number of unneccessary, poorly documented, or
algorithm-specific parameters which should be removed or refactored.

Your challenge is to propose and implement a data structure for storing
structure alignments which

-   Is flexible enough to store topology-independent alignments
-   Efficiently utilizes memory
-   Has good performance for common tasks

This project requires an understanding of basic data structures and
performance considerations. A successful proposal should consider not
only the new data structure, but also suggest a plan for integrating it
into existing methods, particularly in the biojava3-structure and
biojava3-structure-gui modules.

------------------------------------------------------------------------

#### Topology Diagrams of Protein Structures

Topology diagrams are useful for visualising the arrangement and
connectivity of secondary structure elements of proteins. We are
currently not aware of an easy to use Java implementation of software
for drawing such diagrams. The goal of this project would be to use the
available tools from biojava (load structures, define secondary
structure) and implement a layout algorithm that would arrange a
representation of secondary structure elements in a way so it can be
easily used for various visualisation libraries. Depending on the speed
of progress a visualisation layer could be added on top of this (e.g
HTML5 vector graphics, JPanel, etc.).

Previous Years
--------------

[Google Summer of Code 2012](Google Summer of Code 2012 "wikilink")

[Google Summer of Code 2011](Google Summer of Code 2011 "wikilink")

[Google Summer of Code 2010](Google Summer of Code 2010 "wikilink")
