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

------------------------------------------------------------------------

HI,

Ok, here goes:

Your first bug might be related to the fact that in my example code, you
read a file with ProteinSequences in an array and ProteinSequence
objects are what is expected here:

<java>

`           for (Entry`<String, ProteinSequence>` entry : a.entrySet()) {`  
`               System.out.println( entry.getValue().getOriginalHeader() + "\n");`  
`               request = rbw.sendAlignmentRequest(entry.getValue(),rqb);`  
`               rid.add(request);           }`

</java>

If you are using DNASequences, you need to do this:

<java> for (Entry<String, DNASequence> entry : a.entrySet()) {

`               System.out.println( entry.getValue().getOriginalHeader() + "\n");`  
`               request = rbw.sendAlignmentRequest(entry.getValue(),rqb);`  
`               rid.add(request);           }`

</java>

I can tell you this works a-ok :-)

The second thing is a bug in the code that I have now fixed in the
biojava-live svn. Please give it a try and let me know if it works. It
does for me...

--[Foisys](User:Foisys "wikilink") 01:45, 21 February 2011 (UTC)

------------------------------------------------------------------------

Hi,

It works now with the fixed biojava-live svn. For some odd reason that
also fixed the first bug. I only had to give rqb a blank
setAdvancedOptions otherwise that would give a new error.

Sorry for ruining this wiki discussion page with these posts that are
obviously not done the correct way, i am new to this ;)

Thanks for your quick response and fix.

------------------------------------------------------------------------

The setAdvancedOptions workaround was actually showing a bug in the way
I dealt with the field in the first place... I fixed it in the
biojava-live svn tree. BTW, using the discussion section of the page is
a perfect use of the wiki, but don't forget to also use the mailing list
for flagging problems to us, the developers.

Btw no 2: my pleasure. Only via your feedbacks can we improve on this
code :-)

--[Foisys](User:Foisys "wikilink") 19:34, 22 February 2011 (UTC)
