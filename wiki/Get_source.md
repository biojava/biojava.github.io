---
title: Get source
---

BioJava is hosted on [Github](https://github.com/biojava/biojava/). The
preferred method for checking out the source is with git, although it is
also possible to use subversion. This page contains general instructions
for getting the BioJava source. Users of the Eclipse IDE can see more
detailed instructions at [BioJava3
eclipse](BioJava3 eclipse "wikilink").

Getting the latest release code
===============================

BioJava can be accessed several ways

-   Git
-   SVN (not recommended)
-   [Download binaries](BioJava:Download "wikilink")
-   Directly from [Maven](http://maven.apache.org/)

Using git
---------

The latest stable release version of BioJava is available through git
using the following command:

`git clone `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)

This can also be done directly from within Eclipse. Instructions are
available at [BioJava3 eclipse](BioJava3 eclipse "wikilink").

Using SVN
---------

If you prefer to use SVN, code can also be accessed using Github's SVN
bridge.[1](https://github.com/blog/1178-collaborating-on-github-with-subversion)

`svn co `[`http://svn.github.com/biojava/biojava.git`](http://svn.github.com/biojava/biojava.git)` ./biojava`

Maven Release builds
--------------------

In order to use BioJava in your Maven projects, add the following lines
to your project .pom file:

    <repositories>
        <repository>
            <id>biojava-maven-repo</id>
            <name>BioJava repository</name>
            <url>http://www.biojava.org/download/maven/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
        </repository>
    </repositories>

You can then add any of the biojava modules as a dependency for your
project and Maven will automatically fetch the relevant jar files.

Getting the latest development code
===================================

BioJava generally releases two to three times a year. To get the latest
features and bug fixes, you can use the devel branch.

` git clone -b devel `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)

or from an existing git repository

`git checkout devel`

All developers should use the devel branch for publishing changes.
Details for how to contribute changes back to BioJava are available at
[Developer\_Code\_Access](Developer_Code_Access "wikilink").

Maven SNAPSHOT builds
---------------------

BioJava now also provides SNAPSHOT builds of the latest code base. This
is created automatically by the automated build system at
[<http://emmy.rcsb.org:8080/cruisecontrol/> ]. In order to install .jar
files from this repository automatically for your Maven projects, add
the following lines to your project .pom file:

    <repositories>
        <repository>
            <id>biojava-maven-repo</id>
            <name>BioJava repository</name>
            <url>http://www.biojava.org/download/maven/</url>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
            <releases>
                <enabled>true</enabled>
            </releases>
        </repository>
    </repositories>

History
=======

At its conception, BioJava was stored on a CVS repository and built
using Ant. Since then, several major refactoring have occurred leading
to the current layout as a set of Maven modules stored on github.

BioJava migrated to Git
-----------------------

BioJava was migrated to git in April 2013 (see [SVN to GIT
Migration](SVN to GIT Migration "wikilink")). History prior to September
2009 was not migrated. The old SVN repositories are still available for
anonymous SVN access, but are closed to new commits. The repository can
be [browsed online](http://code.open-bio.org/?root=biojava) or checked
out using

`svn co `[`http://code.open-bio.org/repos/biojava/biojava-live/trunk`](http://code.open-bio.org/repos/biojava/biojava-live/trunk)` ./biojava`

Developers who previously had write access to SVN can also view the
archive at the old development server (requires ssh access)

`svn co svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live/trunk/ ./biojava-live`

BioJava migrated to Maven
-------------------------

BioJava has migrated to Maven and was re-organized into sub-modules. For
more information see <BioJava:MavenMigration>

As of September 2009 the new mavenized code is available through the
main biojava *trunk*. The old ant-based biojava is still available in
the branch *trunk\_1\_7\_ant*

BioJava now using SVN
---------------------

As of January 2008 BioJava has moved the version control system from CVS
to Subversion (svn). All Biojava modules, branches and tags and the
history of the files has been imported into the new repository. For more
detailed documentation about the procedure used for the CVS to SVN
migration see [SVNmigrationHistory](SVNmigrationHistory "wikilink")
