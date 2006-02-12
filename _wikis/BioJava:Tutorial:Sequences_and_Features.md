---
title: BioJava:Tutorial:Sequences and Features
tags:
 - Tutorial
---

**By [Thomas Down](mailto:td2@sanger.ac.uk)**

[Chapter 1](BioJava:Tutorial:Symbols and SymbolLists "wikilink") of this
tutorial covered the `SymbolList` interface, BioJava's basic
representation of biological sequence data. This chapter examines the
`Sequence` interface. This adds extra functionality to `SymbolList`,
providing a convenient way to handle annotated sequences from biological
database. This chapter concentrates on classes and interfaces defined in
the package `org.biojava.bio.seq`. For full descriptions of all the API
used here, please consult the .

A tour of a Sequence
--------------------

`Sequence` is a sub-interface of `SymbolList`. Thus, all the standard
methods for accessing sequence data in a symbol list can equally be
applied to a sequence, and sequences can be passed to any analysis
methods which normally expect to receive a symbol list. The `Sequence`
interface adds two types of additional data to a symbol list:

-   Global annotations, such as names, database identifiers, and
    literature references
-   Location-specific annotations (so called *features*)

Two pieces of global annotation information are considered to be
sufficiently important that they have dedicated accessor methods. The
`name` of the sequence is a simple string description of the sequence:
normally the name or accession number of the sequence in the database
from which it is retrieved. The `getURN` method, on the other hand,
should return a more structured identifier for the sequence, represented
as a *Uniform Resource Identifier* (URI) e.g.:

-   `urn:sequence/embl:AL121903`
-   `file:///home/thomas/genome.fasta|rpoN`
-   `<nowiki>http://adzel.casseiopeia.org/seqs/myseqs.fasta|seq0001</nowiki>`
-   `acedb://humace.sanger.ac.uk/DNA/AL121903`

URNs are a special class of URIs which represent global names for 'well
known' resources. Note that, despite the method name, it may not be
appropriate to give an actual URN for sequences. However, for sequences
from databases such as EMBL, where many sites have local installations,
use of URNs is encouraged.

The exact use of the name and URN properties is currently dependent to
some extent on how the sequence was loaded. As BioJava enters more
common use, more formal definitions of these properties will emerge.

Other annotations
-----------------

In additions to the two 'identifier' properties of the sequence, it may
have other annotation data associated with it. BioJava contains an
`Annotation` interface, which represents a set of key-value pairs, a
little like a Java `Map` (indeed, Annotation has an `asMap` method).

    Sequence seq = getSequence();
    Annotation seqAn = seq.getAnnotation();
    for (Iterator i = seqAn.keys().iterator(); i.hasNext(); ) {
        Object key = i.next();
        Object value = seqAn.getProperty(key);
        System.out.println(key.toString() + ": " + value.toString());
    }

`Annotation` objects aren't just used in sequences - many other BioJava
objects, including `Features`, can also have annotations associated with
them.

Currently, there are no specific conventions for the kind of data which
might be found in an annotation. In general, the keys should be strings
(although there is no requirement that this be the case). But the values
may be any Java object. More guidelines for the contents of `Annotation`
objects may be introduced as BioJava develops.

Features and FeatureHolders
---------------------------

A feature represents a region of a sequence with some defined properties
attached. Typically, features might represent structures such as genes
and repeat elements on chromosomes, or alpha helices in proteins. As a
Java interface, `Feature` has the following basic properties:

-   A location within the sequence, represented by a `Location` object.
    This has a defined start and end (equal in the case of point
    locations), and may or may not be contiguous.
-   A type (for instance, "gene" or "helix").
-   A source (often the name of the program which discovered the
    feature.
-   An `Annotation` object, which can contain any other data.

In addition, all features have a place in a 'tree' of features, attached
to a sequence. Features cannot be created independently of a sequence.

If a large class of features exists which have important properties over
and above those represented in the `Feature` interface, a sub-interface
of `Feature` may be defined. Currently, there is only one such
sub-interface in the BioJava core: `StrandedFeature`. This is used for
features in duplex DNA which have a defined directionality. For
instance, genes would normally be represented with `StrandedFeature`,
while some kinds of regulatory region might be plain features.

Sets of features are stored in objects implementing the `FeatureHolder`
interface. `Sequence` is a sub-interface of `FeatureHolder`. `Feature`
itself also extends `FeatureHolder`, giving the possibility of
representing 'nested' features. For instance, a feature representing a
large genetic regulatory region might contain sub-features annotating
individual transcription factor binding sites. The recursive method
below will print a simple text representation of a tree of features:

    public void printFeatures(FeatureHolder fh, PrintWriter pw, String prefix)
    {
        for (Iterator i = fh.features(); i.hasNext(); ) {
            Feature f = (Feature) i.next();
        pw.print(prefix);
        pw.print(f.getType());
        pw.print(" at ");
        pw.print(f.getLocation().toString());
        pw.println();
        printFeatures(f, pw, prefix + "    ");
        }
    }

All `Feature` implementations include two methods which indicate how it
fits into a feature tree. `getParent` returns the `FeatureHolder` object
(`Sequence` or `Feature`) which is the feature's immediate parent, while
`getSequence` returns the `Sequence` object which is the root of the
tree. `Feature` objects are always associated with a specific sequence,
and always have exactly one parent `FeatureHolder`.

Creating new features
---------------------

It is expected that there will never be any publicly visible
implementations of `Feature` or its sub-interfaces. Instead, features
should be produced using the `createFeature` method of a `FeatureHolder`
object. This ensures that there are no 'orphan' features, not properly
attached to a parent sequence. It also gives `Sequence` implementors the
chance to control the attachment of features to their sequence class.
Some sequences may only accept certain kinds of features. Other
implementations, especially those intimately coupled with database
storage mechanisms, may wish to use their own special implementations of
the `Feature` interface.

The `createFeature` method has the following signature:

    public Feature createFeature(Feature.Template template);

there is no requirement that a particular `FeatureHolder` object should
include a working implementation of this method. If it is not possible
to create a new child feature, `UnsupportedOperationException` will be
thrown. In particular, this method is only implemented by `Sequence` and
`Feature` objects. When `FeatureHolder` instances are used to return
arbitrary 'bags' of features, they will never support this method.

`Feature.Template` is a concrete nested class of the `Feature`
interface. It just contains public fields corresponding to each property
of `Feature`. A feature could be attached to a sequence as follows:

    Feature.Template template = new Feature.Template();
    template.type = "TestFeature";
    template.source = "Test";
    template.location = new RangeLocation(100, 200);
    template.annotation = Annotation.EMPTY_ANNOTATION;
    mySequence.createFeature(template);

Every sub-interface of `Feature` should have a nested class, also named
`Template`, which extends `Feature.Template` and adds any extra fields
needed to construct that specialized kind of feature.
