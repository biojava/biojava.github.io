---
title: BioJava 3 Use Cases
---

This page will contain a bunch of
[use-cases](http://en.wikipedia.org/wiki/Use_case) which will drive
development for BioJava 3. Please add them below - Where possible please
follow the template.

Use cases should describe a task or goal that will be performed.
Typically the task will be performed by a user with the assistance of an
application (or a component of an application). The goal of the BioJava
developers will be to make sure the new BioJava API is sufficient to
allow such a application to be built. They will also endevour to provide
a reference example to both demonstrate how such a task can be
implemented and to show that the API is sufficient to implement the
task.

Use case template
=================

Copied from the use case template found in [Wikipedia use case
article](http://en.wikipedia.org/wiki/Use_case)

-   **Use case name:** A use case name provides a unique identifier for
    the use case. It should be written in verb-noun format (e.g., Borrow
    Books, Withdraw Cash), should describe an achievable goal (e.g.,
    Register User is better than Registering User) and should be
    sufficient for the end user to understand what the use case is
    about.
-   **Version:** Often a version section is needed to inform the reader
    of the stage a use case has reached. The initial use case developed
    for business analysis and scoping may well be very different from
    the evolved version of that use case when the software is being
    developed. Older versions of the use case may still be current
    documents, because they may be valuable to different user groups.
-   **Goal:** Without a goal a use case is useless. There is no need for
    a use case when there is no need for any actor to achieve a goal. A
    goal briefly describes what the user intends to achieve with this
    use case.
-   **Summary:** A summary section is used to capture the essence of a
    use case before the main body is complete. It provides a quick
    overview, which is intended to save the reader from having to read
    the full contents of a use case to understand what the use case is
    about. Ideally, a summary is just a few sentences or a paragraph in
    length and includes the goal and principal actor.
-   **Actors:** An actor is someone or something outside the system that
    either acts on the system – a primary actor – or is acted on by the
    system – a secondary actor. An actor may be a person, a device,
    another system or sub-system, or time. Actors represent the
    different roles that something outside has in its relationship with
    the system whose functional requirements are being specified. An
    individual in the real world can be represented by several actors if
    they have several different roles and goals in regards to a
    system.These interact with system and do some action on that.
-   **Preconditions:** A preconditions section defines all the
    conditions that must be true (i.e., describes the state of the
    system) for the trigger (see below) to meaningfully cause the
    initiation of the use case. That is, if the system is not in the
    state described in the preconditions, the behavior of the use case
    is indeterminate. Note that the preconditions are not the same thing
    as the "trigger" (see below): the mere fact that the preconditions
    are met does NOT initiate the use case.
-   '''Triggers: '''A 'triggers' section describes the event that causes
    the use case to be initiated. This event can be external, temporal
    or internal. If the trigger is not a simple true "event" (e.g., the
    customer presses a button), but instead "when a set of conditions
    are met", there will need to be a triggering process that
    continually (or periodically) runs to test whether the "trigger
    conditions" are met: the "triggering event" is a signal from the
    trigger process that the conditions are now met.
-   '''Basic course of events: '''At a minimum, each use case should
    convey a primary scenario, or typical course of events, also called
    "basic flow" or "happy flow". The main basic course of events is
    often conveyed as a set of usually numbered steps. For example:

1.  The system prompts the user to log on.
2.  The user enters his name and password.
3.  The system verifies the logon information.
4.  The system logs user on to system.

-   **Alternative paths:**Use cases may contain secondary paths or
    alternative scenarios, which are variations on the main theme. Each
    tested rule may lead to an alternate path and when there are many
    rules the permutation of paths increases rapidly, which can lead to
    very complex documents. Sometimes it is better to use conditional
    logic or activity diagrams to describe use case with many rules and
    conditions.
-   '''Postconditions: '''The post-conditions section describes what the
    change in state of the system will be after the use case completes.
    Post-conditions are guaranteed to be true when the use case ends.
-   '''Business rules: '''Business rules are written (or unwritten)
    rules or policies or conventions that an application must comply
    with. Eg all output must comply with a specific XML schema.
-   '''Notes: '''Useful information that doesn't fit under any other
    specific heading
-   '''Author and date: '''This section should list when a version of
    the use case was created and who documented it.

*A use case should:*

-   Describe what the system shall do for the actor to achieve a
    particular goal.
-   Include no implementation-specific language.
-   Be at the appropriate level of detail.
-   Not include detail regarding user interfaces and screens. This is
    done in user-interface design.

Use cases
---------

-   Multiple GenBank sequences inside a single file
    (ftp://bio-mirror.net/biomirror/genbank/gbbct1.seq.gz) can be easily
    indexed.
-   Is it possible to write the sequence to any object instead of
    writing it to a PrintStream?

`           // existing method`  
`           genbankFormat.writeSequence(richSequence, printStream);`

--*The above two aren't really use-cases, they're more technicalities.
We will attempt to address them but they will need clarification - 'any
object' is too vague (you need to specify exactly what you want to write
it to), and it's not mentioned why the indexing of a genbank file is
going to be a good thing, or even if the indexes already exist or
whether BioJava should make them itself. A use-case is 'I need to load a
subset of a GenBank file into a database then add some of my own
annotations, then produce a web search form for users to search and
identify my sequences by entering keywords from the annotation,
returning FASTA sequences as results', for example. Please also do leave
your name and contact email address so we can contact you for
clarification and more detail if we need to. --
**[Richard](User:Rholland "wikilink") 20/6/08***

-   I have a protein sequence of unknown function and want to identify
    similar sequences in public databases. (Blast, PsiBlast)
-   For the matches that I find I want to access the UniProt records to
    obtain all possible information. (Read UniProt)
-   Align the original protein sequence against the best hits in high
    quality and find regions of similarity.(Needleman Wunsch, Swith
    waterman)
-   If the protein structure is known for one of the homologues try to
    extend the search by finding similar protein structures in the PDB.
    (structure alignment)
-   Create a multiple sequences alignment and multiple structure
    alignment for the found matches. derive a profile from this for this
    protein family and search for distant members in the sequences
    databases. (psi blast)
-   Persist Sequences from various sources (including Ensemble) locally
    and make use of source-specific annotations referencing gene
    ontology annotations.

### Relational Database for ArrayExpress and GEO data

-   **Use case name:** Array Database
-   **Version:** 1.0
-   **Goal:** Take selected entries from ArrayExpress and GEO and store
    them in a relational database.
-   **Summary:** Array Express and GEO contain public microarray
    expression data. It would be desirable to extract experiments of
    interest (for example cancer) and parse these into a unified (or
    approximately unified) object model that can be stored in a relation
    database.
-   **Actors:** The user. The Database Loader system and the Database
    Searcher system.
-   **Preconditions:** The database loader has preselected a subset of
    Array Express and or GEO. The Database searcher will have a query
    that can be expressed in SQL or some other ORM language (eg a JPA
    query).
-   '''Triggers: ''' The loader is triggered by a user loading flatfiles
    or XML from ArrayExpress or GEO. A query is triggered when a user
    presents a query to the system.
-   '''Basic course of events: '''

1.  The user points the loader to a file or set of GEO/ ArrayExpress
    files.
2.  The Loader System parses those files into an object model.
3.  The The object model is persisted to the DB.

<!-- -->

1.  The user expresses a query to the Query System (possibly in a
    program that interprets the query as an ORM query language).
2.  The Query System generates objects to represent the results of the
    query that can be displayed to the user via a web interface or GUI
    (or if the user is a programmer then they will use the objects
    directly).

-   **Alternative paths:**

Records that cannot be understood should be skipped/ rolled back and
errors logged however parsing should not halt due to a 'bad record'.

-   '''Postconditions: '''If any records are successfully loaded then
    the DB will commit.
-   '''Business rules: '''Objects generated must be bean-like so they
    can be used in J2EE apps as well as serialize to XML for
    Web-Services. End users may be presented with wrappers that restrict
    access to setter methods to ensure immutability however these
    wrappers should be backed with beans.
-   '''Notes: '''
-   '''Author and date: '''--[Mark](User:Mark "wikilink") 00:54, 22 July
    2008 (UTC).

