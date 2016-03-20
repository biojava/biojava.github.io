---
title: BioJava:Forum
---

Welcome to the BioJava Forum Page!!
-----------------------------------

This page is to harbour discussions on BioJava topics, especially topics
related to development of new features or extension of already present
features.

### dbSNP objects for BioJava

I started working with a research team focusing in genomics and observed
that there is nothing in BioJava to deal with dbSNP infos. I setup a
(very) simple NCBIdbSNP class that can fetch single dbSNP entries and
represent them as RichSequences. Anybody would have insights on the
subject where I could go with this?

--[Foisys](User:Foisys "wikilink") 21:25, 23 January 2007 (EST)

Sounds interesting. How do you represent the SNP on the RichSequence? Is
it a Feature? Does dbSNP contain frequency information for the SNPs? If
it does it would be possible to represent each SNP as a Distribution.
You could make a simple extension of RichFeature that stores a
Distribution or possibly embed it into the RichAnnotation for the
feature (best to do it as a string rather than as a Distribution in this
case).

--[Mark](User:Mark "wikilink") 23:33, 27 January 2007 (EST)

Right now, I have a simple parser that reads the XML file for a given
dbSNP and extracts some infos out of it. I want to make each dbSNP entry
into a RichSequence (content still in flux). I have not yet settled into
the finality of the object: possibly extracting frequencied in
populations would be an nice thing to have?

--[Foisys](User:Foisys "wikilink") 11:13, 29 January 2007 (EST)

For me this class would be particularly interesting. In STRAP users can
manually give a list of SNPs
[http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pubmed&cmd=Retrieve&dopt=AbstractPlus&list\_uids=16322575
abstract](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pubmed&cmd=Retrieve&dopt=AbstractPlus&list_uids=16322575 abstract "wikilink")
which are then projected on the AA-Sequence, NT-Sequence or 3D-structure
[http://www.proteinscience.org/cgi/content/abstract/15/1/208
publication](http://www.proteinscience.org/cgi/content/abstract/15/1/208 publication "wikilink")
Your class could help to get it from the databases automatically.

--[Christo](User:Christo "wikilink") 05:07, 10 March 2007 (EST)

### Data retrival tools for BioJava

It would be very useful to include tools to retrieve data from different
databases, in particular from NCBI. Some tools programmed in Java
[1](http://eutils.ncbi.nlm.nih.gov/entrez/query/static/esoap_java_help.html)
already exist, but it would be great to embed them in BioJava, along
with the tools required to parse the data retrieved.

--[Ghislain](User:Gbonamy "wikilink") 22:19, 6 July 2008 (UTC)

Hi Ghislain,

I had this [ little
example](BioJava:CookBook:ExternalSources:NCBIFetch "wikilink") ready
for a while because I had this same exact problem so many years ago ;-)
There is also a package to get info from Ensembl (biojava-ensembl) from
Thomas Down but I do not know what is its status right now. Thomas: can
you give us an update on this?

--[Foisys](User:Foisys "wikilink") 12:35, 7 July 2008 (UTC)
