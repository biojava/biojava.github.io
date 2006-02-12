---
title: BioJava:Tutorial:Sequence IO basics
tags:
 - Tutorial
---

**By [Thomas Down](mailto:td2@sanger.ac.uk)**

This chapter covers the BioJava support for handling biological sequence
data available in the form of files. It covers API provided by the
package `org.biojava.bio.seq.io`. For a complete overview of the API
provided in this package, consult the .

**NOTE:** this chapter has been updated for BioJava release 1.2.

Getting started with sequence I/O
---------------------------------

The BioJava sequence I/O code is designed to be flexible and easy to
adapt for a wide variety of purposes. However, if you don't need this
flexibility, there are some convenience methods which set up the parsers
for reading a variety of common formats. All these methods take a Java
`BufferedReader` object, and return an iterator which allows you to scan
through the sequences in a file. For example:

    BufferedReader br = new BufferedReader(new FileReader(fileName));
    SequenceIterator stream = SeqIOTools.readFastaDNA(br);
    while (stream.hasNext()) {
        Sequence seq = stream.nextSequence();
        // do something with the sequence.
    }

For a full list of formats supported in this way, check the Javadoc
documentation for the `SeqIOTools` class.

Sequence input goals
--------------------

A typical biological sequence file contains three things:

-   Global information about the sequence (ID, species, etc.)
-   Annotations to specific regions of the sequence.
-   Actual sequence data

Actual file formats need not provide all of these. For instance, FASTA
files contain almost pure sequence data -- the only other information is
a single description line for each sequence. At the other extreme, GFF
files are simply a list of features, with no sequence data in the file.

A BioJava Sequence object contains the same kinds of information as a
sequence file. The primary aim of the input architecture is obviously to
take a stream containing sequence file data, and return one or more
`Sequence` objects. In addition, there are two other goals:

Decoupled `Sequence` creation: BioJava represents sequence data using the `Sequence` interface. We allow multiple implementations of this interface, which might be optimized for quite specific purposes. Some implementations will be purely in-memory objects, while others might be persistant objects reflecting data in some kind of database. We want to allow you to create any kind of `Sequence` object from a given data stream.  

<!-- -->

Pluggable filters: Not all users will wish to exactly reflect the contents of a sequence file as a `Sequence` object. Sometimes it is useful to select specific pieces of data from a file, or to change it into some other format. For instance, BioJava has a hierarchical model for features attached to a sequence, whereas many file formats (for instance, EMBL) do not. You might wish to rebuild some kind of feature hierarchy from an EMBL flatfile during the parsing process.  

SequenceBuilders
----------------

The sequence input framework is based around the SequenceBuilder
interface (this is actually a sub-interface of SeqIOListener, but for
these purposes you will usually be using SequenceBuilder). The role of a
SequenceBuilder is to accumulate information discovered while parsing a
sequence file, and ultimately to construct a Sequence object.

There are two kinds of SequenceBuilder implementation.

Builders: These actually contruct new Sequence objects. Generally, there will just be one Builder implementation for each Sequence implementation. The basic BioJava library provides one Builder implementation, SimpleSequenceBuilder, which constructs simple in-memory representations for any kind of sequence data.  

<!-- -->

Filters: These don't construct Sequence objects themselves, but are chained to another SequenceBuilder. When they are notified of data, they perform some processing, then pass the information on to the next SequenceBuilder in the chain.  

