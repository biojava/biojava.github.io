---
title: BioJava:Modules
---

BioJava Modules
===============

The following list of modules for BioJava have been defined and the
following people have stepped up to become module leader:

Module: biojava-core Lead: Andreas Prlic

`- break the new modules out of core`  
`- bring up to modern Java standards, use Generics`  
`- declare old/unused code obsolete`  
`- don;t break backwards compatibility`

Module: biojava-sequence Lead: Richard Holland

`- Bring in Richard's new code that he started to develop on the biojava-3 branch.`  
`- provide a more scaleable and efficient basis for dealing with large sequence files`  

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

Module: biojava-structure Lead: Andreas Prlic

`- add support for SCOP file parsing`  
`- add support for easy access of domains (in terms of coordinates)`  
`- add secondary structure assignment`  
`- improve structure alignments`  
`- better integration with 3D viewers (Jmol, RCSB viewers)`

Module: biojava-sequencing Lead: Michael Heuer

`- support FastQ files`  
`- support parsing of output for various new sequencing machines`

Module: biojava-web services:

`- The details seem still to be under discussion and perhaps we need multiple modules here?`  
`- also what about REST vs. SOAP? To be discussed. People who expressed interest are:`  
`- Niall Haslam,Scooter Willis, Sylvain Foisy`

Module?: biojava-ws-blast Module?: biojava-ws-biolit

Proposed Module: biojava-j2ee Lead: Mark Schreiber

`- This would probably take the form of SessionBeans and WebServices that can be deployed to Glassfish/ JBoss etc to provide biological services  for people who want to make client server or SOA apps.`
