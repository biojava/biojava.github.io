---
title: User talk:Seeker
---

I've noticed some misprints in BioJavaX Documentation and in the source code.
-----------------------------------------------------------------------------

[Here](BioJava:BioJavaXDocs#Writing_2 "wikilink") in
[BioJavaXDocs](BioJava:BioJavaXDocs "wikilink") it is said that GenBank
Field FEATURE can be outputted as follows:

"...For the source feature, the db\_xref and organism fields are added
to the output by calling **getNCBITaxon().getNCBITaxID()** and
**getNCBITaxon().getDisplayName()** on the *sequence* (the latter is
chopped before the first bracket if necessary)...."

If I clearly understand, the **RichSequence** object is ment by
*sequence*. But there is no **getNCBITaxon()** method in the
**RichSequence** class. There is **getTaxon()** method in the
**RichSequence** class. Thus, exectly this method should be used here
instead of **getNCBITaxon()** method.

------------------------------------------------------------------------

<java>

RichSequenceIterator seqs = RichSequence.IOTools.readGenbankDNA(br, ns);
RichSequence seq = seqs.nextRichSequence();

Iterator fsit = seq.getFeatureSet().iterator(); RichFeature rf =
(RichFeature) fsit.next();

Set noteSet = rf.getNoteSet(); Iterator nit = noteSet.iterator();

while (nit.hasNext()) {

` if (fType.equals("CDS")) {`

`   if (snTermName.equals("function")) {`

`     function = sn.getValue();`  
`     System.out.println("Function:\n" + function);`  
`   } else if (snTermName.equals("note")) {`

`     note = sn.getValue();`  
`     System.out.println("Note:\n" + note);`  
`   }`  
` }`

} </java>
