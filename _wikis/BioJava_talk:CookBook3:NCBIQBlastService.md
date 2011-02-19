---
title: BioJava talk:CookBook3:NCBIQBlastService
---

Converted entry.getValue() to string before submitting it to
sendAlignmentRequest because it won't catch the DNASequence version.

Also, it keeps giving this error due to a bug in the biojava code:
java.lang.Exception: *The key named PROGRAM is not set in this
RemoteQBlastOutputProperties object*

------------------------------------------------------------------------

Hi,

Thanks for the input. I'll look into this ASAP.

--[Foisys](User:Foisys "wikilink") 12:41, 19 February 2011 (UTC)
