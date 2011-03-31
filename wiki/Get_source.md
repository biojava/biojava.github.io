---
title: Get source
---

Check out code from SVN
=======================

BioJava requires [Subversion](http://subversion.tigris.org/) (SVN) and
[Maven](http://maven.apache.org/) for checking out the code and creating
a build. Access is possible either via

`- Anonymous SVN or GIT access or`  
`- Developer SVN access (ssh account required) or`  
`- BioJava SNAPSHOT builds (anonymous, Maven required)`

Downloading and updating code via Anonymous SVN
===============================================

The code.open-bio.org server offers up read-only copies of source code
repositories via anonymous SVN. A list of code repositories available
via SVN can be seen here: <http://code.open-bio.org/?root=biojava>

### Checking out the latest BioJava code

The following example shows how to obtain the latest BioJava codebase
snapshot using anonymous SVN, it will check out the latest copy of
biojava-live/ from the "SVN trunk" and will locally store it in a
directory named "biojava" on your system:

`svn co `[`http://code.open-bio.org/repos/biojava/biojava-live/trunk`](http://code.open-bio.org/repos/biojava/biojava-live/trunk)` ./biojava`

Anonymous checkouts are now hosted at [read only mirror at
github](http://github.com/biojava/biojava). As such you can of course
also use git to get a copy of the code:

`git clone `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)  

finally there is also a SVN interface to github:

`svn co `[`http://svn.github.com/biojava/biojava.git`](http://svn.github.com/biojava/biojava.git)` ./biojava`

A list of all available projects in SVN can be obtained with:

`svn list `[`http://code.open-bio.org/repos/biojava`](http://code.open-bio.org/repos/biojava)

### Troubleshooting Anonymous SVN

If you encounter an error while using the SVN client or SVN Web
interface, the likely cause is that our server is in the middle of
replicating the repository from the primary source. While the mirror and
replication process occurs, it is not unusual for SVN client
functionality to break temporarily.

The final step of our codebase replication process is to explicitly
re-verify the health and status of each repository, this process takes a
few moments but while it occurs the repository is "locked" and
unavailable for access.

`   * Anonymous SVN repositories are updated/mirrored hourly from the primary developer server`  
`   * Anonymous SVN repositories are verified and repaired (if necessary) every 20 minutes `

If a SVN client error occurs for longer than 20 minutes, please report
this to: support@helpdesk.open-bio.org

Maven SNAPSHOT builds
=====================

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

Downloading and updating code via Developer SVN
===============================================

For getting write access to BioJava you need a developer account on
dev.open-bio.org. Details for how developers can check out the
read/write enabled SVN see at
[Developer\_Code\_Access](Developer_Code_Access "wikilink")

Links
=====

See also the [SVN developers page in the OBF
wiki](http://www.open-bio.org/wiki/SVN-Developers)

Repository News
===============

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
