---
title: BioJava:CookBook:Core:Sequences
---

is is fairly straightforward to create sequences. Take a look at these
examples:

Sequence objects can be created by providing a string representation as
an input to the constructor:

<java> ProteinSequence seq = new
ProteinSequence("MSTNPKPQRKTKRNTNRRPQDVKFPGG"); </java>

Fetch a protein sequence based on a UniProt accession code from UniProt.
<java> String uniProtID = "P26663";

// we will tell the UniProt proxy class that we are expecting a sequence
that is an amino acid AminoAcidCompoundSet set =
AminoAcidCompoundSet.getAminoAcidCompoundSet();

// now load the sequence from the UniProt website
UniprotProxySequenceReader<AminoAcidCompound> uniprotSequence = new
UniprotProxySequenceReader<AminoAcidCompound>(uniProtID,set);

// and make a protein sequence out of it ProteinSequence seq = new
ProteinSequence(uniprotSequence); </java>
