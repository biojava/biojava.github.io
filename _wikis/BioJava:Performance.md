---
title: BioJava:Performance
---

BioJava performance examples
============================

All tests can be run using [Java Web
Start](http://java.sun.com/products/javawebstart/)

Read all chromosomes from Drosophila
------------------------------------

Read all chromosomes from Drosophila and print out their sizes:

[View Source](BioJava:Performance:ReadDrosophila "wikilink")

[Run
Example](http://www.biojava.org/download/performance/biojava-test.jnlp)
(download includes the 47MB file containing the genome sequence).

Results:

| System                    | Speed   | Memory |
|---------------------------|---------|--------|
| Average Linux workstation | 16 sec. | 95 MB  |
| Old PowerBook G4          | 87 sec. | 81 MB  |

Calculate structure alignment of Myoglobin and Haemoglobin
----------------------------------------------------------

Calculate a protein structure alignment for Myoglobin (PDB code: 2jho)
and Haemoglobin (PDB code: 2hhb). The matches to the 4 chains in
Haemoglobin are identified as different alternate solutions.

[View Source](BioJava:Performance:AlignMyoHemo "wikilink")

[Run
Example](http://www.biojava.org/download/performance/biojava-structure-example1.jnlp)
(5MB download includes Jmol for visualization)

Results:

| System                    | Speed   | Memory    |
|---------------------------|---------|-----------|
| Average Linux workstation | 4 sec.  | \< 100 MB |
| Old PowerBook G4          | 26 sec. | \< 100 MB |


