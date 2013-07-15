---
title: Current events
---

BioJava 3.0.6 released
----------------------

BioJava 3.0.6 was released on July 15th 2013 and is available from
<BioJava:Download> as well as from the BioJava maven repository at
[<http://www.biojava.org/download/maven/>](http://www.biojava.org/download/maven/)
.

New Features:

`- We moved our development to Github.`  
`- many bug fixes and minor improvements`

New Features:

BioJava moves to Github
-----------------------

As of April 3, 2013, [Github](http://github.com/biojava) is the primary
repository for BioJava. See [SVN to GIT
Migration](SVN to GIT Migration "wikilink") for more info.

BioJava 3.0.5 released
----------------------

BioJava 3.0.5 was released on Nov 30th 2012 and is available from
<BioJava:Download> as well as from the BioJava maven repository at
[<http://www.biojava.org/download/maven/>](http://www.biojava.org/download/maven/)
.

New Features:

`- New parser for CATH classification`  
`- New parser for Stockholm file format`  
`- Significantly improved representation of biological assemblies of protein structures. Now can re-create biological assembly from asymmetric unit`  
`- Several bug fixes.`

BioJava 2012 paper published
----------------------------

The latest BioJava paper describing the version 3 series has been
published and is now available online.

Thanks to all developers for their contributions, it would not have been
possible without them!

[Abstract
<http://bioinformatics.oxfordjournals.org/cgi/content/abstract/bts494?ijkey=BzJOy9GgM2XNw07&keytype=ref>]

[PDF
<http://bioinformatics.oxfordjournals.org/cgi/reprint/bts494?ijkey=BzJOy9GgM2XNw07&keytype=ref>]

Citation:

BioJava: an open-source framework for bioinformatics in 2012

Andreas Prlic; Andrew Yates; Spencer E. Bliven; Peter W. Rose; Julius
Jacobsen; Peter V. Troshin; Mark Chapman; Jianjiong Gao; Chuan Hock Koh;
Sylvain Foisy; Richard Holland; Gediminas Rimsa; Michael L. Heuer; H.
Brandstatter-Muller; Philip E. Bourne; Scooter Willis

Bioinformatics 2012; doi: 10.1093/bioinformatics/bts494

BioJava 3.0.4 released
----------------------

BioJava 3.0.4 was released on May 21st 2012 and is available from
<BioJava:Download> as well as from the BioJava maven repository at
[<http://www.biojava.org/download/maven/>](http://www.biojava.org/download/maven/)
.

- This is mainly a bug fix release addressing issues with the protein
structure and disorder modules

- One new feature: SCOP data can now be accessed from either the
original SCOP site in the UK (v. 1.75) or from Berkeley (v. 1.75A) .

BioJava at Google Summer of Code 2012
-------------------------------------

BioJava is participating at this years' Google Summer of Code again.
Find out more about it at
[Google\_Summer\_of\_Code](Google_Summer_of_Code "wikilink")

BioJava 3.0.3 released
----------------------

BioJava 3.0.3 was released on March 16th and is available from
<BioJava:Download>.

BioJava 3.0.3 has been released and is available from
<http://www.biojava.org/wiki/BioJava:Download> as well as from the
BioJava maven repository at <http://www.biojava.org/download/maven/> .

New Features

BioJava 3.0.3 adds several new features

- Significant improvements for the web service module (ncbi blast and
hmmer web services)

- Fastq parser (ported from the biojava 1 series to version 3)

- Support for SIFTS-PDB to UniProt mapping

- Improved support for working with external protein domain definitions

- Protmod module renamed to modfinder

- Numerous improvements all over the place (several hundred commits
since last release)

- We are also working on an update for the legacy biojava 1.8 series.

This release would not have been possible with contributions from
numerous people, thanks to all for their support!

BioJava 3.0.2 released
----------------------

BioJava 3.0.2 was released on September 2nd 2011 and is available from
<BioJava:Download>.

BioJava 3.0.2 adds new modules and enhances the capabilities of BioJava:

`- biojava3-aa-prop: This new module allows the calculation of physico chemical and other properties of protein sequences.`  
`- biojava3-protein-disorder: A new module for the prediction of disordered regions in proteins. It based on a Java implementation of the RONN predictor.`

Other noteworthy improvements:

`- protein-structure: Improved handling of protein domains: Now with better support for SCOP. New functionality for automated prediction of protein domains, based on Protein Domain Parser.`  
`- Improvements and bug fixes in several modules.`

Currently, up to 8 different people are making commits per month. This
gives an indication how active Biojava is being developed. The two new
modules are based on the work of Ah Fu (Chuan Hock Koh) and Peter
Troshin, which happened around this year's Google Summer of Code. Thanks
to everybody who made this new release possible!

Google Summer of Code 2011
--------------------------

BioJava is participating again in this year's Google Summer of Code. We
are currently accepting student applications. For more info see here
[Google\_Summer\_of\_Code](Google_Summer_of_Code "wikilink")

BioJava 3.0.1 released
----------------------

BioJava 3.0.1 was released on Feb 13th 2011 and is available from
<BioJava:Download>.

The 3.0.1 release is mainly a bug fixing release for the recent 3.0
released which provided a major rewrite of the biojava code base. A
couple of noteworthy bug fixes:

- core: fixed an issue with sequence index positions, new utility
methods for parsing of large fasta files

- structure: Fixed issues with PDB header parsing and more stability
with non-standard PDB files. Added new algorithm to automatically infer
protein domain boundaries.

- web services: Fixed wrong dependency on old codebase and overall
improvements in functionality

- protein modifications: Minor bugfixes

In parallel the biojava-legacy code base has been updated to release
version 1.8.1 and it provides a bug fix related to circular locations.

Thanks to all contributors for making this release possible.

Happy Biojava-ing

BioJava 3.0 released
--------------------

Biojava 3.0 was released on Dec 28th 2010.

BioJava 3.0 has been released and is available from <BioJava:Download>.

BioJava is a mature open-source project that provides a framework for
processing of biological data. BioJava contains powerful analysis and
statistical routines, tools for parsing common file formats, and
packages for manipulating sequences and 3D structures. It enables rapid
bioinformatics application development in the Java programming language.

Over the last year BioJava has undergone a major re-write. It has been
modularized into small, re-usable components and a number of new
features have been added. The new approach, modeled after the apache
commons, minimizes dependencies and allows for easier contribution of
new components.

At the present the main modules are:

biojava3-core: The core module offers the basic tools required for
working with biological sequences of various types (DNA, RNA, protein).
Besides file parsers for popular file formats it provides efficient data
structures for sequence manipulation and serialization.

biojava3-genome: The genome module provides support for reading and
writing of gtf, gff2, gff3 file formats

biojava3-alignment: This module provides implementations for pairwise
and multiple sequence alignments (MSA). The implementation for MSA
provides a flexible and multi-threaded framework that works in linear
space and that, as an option, allows the users to define anchors that
are used in the build up of the multiple alignment.

biojava3-structure: The 3D protein structure module provides parsers and
a data model for working PDB and mmCif files. New features in this
release are the implementation of the CE and FATCAT structural alignment
algorithms and the support of chemical component definition files, for a
chemically and biologically correct representation of modified residues
and ligands.

biojava3-protmod: The protein modification module can detect more than
200 protein modifications and crosslinks in 3D protein structures. It
comes with an XML file and Java data structures to store information
about different types of protein modifications collected from PDB,
RESID, and PSI-MOD.

Not every feature of the BioJava 1.X code base was migrated over to
BioJava 3.0. A modularized version of the 1.X sources is available as a
new "biojava-legacy" project.

Google Summer of Code
---------------------

BioJava is participating in the Google Summer of Code. We are currently
accepting student applications. For more info see here
[Google\_Summer\_of\_Code](Google_Summer_of_Code "wikilink")

BioJava Hackathon 2010
----------------------

The BioJava Hackaton will take place at the Genome Campus in Hinxton,
Cambridge, U.K. from Jan. 19th-22nd. For more info see
<BioJava:Hackathon2010>.

BioJava at BOSC 2009
--------------------

There will be a BioJava talk at
[BOSC2009](http://open-bio.org/wiki/BOSC_2009_Schedule) in Stockholm,
Sweden. We will also have a [BioJava user
meeting](http://open-bio.org/wiki/BOSC_2009/Birds-of-a-Feather) as part
of the Birds of a Feather session on Sunday there.

[the presentation](BOSC2009_Presentation "wikilink")

BioJava 1.7 has been released
-----------------------------

Sun, Apr 12, 2009 at 7:47 PM

Biojava 1.7 has been released and is available from <BioJava:Download>

BioJava is a mature open-source project that provides a framework for
processing of biological data. BioJava contains powerful analysis and
statistical routines, tools for parsing common file formats, and
packages for manipulating sequences and 3D structures. It enables rapid
bioinformatics application development in the Java programming language.

Besides numerous bug fixes and stability improvements, a lot of
development has been going on in the protein structure modules. BioJava
now provides a framework for parsing mmCif files. The parsing of PDB
header information has been improved and a new tool to read the Chemical
component dictionary is in place. Biojava 1.7 offers more functionality
and stability over the previous official releases. We highly recommend
you to upgrade as soon as possible.

Thanks to all contributors for making this release possible.

Happy Biojava-ing,

Andreas

BOSC 2008 Presentation
----------------------

[Michael](User:Heuermh "wikilink") presented BioJava at this year's ISMB
in Toronto. For the presentation and discussion see
[BOSC2008\_Presentation](BOSC2008_Presentation "wikilink").

BioJava 1.6 released
--------------------

Version 1.6 release announcement to biojava-dev and biojava-l

Date: Sun, 13 Apr 2008 19:02:41 +0100 From: Andreas Prlic To:
biojava-dev at biojava.org, biojava-l at biojava.org Subject:
[Biojava-dev] biojava 1.6 released

Biojava 1.6 has been released and is available from <BioJava:Download>

Biojava 1.6 offers more functionality and stability over the previous
official releases. BioJava now depends on Java 1.5+. We highly recommend
you to upgrade as soon as possible.

In detail, the phylo package org.biojavax.bio.phylo was improved and
expanded by our GSOC'07 student Boh-Yun Lee. It now contains fully-
functional Nexus and Phylip parsers, and tools for calculating UPGMA and
Neighbour Joining, Jukes-Kantor and Kimura Two Parameter, and MP. It
uses JGraphT to represent parsed trees.

The PDB file parser was improved by Jules Jacobsen for better dealing
with PDB header records. Andreas Draeger provided several patches for
improving the Genetic Algorithm modules. Additionally this release
contains numerous bug fixes and documentation improvements.

Thanks to the entire biojava community for making this possible!

Happy Biojava-ing,

Andreas

Migration from CVS to Subversion
--------------------------------

(Jan. 2008) BioJava has moved the source repository from CVS to
Subversion (SVN). See
[CVS\_to\_SVN\_Migration](CVS_to_SVN_Migration "wikilink")

BOSC 2007 Presentation
----------------------

For those of you who can't be in Vienna for Richard's biojava
presentation for BOSC 2007. You can view the pdf
[here](http://www.biojava.org/download/files/bosc2007.pdf).

NESCent Phyloinformatics and the Google Summer of Code
------------------------------------------------------

BioJava is hosting a student from the [Google Summer of
Code](http://code.google.com/soc) who is planning on developing and
extending the phyloinformatics APIs in BioJava. Bohyun Lee aims to
create parsers for the common phyloinformatics file formats (Nexus
etc.), provide an object model for storing trees, and provide API
methods for manipulating and querying those trees.

The project is part of the [NESCent
Phyloinformatics](http://phylosoc.nescent.org/) group of projects.

Bohyun will be [documenting progress and discussing
plans](Project:PhyloSOC07 "wikilink") as the project progresses. Please
feel free to chip in with your own comments and suggestions.

BioJava News
------------

<table>
<rss>[http://biojava.org/news/feed|date](http://biojava.org/news/feed|date)</rss>

</table>
Related News Sites
------------------

[OBDA news](http://obda.open-bio.org/news)

[BioSQL news](http://biosql.org/news/)

[BioPython news](http://biopython.open-bio.org/news)

[O|B|F news](http://news.open-bio.org/)

[BioPerl news](http://bioperl.org/news/)

[BioRuby news](http://bioruby.org/news/)