Whenever a SequenceBuilder is required, you can either simply provide a
\`Builder' implementation, or you can create a chain consisting of one
or more \`Filters', leading ultimately to a \`Builder'. A
SequenceBuilder object should only be used once. If multiple sequences
are being read from a stream, a new SequenceBuilder (or chain) should be
constructed for each one. For convenience, we provide a
SequenceBuilderFactory interface, whose sole purpose is to encapsulate
the construction of SequenceBuilders. Each SequenceBuilder
implementation should provide a suitable factory implementation as well.

For \`Builder' implementations, it is usually possible to provide a
\`singleton' factory object. For SimpleSequenceBuilder this is the
static field SimpleSequenceBuilder.FACTORY. For filters, the factory
must be parameterized with another SequenceBuilderFactory so that a
complete chain can be constructed. For instance:

    SequenceBuilderFactory mySBF = 
        new EmblProcessor.Factory(SimpleSequenceBuilder.FACTORY);

Authors of new SequenceBuilder implementations are encouraged to
consider this naming style when implementing SequenceBuilderFactory.

Putting it together: StreamReader
---------------------------------

The simplest way to use the BioJava sequence input code is to construct
a StreamReader. The constructor takes four paramters:

-   A normal Java BufferedReader, encapsulating the stream of data to
    parse.
-   A SequenceFormat object, which is responsible for actually parsing
    sequence data from the stream.
-   A SymbolTokenization, which represents a mapping from textual
    characters to BioJava Symbol objects.
-   A SequenceBuilderFactory to support construction of Sequence
    objects.

A StreamReader might be constructed as follows:

    Alphabet dna = DNATools.getDNA();
    SymbolTokenization dnaParser = dna.getTokenization("token");
    BufferedReader br = new BufferedReader(
                    new FileReader(fileName));
    SequenceBuilderFactory sbf = new FastaDescriptionLineParser.Factory(
                                         SimpleSequenceBuilder.FACTORY);
    StreamReader stream = new StreamReader(br,
                           new FastaFormat(),
                           dnaParser,
                           fact);

(this is just a snippet from the example program in [chapter
1](BioJava:Tutorial:Symbols and SymbolLists "wikilink"), and you may
like to refer back for more information). The StreamReader class
implements the SequenceIterator interface, so you can easily iterate
over all sequences in a stream:

    while (stream.hasNext()) {
        Sequence seq = stream.nextSequence();
        // Perform some processing on seq
    }

Another application: IndexedSequenceDB
--------------------------------------

As biology enters the post-genomic era, it is common to need to work
with databases of sequence data far too large to fit in available
memory. One way to handle large amounts of sequence is to use a
dedicated database system: either a specialized solution such as
[ACeDB](http://www.acedb.org/) or a set of tables in a standard database
application, as used by the [Ensembl](http://www.ensembl.org/) project.
If, however, you don't wish to use one of these solutions, BioJava
offers a simple and efficient sequence database implementation backed by
one or more sequence files on disk. These files can be in any format, so
long as a suitable SequenceFormat class exists.

As a simple example of an IndexedSequenceDB in use, the following
servlet retrieves sequences from a large database, and sends them on to
the client in FASTA format. The database could be created using the
CreateIndex and AddFiles programs included in the BioJava demos
directory.

    import java.io.*;

    import javax.servlet.*;
    import javac.servlet.http.*;

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;
    import org.biojava.bio.seq.db.*;

    public class SequenceServlet extends HttpServlet {
        private SequenceDB indexedDB;      // Database to serve
        private SequenceFormat seqFormat;  // Used for writing

        public void init(ServletConfig config) 
            throws ServletException
        {
            super.init(config);
        String dbName = config.getInitParameter("sequence.db");
        if (dbName == null)
            throw new ServletException("Database not specified");
        try {
                TabIndexStore index = TabIndexStore.open(dbName);
            indexedDB = new IndexedSequenceDB(index);
            } catch (Exception ex) {
            log("Can't open sequence database: " + dbName, ex);
            throw new ServletException();
            }

        seqFormat = new FastaFormat();
        }

        public void doGet(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException
        {
            String id = req.getParameter("id");
        if (id == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND,
                           "No id parameter in request");
                return;
        }

        try {
            Sequence seq = indexedDB.getSequence(id);
            resp.setContentType("text/plain");
            PrintStream stream = new PrintStream(resp.getOutputStream());
            seqFormat.writeSequence(seq, stream);
            } catch (BioException ex) {
            log("Can't retrieve sequence", ex);
            resp.sendError(HttpServletResponse.SC_NOT_FOUND,
                           "Couldn't load sequence " + id);
            }
        }
    }
