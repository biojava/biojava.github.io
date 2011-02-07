---
title: BioJava:CookBook3:NCBIQBlastService
---

How can I use NCBI's QBlast to do my alignments remotely?
---------------------------------------------------------

BioJava now has some ability to use remote bioinformatics services to
execute tasks on servers and fetch the results for further use. The
first example of this new ability is the capacity to perform Blast
analysis via the QBlast service at NCBI. Not strictly speaking a web
service in the true sense of the word, QBlast takes specially formatted
HTTP requests to execute Blast searches on NCBI servers.

The QBlast BioJava classes implement a serie of interfaces:
RemotePairwiseAlignmentService, RemotePairwiseAlignmentProperties and
RemotePairwiseAlignmentOutputProperties. These interfaces are designed
in such a fashion that setting the parameters for alignement, submitting
the results and fetching the results in a desired format are done
independently from each other. This allows a program to send a bunch of
requests, grab the requests ID and fetch the results at a later time.

To use QBlast, you use a NCBIQBlastService object (which implements
RemotePairwiseAlignmentService) to manage the connection to the QBlast
service, submission of requests and fetching of results. To do so, it
needs a sequence (represented by either a string, a RichSequence object
or a GID) and a NCBIQBlastAlignmentProperties object. This class
implements RemotePairwiseAlignmentProperties and it is use to set which
program and which database to use for the analysis. Right now, it can't
much make use of other parameters of the QBlast service but the methods
are in development to fix this situation. One would recover results
using the same RemoteQBlastService object, which hold submission
information, and an object of type NCBIQBlastOutputProperties to
specifiy the informations to recover and the format to present to the
submitter.

Using the interfaces found in package org.biojava3.ws.alignment should
allow extensions to other remote alignment services like FASTA and Blast
at EBI, which use web services.

WARNING (as of early February 2011):

- Only blastall programs are implemented. MegaBlast and blastpgp are
high in the TO DO list.

- Basic sanity checks are in place so that you won't try to use blastn
on a ProteinSequence object...

- Do not use multiple threads to send loads of requests to NCBI. This
would only get you into trouble, up to getting blacklisted by NCBI.

<java>

import java.io.BufferedReader; import java.io.File; import
java.io.IOException; import java.io.InputStream; import
java.io.InputStreamReader; import java.util.ArrayList; import
java.util.LinkedHashMap; import java.util.Map.Entry;

import org.biojava3.core.sequence.ProteinSequence; import
org.biojava3.core.sequence.io.FastaReaderHelper; import
org.biojava3.ws.alignment.qblast.NCBIQBlastService; import
org.biojava3.ws.alignment.qblast.NCBIQBlastAlignmentProperties; import
org.biojava3.ws.alignment.qblast.NCBIQBlastOutputProperties; import
org.biojava3.ws.alignment.qblast.NCBIQBlastOutputFormat;

public class NCBIQBlastServiceTest {

`   /**`  
`    * The program take only a string with a path toward a sequence file`  
`    * `  
`    * For this example, I keep it simple with a single FASTA formatted file`  
`    * `  
`    */`  
`   public static void main(String[] args) {`  
  
`       NCBIQBlastService rbw;`  
`             NCBIQBlastAlignmentProperties rqb;`  
`             NCBIQBlastOutputProperties rof;`  
`       InputStream is;`  
`       ArrayList`<String>` rid = new ArrayList`<String>`();`  
`       String request = "";`  
  
`       try {`

`           // Let's capture the sequences in a file...`  
`           LinkedHashMap`<String, ProteinSequence>` a = FastaReaderHelper.readFastaProteinSequence(new File(args[0]));`  
`                       `  
`           /*`  
`            * You would imagine that one would blast a bunch of sequences of`  
`            * identical nature with identical parameters...`  
`            */`  
`           rbw = new NCBIQBlastService();`  
`           rqb = new NCBIQBlastAlignmentProperties();`

`           rqb.setBlastProgram("blastp");`  
`           rqb.setBlastDatabase("nr");`  
`                       `  
`           /*`  
`            * First, let's send all the sequences to the QBlast service and`  
`            * keep the RID for fetching the results at some later moments`  
`            * (actually, in a few seconds :-))`  
`            *`  
`            * Using a data structure to keep track of all request IDs is a good`  
`            * practice.`  
`            *`  
`            */`  
`           for (Entry`<String, ProteinSequence>` entry : a.entrySet()) {`  
`               System.out.println( entry.getValue().getOriginalHeader() + "\n");`  
`               request = rbw.sendAlignmentRequest(entry.getValue(),rqb);`  
`               rid.add(request);`  
`           }`

`           /*`  
`            * Let's check that our requests have been processed. If completed,`  
`            * let's look at the alignments with my own selection of output and`  
`            * alignment formats.`  
`            */`  
`           for (String aRid : rid) {`  
`               System.out.println("trying to get BLAST results for RID "`  
`                       + aRid);`  
`               boolean wasBlasted = false;`  
  
`               while (!wasBlasted) {`  
`                   wasBlasted = rbw.isReady(aRid, System.currentTimeMillis());`  
`               }`  
  
`               rof = new NCBIQBlastOutputProperties();`  
`               rof.setOutputFormat(NCBIQBlastOutputFormat.TEXT);`  
`               rof.setAlignmentOutputFormat(NCBIQBlastOutputFormat.PAIRWISE);`  
`               rof.setDescriptionNumber(10);`  
`               rof.setAlignmentNumber(10);`  
  
`               /*`  
`                * Simply to show you that your output options were followed`  
`                * `  
`                */ `  
`               is = rbw.getAlignmentResults(request, rof);`  
  
`               BufferedReader br = new BufferedReader(`  
`                       new InputStreamReader(is));`  
  
`               String line = null;`  
  
`               while ((line = br.readLine()) != null) {`  
`                   System.out.println(line);`  
`               }`  
`           }`  
`       }`  
`       /*`  
`        * What happens if the file can't be read`  
`        */`  
`       catch (IOException ioe) {`  
`           ioe.printStackTrace();`  
`       }`  
`       /*`  
`        * What happens if FastaReaderHelper hits a snag`  
`        */`  
`       catch (Exception bio) {`  
`           bio.printStackTrace();`  
`       }`  
`   }`

} </java>