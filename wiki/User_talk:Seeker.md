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
the following text fragment:

`
 ...
  FEATURES           Location/Qualifiers
     source          1..4214630
                     /organism="Bacillus subtilis subsp. subtilis str. 168"
                     /mol_type="genomic DNA"
                     /strain="168"
                     /db_xref="taxon:224308"
     gene            4866..6782
                     /gene="gyrB"
                     /locus_tag="BSU00060"
                     /note="synonym: novA"
                     /db_xref="GeneID:939456"
     CDS             4866..6782
                     /gene="gyrB"
                     /locus_tag="BSU00060"
                     /EC_number="5.99.1.3"
                     /function="initation of replication cycle and DNA
                     elongation"
                     /note="decatenates newly replicated chromosomal DNA and
                     relaxes positive and negative DNA supercoiling"
                     /codon_start=1
                     /transl_table=11
                     /product="DNA topoisomerase IV subunit B"
                     /protein_id="NP_387887.1"
                     /db_xref="GI:16077074"
                     /db_xref="GOA:P05652"
                     /db_xref="UniProtKB/Swiss-Prot:P05652"
                     /db_xref="GeneID:939456"
                     /translation="MEQQQNSYDENQIQVLEGLEAVRKRPGMYIGSTNSKGLHHLVWE
                     IVDNSIDEALAGYCTDINIQIEKDNSITVVDNGRGIPVGIHEKMGRPAVEVIMT"
 ...
`

I used the followng code to get values of notes **/function**, **/note**
and **/translation** of the FEATURE Field:

<java>

RichSequenceIterator seqs = RichSequence.IOTools.readGenbankDNA(br, ns);
RichSequence seq = seqs.nextRichSequence();

Iterator fsit = seq.getFeatureSet().iterator(); RichFeature rf =
(RichFeature) fsit.next();

Set noteSet = rf.getNoteSet(); Iterator nit = noteSet.iterator();

String function = "", note = "";

while (nit.hasNext()) {

` if (fType.equals("CDS")) {`

`   if (snTermName.equals("function")) {`

`     function = sn.getValue();`  
`     System.out.println("Function:\n" + function);`  
`   } else if (snTermName.equals("note")) {`

`     note = sn.getValue();`  
`     System.out.println("Note:\n" + note);`  
`   } else if (snTermName.equals("translation")) {`

`     translation = sn.getValue();`  
`     System.out.println("Translation:\n" + translation);`  
`   }`  
` }`

} </java>

The output was as follows:

<code>

`Function:`  
`initation of replication cycle and DNA`  
`elongation`  
`Note:`  
`decatenates newly replicated chromosomal DNA and`  
`relaxes positive and negative DNA supercoiling`  
`Translation:`  
`MEQQQNSYDENQIQVLEGLEAVRKRPGMYIGSTNSKGLHHLVWEIVDNSIDEALAGYCTDINIQIEKDNSITVVDNGRGIPVGIHEKMGRPAVEVIMT               `

\<\\code\>
