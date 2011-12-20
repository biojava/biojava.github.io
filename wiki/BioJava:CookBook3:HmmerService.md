---
title: BioJava:CookBook3:HmmerService
---

A simple demo that fetches a protein sequence from the UniProt web site,
submits it to the Hmmer3 service and prints the results.

<java> /\*

`* @since 3.0.3`  
`*/`  
`   public static void main(String[] args){`

`       try {`  
`           // first we get a UniProt sequence`  
`           String uniProtID = "P26663";`  
`           ProteinSequence seq = getUniprot(uniProtID);`

`           // now we submit this sequence to the Hmmer web site`  
`           HmmerScan hmmer = new RemoteHmmerScan();`

`           SortedSet`<HmmerResult>` results = hmmer.scan(seq);`

`           // let's print the obtained annotations`  
`           `  
`           System.out.println(String.format("#\t%15s\t%10s\t%s\t%s\t%8s\t%s",`  
`                   "Domain","ACC", "Start","End","eValue","Description"));`  
`           `  
`           int counter = 0;`  
`           for (HmmerResult hmmerResult : results) {`  
`               //System.out.println(hmmerResult);`

`               for ( HmmerDomain domain : hmmerResult.getDomains()) {`  
`                   counter++;`  
`                   System.out.println(String.format("%d\t%15s\t%10s\t%5d\t%5d\t%.2e\t%s",`  
`                           counter,`  
`                           hmmerResult.getName(), domain.getHmmAcc(), `  
`                           domain.getSqFrom(),domain.getSqTo(),`  
`                           hmmerResult.getEvalue(), hmmerResult.getDesc()`  
`                           ));`

`               }`

`           }`

`       } catch (Exception e) {`  
`           // TODO Auto-generated catch block`  
`           e.printStackTrace();`  
`       }`  
`   }`

`   /** Fetch a protein sequence from the UniProt web site`  
`    * `  
`    * @param uniProtID`  
`    * @return a Protein Sequence`  
`    * @throws Exception`  
`    */`  
`   private static ProteinSequence getUniprot(String uniProtID) throws Exception {`  
`       `  
`       AminoAcidCompoundSet set = AminoAcidCompoundSet.getAminoAcidCompoundSet();`  
`       UniprotProxySequenceReader`<AminoAcidCompound>` uniprotSequence = new UniprotProxySequenceReader`<AminoAcidCompound>`(uniProtID,set);`  
`       `  
`       ProteinSequence seq = new ProteinSequence(uniprotSequence);`  
`       `  
`       return seq;`  
`   }`

</java>

This will create this output:

    #            Domain        ACC  Start   End   eValue    Description
    1        HCV_capsid PF01543.11      2     115   0.00e+00    Hepatitis C virus capsid protein
    2          HCV_core PF01542.12    116     190   1.09e-43    Hepatitis C virus core protein
    3           HCV_env PF01539.11    193     382   0.00e+00    Hepatitis C virus envelope glycoprotein E1
    4           HCV_NS1 PF01560.11    386     729   0.00e+00    Hepatitis C virus non-structural protein E2/NS1
    5           HCV_NS2  PF01538.1    811    1005   0.00e+00    Hepatitis C virus non-structural protein NS2
    6     Peptidase_S29  PF02907.9   1056    1203   0.00e+00    Hepatitis C virus NS3 protease
    7        Flavi_DEAD  PF07652.8   1294    1355   8.20e-06    Flavivirus DEAD domain
    8          HCV_NS4a PF01006.14   1658    1711   7.20e-25    Hepatitis C virus non-structural protein NS4a
    9          HCV_NS4b PF01001.13   1728    1921   0.00e+00    Hepatitis C virus non-structural protein NS4b
    10         HCV_NS5a PF01506.13   1974    1996   2.10e-10    Hepatitis C virus non-structural 5a protein membrane anchor
    11      HCV_NS5a_1a  PF08300.7   2006    2067   1.40e-34    Hepatitis C virus non-structural 5a zinc finger domain
    12      HCV_NS5a_1b  PF08301.7   2068    2168   2.80e-45    Hepatitis C virus non-structural 5a domain 1b
    13       HCV_NS5a_C  PF12941.1   2179    2419   0.00e+00    HCV NS5a protein C-terminal region
    14           RdRP_3 PF00998.17   2422    2932   0.00e+00    Viral RNA dependent RNA polymerase
