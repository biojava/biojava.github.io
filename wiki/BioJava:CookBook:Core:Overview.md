---
title: BioJava:CookBook:Core:Overview
---

**Draft copy of Core module design and capabilities.**

When doing the analysis of code from Biojava 1 and what should be done
in Biojava3 and emphasis was placed on breaking the code into modules.
Thus core represent a collection of classes that would be common to
other modules. The common elements for all modules is reading, writing
and representation of sequence data. We also thought it was important to
use Java to model the biological relationships between sequences as
accurately as possible. The Biojava3 api should establish concrete
relationships that help the computer scientist understand the biology
through code and be familiar to the Biologist when writing code.

In the genomic view of sequence data we now have very large data sets
which presents challenges in loading everything into memory or
retreating to a database and let it handle that complexity. We want to
allow easy integration of sequence databases such as BioSQL but at the
same time support large sequence datasets loaded from disk or accessed
via web services. This is why the Sequence Interface reigns supreme! By
modeling the relationships between a ProteinSequence and a GeneSequence
it isn't unreasonable to expect that if you load a protein sequence with
an accession id that you should be able to use a method in the protein
sequence to retrieve the gene sequence that codes for that protein
sequence. Once you have the gene sequence you should be able to easily
extract intron sequences or sequence data flanking the gene sequence for
analysis. By leveraging the REST or Web Services of public data sources
like Uniprot or NCBI we want the api to hide these implementation
details but offer enough flexibility that other public or prive data
sources can be easily integrated into BioJava3.

An additional design goal is to keep the size of biojava3-core module as
small as possible by not making it a convient place to add in new
classes that do not directly relate to protein or DNA sequences or
become dependent on external jar files. As an example we are currently
using Java 6 XML api to process XML files which has performance issues
as compared to Dom4J. It is tempting to make Dom4J a standard library in
BioJava3 because of its speed and api but it is no longer being actively
developed. We are using the Java 6 api for REST or WebService calls
where we could use Axis or some other interesting 3rd party library.
Before you realize it core has a large number of external dependencies
which creates potential problems for developers who are using the
Biojava3 api in their application if a different version of an external
api is required. For now Core is all about sequences and keeping it as
small as possible. Currently, the biojava3-core module is being
developed as part of the day job for two developers with tight deadlines
and never enough time to do extensive documentation or even minimal
documentation. Now that the biojava3-core module is settling down we
will be working on finishing the JavaDoc, adding additional test cases
and providing examples in the wiki.

The core sequence classes
-------------------------

-   AbstractSequence
    -   DNASequence
        -   ChromosomeSequence
        -   GeneSequence
        -   IntronSequence
        -   ExonSequence
        -   TranscriptSequence
    -   RNASequence
    -   ProteinSequence

String is King but Sequence Interface reigns supreme
----------------------------------------------------

We really want to make it easy to create a sequence and what could be
easier than using a String.

<java>

`           ProteinSequence proteinSequence = new ProteinSequence("ARNDCEQGHILKMFPSTWYVBZJX");`  
`           DNASequence dnaSequence = new DNASequence("ATCG");`

</java>

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
papers. This also allows us to link the Uniprot ID to the NCBI ID and
retrieve the gene sequence data from NCBI via the
NCBIProxySequenceReader. We are still in the early stages of extending
these sequence relationships and expect some api changes. The
abstraction of the sequence storage to an interface allows for a great
deal of flexibility but has also added some challenges in how to handle
situations when something goes wrong and you need to throw an exception.
By introducing the ability to load sequences from remote URLs when the
internet is not working or you have implemented a lazy instantiation
approach to loading sequence data we have made it difficult to handle
error conditions without making every method throw an exception. This a
design work in progress as we get feedback from developers and expect
some level of api changes as we improve the overall design.

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

Helper Classes make it easy
---------------------------

In an effort to provide a flexible and modular api the abstraction can
often make it difficult for someone getting started with the api to know
what to use. We are implementing a set of classes that have the word
Helper in them to hide the abstraction and at the same time provide
examples on how to use the underlying API. Typically the helper methods
will be static methods and generally should be a small block of glue
code. The following code shows the use of FastaReaderHelper and
FastaWriterHelper.

<java>

`       LinkedHashMap`<String, DNASequence>` dnaSequences = FastaReaderHelper.readFastaDNASequence(new File("454Scaffolds.fna"));`  
`       FastaWriterHelper.writeNucleotideSequence(new File("454Scaffolds-1.fna"),dnaSequences.values());`

</java>

### Indexing Sequences By Length

Sometimes it is useful to index a set of sequences by their length.
Avoid using any kind of String method to do this since String operations
are costly in BioJava (due to the String conversion that must be
applied). Here is an example on how to do it for any Sequence object.

<java> List<Sequence<AminoAcidCompound>\> translations =
populateFromSomewhere(); Collections.sort(translations, new
Comparator<Sequence<? extends Compound>\>() {

`public int compare(Sequence`<? extends Compound>` o1, Sequence`<? extends Compound>` o2) {`  
`  Integer o1Length = o1.getLength();`  
`  Integer o2Length = o2.getLength();`  
`  return o1Length.compareTo(o2Length);`  
`}`

}); </java>

