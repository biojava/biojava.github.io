---
title: BioJava:Cookbook:Locations:Filter
---

How can I filter Features by type?
----------------------------------

If you have just parsed a detailed Genbank file you will end up with a
Sequence that contains several Features of different types. It may be
that you are only interested in Features of the type "CDS" for example.
To filter the Features you would use a FeatureFilter which can be used
to generate a FeatureHolder containing only the Features that get past
the FeatureFilter.

The following example shows the use of a "byType" FeatureFilter.

<java> import java.util.\*;

import org.biojava.bio.seq.\*;

public class FilterByType {

` public static void main(String[] args) {`  
`   Sequence seq = null;`

` /*`  
`  * code here to intitailize seq with numerous different features`  
`  * possibly by reading a Genbank or similar file.`  
`  *`  
`  */`

`   //make a Filter for "CDS" types`  
`   FeatureFilter ff = new FeatureFilter.ByType("CDS");`

`   //get the filtered Features`  
`   FeatureHolder fh = seq.filter(ff);`

`   //iterate over the Features in fh`  
`   for (Iterator i = fh.features(); i.hasNext(); ) {`  
`     Feature f = (Feature)i.next();`  
`   }`  
` }`

} </java>
