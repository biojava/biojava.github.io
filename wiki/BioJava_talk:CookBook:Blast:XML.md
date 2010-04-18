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

The problem is that there is no flexible xml -\> html generation in biojava...
------------------------------------------------------------------------------

Hello! If someone is interested I could post how to make it using
BioJava classes. The main problem is that the parser biojava uses is not
made for html generation. There is a parser that one can use to parse a
plain biojava result file and generate SAX events, so you can pass it to
html generator. It works sloooow (IMHO) and not as flexible as to apply
xsl. I'm looking for a way to do the same for FASTA format... any idea?
Cheers,

Dmitry

Hi again,

I conceed the point so why not write a wrapper utility class to include
in BioJava that would do just such a thing. With a lot of focus these
days on using the Web as the frontend of apps, it would surely be a good
thing to add ;-)

Best regards

--[Foisys](User:Foisys "wikilink") 15:45, 30 July 2007 (EDT)

Well, if I understand you right you would like to have something like:

blast/fasta result file --\> BioJava SAX events (as it is now) --\> XML
(constructed from these events) --\> HTML (through XSL from previous
generated XML)

The problem is that plain blast/fasta parsers are not bug free and
always has issues with different versions. I spent few hours playing
with FASTA parser trying to convert it into XML and found several ...
bugs? I mean that I'm using newer version so the parser doesn't
recognize several parameters and generates an exception. More. The only
thing the biojava parser does is to separate alignments an wrap them
into xml tags...

I've been told not to spend too much time to this task, but when I have
a time I'd like to do my best...

You can see what I'm doing (well it's no a production yet, so definitely
has many bugs and we haven't all the databases yet installed) at
<http://inb.bsc.es/gn6/>

Best regards,

Dmitry
