---
title: BioJava:GetStarted
---

Introduction
------------

BioJava will run on any computer with a Java virtual machine complying
to the Java 2 Standard Edition (J2SE) 1.6 (or later) specifications.
Java implementations for Linux, Windows, and Solaris are available to
download from [Oracle's java
website](http://www.oracle.com/technetwork/java/). Recent versions of
MacOS X include a suitable Java implementation as standard. Java is also
available on many other platforms: if in doubt, contact your vendor.
BioJava binaries are distributed in .jar (Java ARchive) format.

You can get the latest version [BioJava3 (v3.0.1) (requires Java
1.6+)](Biojava:Download "wikilink") from the [download
area](Biojava:Download "wikilink").

You can get the latest version [BioJava1 (v1.8.1) (requires Java
1.5+)](Biojava:Download_1.8 "wikilink") from the [BJ1 download
area](Biojava:Download_1.8 "wikilink") .

You can also integrate BioJava with NetBeans IDE. To find out how follow
this [link](How_to_integrate_BioJava_in_NetBeans_IDE "wikilink").

A step by step guide on 'How to integrate BioJava in Nebtbeans IDE' is
[here](BioJava-Installation_Guide.png "wikilink").

Maven
-----

BioJava used [Maven](http://maven.apache.org/) as a build and
distribution system. If you are new to Maven, take a look at the
[Getting Started with
Maven](http://maven.apache.org/guides/getting-started/index.html) guide.

Installation
------------

None of these .jar files need to be unpacked for normal use -- simply
place them in a convenient directory.

To use BioJava, add the required JAR files to your CLASSPATH environment
variable. The exact syntax varies between platforms. The text is wrapped
due to limited space. The actual commands should be on a single line:

### UNIX Bourne-type shells (the default with most Linux distributions and MacOS 10.3)

`export CLASSPATH=/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:`  
`                        /home/thomas/commons-cli.jar:`  
`                        /home/thomas/commons-collections-2.1.jar:`  
`                        /home/thomas/commons-dbcp-1.1.jar:`  
`                        /home/thomas/commons-pool-1.1.jar:.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### UNIX C-type shell (for example: versions of Mac OS X pre-10.3)

`setenv CLASSPATH /home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:`  
`                        /home/thomas/commons-cli.jar:`  
`                        /home/thomas/commons-collections-2.1.jar:`  
`                        /home/thomas/commons-dbcp-1.1.jar:`  
`                        /home/thomas/commons-pool-1.1.jar:.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### Windows from command line

`set CLASSPATH C:\biojava-live.jar;C:\bytecode.jar;C:\commons-cli.jar;`  
`                        C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;`  
`                        C:\commons-dbcp-1.1.jar;.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### Windows autoexec.bat files

`set CLASSPATH=C:\biojava-live.jar;C:\bytecode.jar;C:\commons-cli.jar;`  
`                        C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;`  
`                        C:\commons-pool-1.1.jar;.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

It is also possible to "install" JAR files onto your system by copying
them into your Java installation's extensions directory. On most Unix
systems, this is named *${JAVA\_HOME}/jre/lib/ext*. On Mac OS X there is
a per-user extensions directory called *~/Library/Java/Extensions* (you
may have to create this directory yourself). For other platforms,
consult your Java vendor.

You can now compile and run BioJava programs using the *javac* and
*java* commands. You might like to look at the developer section on the
[Main page](http://www.biojava.org/wiki/Main_Page) for documentation,
cookbook and tutorials. Finally, you can learn a lot about BioJava by
trying the demo programs included in the source distribution (see
below).

Building your own
-----------------

If you want to modify BioJava, you can obtain a copy of the source code
from the download areas. Source releases are distributed in .tar.gz
format. You can also obtain up-to-the-minute source code via either the
[Maven repository](http://biojava.org/download/maven/) or an [ anonymous
SVN checkout](CVS_to_SVN_Migration "wikilink").

BioJava is now built using [Apache Maven](http://maven.apache.org/).

Building the demo programs
--------------------------

The source distribution contains a number of small demo programs. Once
you have a working *biojava.jar* on your classpath, these can be
compiled directly using *javac* from the demos directory.

` (unix)`  
` cd demos`  
` javac seq/TestEmbl.java`  
` java seq.TestEmbl seq/AL121903.embl`  
` `  
` (windows)`  
` cd demos`  
` javac seq\TestEmbl.java`  
` java seq.TestEmbl seq\AL121903.embl`
