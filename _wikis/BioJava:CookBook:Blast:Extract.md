---
title: BioJava:CookBook:Blast:Extract
---

How Do I Extract Information From Search Results?
-------------------------------------------------

The Blast parsing and Fasta parsing procedures already discussed once
the file is parsed a List of SeqSimilaritySearchResult objects. One of
these is made per query. Each SeqSimilaritySearchResult contains a List
of SeqSimilaritySearchHit objects which detail the hit from the Query to
the Subject. Each SeqSimilaritySearchHit object contains a List of
SeqSimilaritySearchSubHit objects. These are equivalent to the HSPs
reported by BLAST.

The result, hit and subhits contain useful getXXX() methods to retrieve
the stored information.

The code snippet below shows a private method that would take a List
produced by a BLAST or FASTA parser and then extracts the hit id
(subject id), its bit score and its e score.

<java>

` private static void formatResults(List results){`

`   //iterate through each SeqSimilaritySearchResult`  
`   for (Iterator i = results.iterator(); i.hasNext(); ) {`  
`     SeqSimilaritySearchResult result = (SeqSimilaritySearchResult)i.next();`

`     //iterate through the hits`  
`     for (Iterator i2 = result.getHits().iterator(); i2.hasNext(); ) {`  
`       SeqSimilaritySearchHit hit = (SeqSimilaritySearchHit)i2.next();`

`       //output the hit ID, bit score and e score`  
`       System.out.println("subject:\t"+hit.getSubjectID() +`  
`                          " bits:\t"+hit.getScore()+`  
`                          " e:\t"+hit.getEValue());`  
`     }`  
`   }`  
` }`

</java>
