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
which are currently under development.

Please read the [GSoC page at the Open Bioinformatics
Foundation](http://www.open-bio.org/wiki/Google_Summer_of_Code) and the
[main Google Summer of Code page](http://code.google.com/soc) for more
details about the program.

### Project Proposals

#### Amino acids physico-chemical properties calculation

Project page: <GSoC:AAPropertiesComputation>

Rationale  
The calculation of simple physico-chemical properties for biopolymers is
an important tool in the arsenal of molecular biologist. Theoretically
calculated quantities like extinction coefficients, isoelectric points,
hydrophobicities and instability indices are useful guides as to how a
molecule behaves in an experiment. Many tools for calculating these
properties exist, including widely used open-source implementations in
EMBOSS and BioPerl, but only some are currently available in BioJava3.
The aim of this project is to port or produce new implementations of
standard algorithms for a range of calculations within BioJava3.

<!-- -->

Approach  
The following methods will be implemented in pure Java. High performance
will be insured by possibility of multithreaded calculations.

1.  Molecular weight
2.  Extinction coefficient
3.  Instability index
4.  Aliphatic index
5.  Grand Average of Hydropathy
6.  Isoelectric point
7.  Number of amino acids in the protein (His, Met, Cys)

A standalone Java library will be developed and an API for other Java
programs to use these functions as well as the command line executable.

Challenges  
Functional tests will be developed for tools, along with API and high
level documentation for end users. The BioJava3 data model already
provides support for representing the fundamental properties used in
each calculation, but new methods will be needed to apply the
calculations to objects representing biological molecules.

<!-- -->

Involved toolkits or projects  
Java, BioJava3, Eclipse, JUnit.

<!-- -->

Degree of difficulty and needed skills  
This is a simple low risk project as algorithms are independent of each
other and simple. Interested students should have a general knowledge of
core Java programming, knowledge of multi-threaded programming will be
beneficial. There is plenty of scope for the student to implement other
property calculations not listed here which will be beneficial for the
Java Bio- and Medical informatics communities.

<!-- -->

Selection criteria (not exhaustive list, but will give you some guidance)  

:\# Quality of proposal (feasible given your skills and available time,
useful outcome)

:\# Interaction (response to emails, back-and-forth regarding proposal)

:\# If you like to make your application stand out I'd suggest a [short
coding exercise](short coding exercise "wikilink").

Mentor  

[Peter Troshin](User:Ptroshin "wikilink"), co-mentor [ Andreas
Prlic](User:Andreas "wikilink")

------------------------------------------------------------------------

Previous Years
--------------

[Google Summer of Code 2011](Google Summer of Code 2011 "wikilink")
[Google Summer of Code 2010](Google Summer of Code 2010 "wikilink")
