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

Iwas working with sequence file in GenBank format. This file contained
the following text:

`
  FEATURES             Location/Qualifiers
     source          1..4214630
                     /organism="Bacillus subtilis subsp. subtilis str. 168"
                     /mol_type="genomic DNA"
                     /strain="168"
                     /db_xref="taxon:224308"
     gene            110477..110953
                     /gene="ispF"
                     /locus_tag="BSU00910"
                     /db_xref="GeneID:936634"
     CDS             110477..110953
                     /gene="ispF"
                     /locus_tag="BSU00910"
                     /function="unknown"
                     /note="yacN; catalyzes the conversion of
                     4-diphosphocytidyl-2-C-methyl-D-erythritol 2-phosphate
                     into 2-C-methyl-D-erythritol 2,4-cyclodiphosphate"
                     /codon_start=1
                     /transl_table=11
                     /product="2-C-methyl-D-erythritol 2,4-cyclodiphosphate
                     synthase"
                     /protein_id="NP_387972.1"
                     /db_xref="GI:16077159"
                     /db_xref="GOA:Q06756"
                     /db_xref="UniProtKB/Swiss-Prot:Q06756"
                     /db_xref="GeneID:936634"
                     /translation="MFRIGQGFDVHQLVEGRPLIIGGIEIPYEKGLLGHSDADVLLHT
                     VADACLGAVGEGDIGKHFPDTDPEFKDADSFKLLQHVWGIVKQKGYVLGNIDCTIIAQ
                     KPKMLPYIEDMRKRIAEGLEADVSQVNVKATTTEKLGFTGRAEGIAAQATVLIQKG"
`

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
