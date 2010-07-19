---
title: BioJava:CookBook:Core:Overview
---

**Draft copy of Core module design and capabilities.**

When doing the analysis of code from Biojava 1 and emphasis was placed
on breaking the code into modules. Thus core represent a collection of
classes that would be common to other modules. The common elements for
all modules is reading, writing and representation of sequence data. We
have also placed an emphasis of modeling in Java the biological
relationships between sequences as accurately as possible. In the
genomic view of sequence data we now have very large data sets where it
isn't unreasonable to expect that if you load a protein sequence with an
accession id that you should be able to use the api to retrieve the gene
sequence that codes for that protein sequence. Once you have the gene
sequence you should easily extract intron sequences or sequence data
flanking the gene sequence for analysis. By leveraging the REST or Web
Services of public data sources like Uniprot or NCBI we want the api to
hide these implementation details but offer enough flexibility that
other public or prive data sources can be easily integrated into
BioJava3.

The core sequence classes

-   DNASequence
    -   ChromosomeSequence
    -   GeneSequence
    -   IntronSequence
    -   ExonSequence
    -   TranscriptSequence
-   RNASequence
-   ProteinSequence

The storage of the sequence data is defined by the Sequence interface
which allows for some interesting and we hope useful abstraction. The
simplest Sequence interface to represent a sequences as a String is the
ArrayListSequenceReader and is the default data store when creating a
sequence from a string. For large genomic data you can create a
ChromosomeSequence from a TwoBitSequenceReader or FourBitSequenceReader
and reduce the in memory storage requirements. By using the Sequence
Interface we can easily extend the concept of local sequence storage in
a fasta file to loading the sequence from Uniprot or NCBI based on an
accession ID. The following is a simple example of creating a
ProteinSequence using a Uniprot ID where the UniprotProxySequenceReader
implements the Sequence interface and knows how to take the Uniprot ID
and retrieve the sequence data from Uniprot. The
UniprotProxySequenceReader can implement other feature interfaces and
using the XML data that describes the Protein Sequence we can give a
list of known mutations or mutagenenis studies with references to
papers. This also allows us to link the Uniprot ID to the NCBI id and
retrieve the gene sequence data from NCBI via the
NCBIProxySequenceReader. We are still in the early stages of extending
these sequence relationships and expect some api changes the abstraction
of the sequence storage to an interface allows for a great deal of
flexibility.

<java>

`           UniprotProxySequenceReader`<AminoAcidCompound>` uniprotSequence = new UniprotProxySequenceReader`<AminoAcidCompound>`("YA745_GIBZE", AminoAcidCompoundSet.getAminoAcidCompoundSet());`  
`           ProteinSequence proteinSequence = new ProteinSequence(uniprotSequence);`

</java>

The use of the SequenceCreator interface also allows us to address large
genomic data sets where the sequence data is loaded from a fasta file
but done in a way where the sequence is loaded in a lazy fashion when
the appropriate method for sequence data or sub-sequence data is needed.
The FileProxyProteinSequenceCreator implements the Sequence interface
but is very specific to learning the location of the sequence data in
the file.

<java>

`           File file = new File(inputFile);`  
`           FastaReader`<ProteinSequence,AminoAcidCompound>` fastaProxyReader = new FastaReader`<ProteinSequence,AminoAcidCompound>`(file, new GenericFastaHeaderParser`<ProteinSequence,AminoAcidCompound>`(), new FileProxyProteinSequenceCreator(file, AminoAcidCompoundSet.getAminoAcidCompoundSet()));`  
`           LinkedHashMap`<String,ProteinSequence>` proteinProxySequences = fastaProxyReader.process();`

`           for(String key : proteinProxySequences.keySet()){`  
`               ProteinSequence proteinSequence = proteinProxySequences.get(key);`  
`               System.out.println(key);`  
`               System.out.println(proteinSequence.toString());`  
`           }`

</java>

In the above example a FastaReader class is created where we abstract
out the code that is used to parse the Fasta Header and use
FileProxyProteinSequenceCreator to learn the beginning and ending offset
location of each protein sequence. When the fasta file is parsed instead
of loading the sequence data for each sequence into a ProteinSequence
using an ArrayListSequenceReader a SequenceFileProxyLoader is used
instead. A SequenceFileProxyLoader is created for each sequence and
stores the beginning and ending index of each sequence in the fasta
file. When sequence data is needed for a ProteinSequence then
SequenceFileProxyLoader will use Random I/O and seek to the offset
position and return the sequence data. The current implementation of
SequenceFileProxyLoader will load the protein sequence data when needed
and retain in memory which works great if you are only interested in a
subset of sequences. If the application using the API is going to
iterate through all sequences in a large fasta file then in the end all
sequence data would be loaded into memory. The SequenceFileProxyLoader
could be easily extended to maintain a max number of sequences loaded or
memory used and free up sequence data that is loaded into memory. This
way you can implement the appropriate cacheing algorithm based on the
usage of the sequence data.
