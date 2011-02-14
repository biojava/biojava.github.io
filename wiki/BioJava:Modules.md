---
title: BioJava:Modules
---

BioJava Modules
===============

The following list of modules for BioJava have been defined and the
following people have stepped up to become module leader:

BioJava 3.0
-----------

Module: biojava3-core Lead: Scooter Willis

Module: biojava3-structure Lead: Andreas Prlic

Module: biojava3-ws: Lead: Sylvain Foisy

Module: biojava3-alignment: Lead: Mark Chapman

Module: biojava3-protmod: Lead: Jianjiong Gao

Module: biojava3-phylo: Lead: Scooter Willis

Module: biojava3-genome: Lead: Any Yates

Legacy BioJava 1.8
------------------

Module: biojava-sequence Lead: Richard Holland

`- Bring in Richard's new code that he started to develop on the biojava-3 branch.`  
`- provide a more scaleable and efficient basis for dealing with large sequence files`  
`- consider implementation based on ParallelArray from JSR166 (extra166y package, see `[`http://gee.cs.oswego.edu/dl/concurrency-interest/`](http://gee.cs.oswego.edu/dl/concurrency-interest/)`)`  
`- consider implementation that supports MapReduce as in Apache Hadoop (http://hadoop.apache.org/)`

Module: biojava-alignment Lead: Andreas Dräger

`- refactoring of underlying data structures`  
`- allow better access to underlying dynamic programming data structures`  
`- allow more customizable display of pairwise alignments (HTML/plain text, etc)`

Module : biojava-blast Lead: Mark Schreiber

`- provide access to all details of the blast output`  
`- add support for RPS blast`

Module: biojava-phylo Lead: Scooter Willis

`- provide improved NJtree /Jalview`  

Module: biojava-biosql Lead: Richard Holland

`- merge the new biojava-sequence module with the current biojava-biosql code `  
`- Mark Schreiber wants to work on BioSQL/ JPA bindings`

Module: biojava-das : Lead: Jonathan Warren

`- probably deprecate the old DAS code in BJ and replace it with`  
`= the up to date Dasobert library`  
`-update dasobert code to 1.6 and make smaller`  
`-add further support for getting new information contained in the registry (validation, on the fly validation, sources by types and cvId).`

Module: biojava-structure Lead: Andreas Prlic

`- add secondary structure assignment`  
`- better integration with 3D viewers (Jmol, RCSB viewers)`

Module: biojava-sequencing Lead: Michael Heuer

`- merge FASTQ support from 1.7.1 branch to trunk`  
`- provide facade for Fastq --> Biojava sequence with quality scores`  
`- review FASTQ IO interfaces, compare design with Richard's biojava3`

Module: biojava-web services:

`- The details seem still to be under discussion and perhaps we need multiple modules here?`  
`- also what about REST vs. SOAP? To be discussed. People who expressed interest are:`  
`- Niall Haslam,Scooter Willis, Sylvain Foisy`

Module?: biojava-ws-blast Module?: biojava-ws-biolit

Proposed Module: biojava-j2ee Lead: Mark Schreiber

`- This would probably take the form of SessionBeans and WebServices that can be deployed to Glassfish/ JBoss etc to provide biological services  for people who want to make client server or SOA apps.`
