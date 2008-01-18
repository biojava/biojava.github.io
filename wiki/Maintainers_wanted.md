---
title: Maintainers wanted
---

We are currently looking for maintainer(s) for the following
sub-packages

BLAST parsers
-------------

The BioJava [BLAST parser
modules](BioJava:CookBook:Blast:Parser "wikilink") are among the most
frequently used bits of BioJava. It is possible to parse a large variety
of BLAST-family output files, but the framework is not complete. We are
looking for a motivated individual who wants to take over the leadership
over these modules, interact with a large user community and claim
responsibility for maintaining and further developing these modules.

Among the currently open tasks are:

`* add support for PSI-blast parsing`  
`* support parsing of result files with multiple queries`  
`* support XML-output parsing`  
`* refactor the blast packages to provide more understandable package names. (for Biojava-v3)`

Sequence IO packages
--------------------

The IO packages are responsible for reading common bioinformatics
formats and producing RichSequence and BioEntry objects. Where possible
the IO packages also write RichSequence and BioEntries out to common
formats. While mature and generally well tested, these packages are
intensively used and variations in formats reveal occasional bugs in
biojava. Volunteers are needed to help maintain and develop these
packages so as to provide rapid responses to queries and bug reports but
also to extend the packages while keeping the overall feel as similar as
possible. Volunteers with experience in ORM, especially Hibernate are
needed to help support and extend the ORM between BioJava and the BioSQL
schema.

Among the currently open tasks are:

`* Update the cookbook `[ `IO`
`examples`](http://biojava.org/wiki/BioJava:CookBook#Sequence_I.2FO "wikilink")` to use the org.biojavax packages.`  
`* Provide more cookbook examples.`  
`* Add support for DDBJ format.`  
`* Run profilers to increase the speed of the parsers.`  
`* Add more tests including examples of troublesome input files.`  
`* Optimize the performance of the Hibernate based ORM between RichSequence objects and the BioSQL database.`
