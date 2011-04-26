---
title: GSoC:AAPropertiesComputation
---

**Amino Acids Physico-Chemical Properties Calculation**

*[Google Summer of Code](Google Summer of Code "wikilink") Project by
[Chuan Hock
Koh](http://compbio.ddns.comp.nus.edu.sg/~ChuanHockKoh/index.html)*

*Mentored by [Peter Troshin](http://biojava.org/wiki/User:Ptroshin)*

*Co-mentored by [Andreas Prlic](Andreas Prlic "wikilink")*

The calculation of simple physico-chemical properties for biopolymers is
an important tool in the arsenal of molecular biologist. Theoretically
calculated quantities like extinction coefficients, isoelectric points,
hydrophobicities and instability indices are useful guides as to how a
molecule behaves in an experiment. Many tools for calculating these
properties exist, including widely used open-source implementations in
EMBOSS and BioPerl, but only some are currently available in BioJava3.
The aim of this project is to port or produce new implementations of
standard algorithms for a range of calculations within BioJava3.

Timeline
--------

### Phase 1 (7 Weeks)

*April 25 to June 12* - Deliverables: APIs

-   Research and finalize with mentor the properties to be included
-   Start coding of APIs while writing the documentation concurrently

### Phase 2 (3 Weeks)

*June 13 to July 3* - Deliverables: Tested APIs and Documentations

-   Write test cases to ensure accuracy of the APIs
-   Clean up codes and documentation for readability
-   Update BioJava wiki page and write tutorial for using APIs
-   Check with mentor on areas of improvement

### Phase 3 (2 Weeks)

*July 4 - July 17* - Deliverables: Executable

-   Develop, test and document command line executable for generating
    properties
-   Update BioJava wiki page and write tutorial for using Executables

### Phase 4 (2 Weeks)

*July 18 - July 31* - Deliverables: SOAP web services

-   Expose APIs as SOAP web services within the JABAWS framework
-   Test and document the services

### Phase 5 (3 Weeks)

*August 1 to August 21*

-   Final touch-up based on mentors’ feedback

Progress Log
------------

### April 26 - Current

-   Set up project page in BioJava Wiki

Skype call notes
----------------

References
----------

-   [BioJava](http://bioinformatics.oxfordjournals.org/content/24/18/2096.abstract) -
    BioJava: an open-source framework for bioinformatics
-   [SiriusPSB](http://www.worldscinet.com/jbcb/07/0706/S0219720009004436.html) -
    Sirius PSB: A Generic System for Analysis of Biological Sequences
-   [PROFEAT](http://nar.oxfordjournals.org/content/34/suppl_2/W32.abstract) -
    PROFEAT: a web server for computing structural and physicochemical
    features of proteins and peptides from amino acid sequence

Comments
--------

*Please add comments here...*
