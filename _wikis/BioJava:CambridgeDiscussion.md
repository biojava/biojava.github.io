---
title: BioJava:CambridgeDiscussion
---

Background
----------

In Febuary 2007 several current and former BioJava core developers met
at the EBI in Cambridge, UK to discuss future directions in BioJava. The
following is a summary of what was
discussed. --[Mark](User:Mark "wikilink") 03:16, 15 March 2007 (EDT)

BioJava1.5
----------

It was generally felt we should release as soon as possible! Although it
is not bug free, completely documented/ tested etc it is probably still
better than previous releases. Because we are encouraging people to use
1.5-beta2 instead of 1.4 it is pretty much the official version.

Exception Handling
------------------

It was generally felt that where possible exceptions that are unlikely
and that would only happen in situations that the developer might expect
should be runtime exceptions and not checked exceptions. More generally,
problems caused by bad programming should be runtime exceptions.
Problems caused by the user doing something odd should be checked
exceptions.

An example is the ChangeVetoExceptions which will only occur if the
developer has set up change listeners. This has been changed to a
runtime (unchecked) exception in BJ1.5-beta2.

Things like IllegalSymbolException are probably errors caused by the
user. For example the user provides a Protein fasta file when the
program expects DNA. A well constructed program could respond in a
better way than just crashing with a stack trace. For example it could
prompt for a different file.

Checked exceptions create a development and learning burden and we
should reduce them where appropriate.

Suggestions of other exceptions that should be unchecked are welcome. It
is simple to convert a checked to unchecked exception it is not possible
to go the other way so we should properly discuss each example.

Java 5 (JDK1.5)
---------------

It was decided that immediately after the release of BJ1.5 we should
adopt and allow language features and API's from JDK1.5

Bug fixes and regression testing
--------------------------------

The bugzilla system is an excellent way for us to track bugs. Where
possible we should encourage bug reports to the mailing list to be
entered in bugzilla as well to make sure they are not missed.

To make sure bugs do not re-emerge it was suggested that JUnit tests be
created for individual bugs. Given that each test is probably very
simple it shouldn't be too much of a burden to create them. Netbeans and
Eclipse have very good JUnit wizards to make this even simpler.

I suggest that the tests could reside in a package like
org.biojava.regression package. The tests could be named after the bug
id, eg TestBug18675.java --[Mark](User:Mark "wikilink") 03:16, 15 March
2007 (EDT)

New Classes and API's
---------------------

New classes should be accompanied by <b>complete</b> javadocs of
<b>all</b> public and protected methods, including @param, @exception
and @return tags. Modern IDEs have good wizards to point out methods
that are not properly documented.

I would like to make this automated so that code checked into the
repository is rejected or an email is sent out to indicate that docs are
not complete. --[Mark](User:Mark "wikilink") 03:16, 15 March 2007 (EDT)

New classes should have an accompanying JUnit test that covers
<b>all</b> methods. People frequently miss equals(), hashcode(),
compare() but these have behaivour contracts that require they are all
in logical agreement. Strange and hard to debug behaivour arises if they
are not tested properly. The toString() method should also be tested if
it has been over-ridden because people start to rely on the value it
produces.

Can a check for a JUnit test be
automated?? --[Mark](User:Mark "wikilink") 03:16, 15 March 2007 (EDT)

Subversion and Maven
--------------------

There was some discussion about biojava switching to subversion after
the 1.5 release and possibly using Maven2 instead of Ant for building.

Does someone want to organize this?? --[Mark](User:Mark "wikilink")
03:16, 15 March 2007 (EDT)

Dropping the GUI API
--------------------

Developments in Java graphics probably make it such that the BioJava GUI
API shouldn't be part of BioJava. There are now several ways to generate
graphics depending on what the display is. Eg Swing for GUI, SVG for
web, JSF/AJAX for dynamic web etc. There for the GUI package might best
be a seperate project.

In addition the GUI model has not been updated to make use of features
in RichSequence. If it is not maintained it could be distributed as a
seperate JAR that would be an optional download for those who need it.

User Survey
-----------

It would be useful to perform a user survey to get an idea of what
people want, what they use biojava for etc. Any volunteers to organise
this??? --[Mark](User:Mark "wikilink") 03:26, 15 March 2007 (EDT)

Code Audit
----------

There are now several tools that check the quality of code, coverage of
unit tests, documentation etc. It was felt that it would be useful to
perform an 'audit' of the code base to get an idea of the quality.

Could people with some experience of these tools make some
suggestions? --[Mark](User:Mark "wikilink") 03:27, 15 March 2007 (EDT)
