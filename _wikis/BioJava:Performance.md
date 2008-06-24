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

[Run
Example](http://www.biojava.org/download/performance/biojava-test.jnlp)
(download includes the 47MB file containing the genome sequence).

[View Source](BioJava:Performance:ReadDrosophila "wikilink")

Results:

| System                    | Speed   | Memory |
|---------------------------|---------|--------|
| Average Linux workstation | 16 sec. | 95 MB  |
| Old PowerBook G4          | 87 sec. | 81 MB  |

Reverse complement of DNA sequence
----------------------------------

Read DNA sequence and write their reverse complement. This is based on
the benchmark provided
at:[<http://shootout.alioth.debian.org/gp4/benchmark.php?test=revcomp&lang=all>](http://shootout.alioth.debian.org/gp4/benchmark.php?test=revcomp&lang=all)

read line-by-line a redirected FASTA format file.

for each sequence: write the id, description, and the reverse-complement
sequence in FASTA format

[Run
Example](http://www.biojava.org/download/performance/biojava-revcomp.jnlp)

[View Source](BioJava:Performance:ReverseComplement "wikilink")

Results:

| System                                       | Speed   | Memory |
|----------------------------------------------|---------|--------|
| Intel(R) Pentium(R) Dual CPU E2160 @ 1.80GHz | 1.1 sec |        |
| Old PowerBook G4                             |         |        |

Calculate structure alignment of Myoglobin and Haemoglobin
----------------------------------------------------------

Calculate a protein structure alignment for Myoglobin (PDB code: 2jho)
and Haemoglobin (PDB code: 2hhb). The matches to the 4 chains in
Haemoglobin are identified as different alternate solutions.

[Run
Example](http://www.biojava.org/download/performance/biojava-structure-example1.jnlp)
(5MB download includes Jmol for visualization)

[View Source](BioJava:Performance:AlignMyoHemo "wikilink")

Results:

| System                    | Speed   | Memory    |
|---------------------------|---------|-----------|
| Average Linux workstation | 4 sec.  | \< 100 MB |
| Old PowerBook G4          | 26 sec. | \< 100 MB |


