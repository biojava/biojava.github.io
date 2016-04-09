---
title: BioJava:Cookbook:Locations:Remove
---

How do I remove Features from a Sequence?
-----------------------------------------

When processing a Sequence object you may wish to delete some Features.
The following example, kindly donated by Keith James, shows how to
remove all of the Features that meet some specific requirement. In this
example all the Features on the positive strand of the Sequence are
erased.

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*;

public class RemoveFeatures {

`   public static void main(String [] argv) throws Exception`  
`   {`  
`       //read in an EMBL file`  
`       BufferedReader br = new BufferedReader(new FileReader(argv[0]));`  
`       SequenceIterator seqI = SeqIOTools.readEmbl(br);`

`       while (seqI.hasNext())`  
`       {`  
`           Sequence seq = seqI.nextSequence();`

`           //get all the features on the positive strand`  
`           FeatureHolder fh =`  
`               seq.filter(new FeatureFilter.StrandFilter(StrandedFeature.POSITIVE));`

`           //iterate through the features`  
`           for (Iterator i = fh.features(); i.hasNext();)`  
`           {`  
`               //and remove each one`  
`               seq.removeFeature((Feature) i.next());`  
`           }`

`           //finally write the edited sequence out`  
`           SeqIOTools.writeEmbl(System.out, seq);`  
`       }`  
`   }`

} </java>
