---
title: BioJava talk:CookBook:Blast:XML
---

Hi to all,

Not to bitch or anything but should the cookbook be about specifically
using BJ classes to solve bioinformatics tasks? This page is pretty much
about using Java's XML features on a XML-formatted Blast report.

Please do not interpret this comment as objecting to your contribution
(far from me) but should we be thinking about creating some repositories
of more generic Java stuff or point users toward other more general web
resources?

Just my own .02 cents and I am open to discuss this ;-)

--[Foisys](User:Foisys "wikilink") 15:11, 23 July 2007 (EDT)

The problem is that thre is no flexible xml -\> html generation in biojava...
-----------------------------------------------------------------------------

Hello! If someone is interested I could post how to make it using
BioJava classes. The main problem is that the parser biojava uses is not
made for html generation. There is a parser that one can use to parse a
plain biojava result file and generate SAX event, so you can pass it to
html generator. It works sloooow (IMHO) and not as flexible as to apply
xsl. I'm looking for a way to do the same for FASTA format... any idea?
Cheers,

Dmitry