Note our usage of the generic type to capture Sequence objects of any
type since the assessment of length is something which can be applied to
any Sequence not just AminoAcidCompound sequences.

DNA Translation
---------------

DNA translation follows the normal biological flow where a portion of
DNA (assumed to be CDS) is translated to mRNA. This is translated to a
protein sequence using codons. All parts of the translation process are
configurable including:

-   CompoundSets used in the Sequence objects
-   The SequenceCreator used
-   The Frame and direction of translation
-   Trimming stop codons
-   IUPAC codon tables

### Quick and Dirty

The following translates the given DNASequence to a peptide using the
non-ambiguity CompoundSets with Codon table 1 in Frame 1 in the forward
orientation.

<java>

` ProteinSequence protein = new DNASequence("ATG").getRNASequence().getProteinSequence();`

</java>

### Translating in a Different Frame

A common feature of transcription is the ability to specify the base at
which we start translating from DNA to RNA which in turn has an effect
on how we convert the resulting RNA into a protein. This can be the
difference between a working translation and one full of gibberish. The
Frame enum provides all 6 available frames which can be given to the DNA
object when we request the RNA. Multiple frames of translations are
possible but see later on.

<java>

` DNASequence dna = new DNASequence("AATG");`  
` RNASequence rna = dna.getRNASequence(Frame.TWO);`  
` ProteinSequence protein = rna.getProteinSequence();`

</java>

### Translating in Multiple Frames

This requires a TranscriptionEngine but we will work with the default
one for the moment. If you are unsure of the frame a portion of DNA is
to be translated in you can specify a number of frames to perform the
translation in. The following example attempts to translate a sequence
in all three forward frames. The code returns a map of the results keyed
by their frame.

<java> TranscriptionEngine te = TranscriptionEngine.getDefault();
Frame[] frames = Frame.getForwardFrames();
Map<Frame, Sequence<AminoAcidCompound>\> results =
te.multipleFrameTranslation(dna, frames); </java>

Using this we can replicate the functionality found in EMBOSS' transeq
package.

### Using a TranscriptionEngine

Transcription engines are the workhorse of the translation process. If
you want to do something \_out of the ordinary\_ then normally you will
have to build one. A singleton version is available and is what the
methods involved in the translation process use when not given an
instance of TranscriptionEngine. If building a custom engine then you do
this using the Builder object as shown in the following example. Here we
will build an engine to

-   Translate bacteria genomes
-   Convert any initiating amino acid which is not methionine into one
-   Trim stops

<java> TranscriptionEngine.Builder b = new
TranscriptionEngine.Builder(); b.table(11).initMet(true).trimStop(true);
TranscriptionEngine engine = b.build(); </java>

This can be handed to the translation methods like so:

<java>

` DNASequence dna = new DNASequence("ATG");`  
` RNASequence rna = dna.getRNASequence(engine);`  
` ProteinSequence protein = rna.getProteinSequence(engine);`

</java>

The translation can be started from the TranscriptionEngine directly
except this results in more general objects (you will get back objects
which implement the Sequence interface and not the true object type).

<java>

` DNASequence dna = new DNASequence("ATG");`  
` TranscriptionEngine engine = TranscriptionEngine.getDefault(); //Get the default engine`  
` Sequence`<NucleotideCompound>` rna = engine.getDnaRnaTranslator().createSequence(dna);`  
` Sequence`<AminoAcidCompound>` protein = engine.getRnaAminoAcidTranslator().createSequence(rna);`  
` `  
` //Or to jump to it straight away use this method (coming soon)`  
` Sequence`<AminoAcidCompound>` protein = engine.translate(dna);`

</java>

### Codon Tables

BioJava supports all IUPAC tables available from the
`org.biojava3.core.sequence.io.IUPACParser` class. It is possible to
define your own codon table should BioJava not support it. To do this
you can use the `IUPACTable` object which accepts 3 Strings used to
indicate the DNA used for each codon. If this does not suffice then you
can implement your own instance of `Table` to return the required
codons. The IUPAC tables we have are:

-   1 - UNIVERSAL
-   2 - VERTEBRATE\_MITOCHONDRIAL
-   3 - YEAST\_MITOCHONDRIAL
-   4 - MOLD\_MITOCHONDRIAL
-   5 - INVERTEBRATE\_MITOCHONDRIAL
-   6 - CILIATE\_NUCLEAR
-   9 - ECHINODERM\_MITOCHONDRIAL
-   10 - EUPLOTID\_NUCLEAR
-   11 - BACTERIAL
-   12 - ALTERNATIVE\_YEAST\_NUCLEAR
-   13 - ASCIDIAN\_MITOCHONDRIAL
-   14 - FLATWORM\_MITOCHONDRIAL
-   15 - BLEPHARISMA\_MACRONUCLEAR
-   16 - 2CHLOROPHYCEAN\_MITOCHONDRIAL
-   21 - TREMATODE\_MITOCHONDRIAL
-   23 - SCENEDESMUS\_MITOCHONDRIAL

Ambiguous Symbols
-----------------
