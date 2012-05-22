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

You can get the latest version [BioJava3 (v3.0.4) (requires Java
1.6+)](Biojava:Download "wikilink") from the [download
area](Biojava:Download "wikilink").

You can get the latest version [BioJava1 (v1.8.2) (requires Java
1.5+)](Biojava:Download_1.8 "wikilink") from the [BJ1 download
area](Biojava:Download_1.8 "wikilink") .

You can also integrate BioJava with NetBeans IDE. To find out how follow
this [link](How_to_integrate_BioJava_in_NetBeans_IDE "wikilink").

A step by step guide on 'How to integrate BioJava in Nebtbeans IDE' is
[here](BioJava-Installation_Guide.png "wikilink").

Maven
-----

BioJava uses[Maven](http://maven.apache.org/) as a build and
distribution system. If you are new to Maven, take a look at the
[Getting Started with
Maven](http://maven.apache.org/guides/getting-started/index.html) guide.

We are providing a BioJava specific Maven repository at
<http://biojava.org/download/maven/> .

You can add the BioJava repository by adding the following XML to your
project pom.xml file:

            <repositories>
            ...
            <repository>
                <id>biojava-maven-repo</id>
                <name>BioJava repository</name>
                <url>http://www.biojava.org/download/maven/</url>           
            </repository>
        </repositories>

            <dependencies>
                    ...
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava3-core</artifactId>
                            <version>3.0.2</version>
                    </dependency>
                    <!-- other biojava jars as needed -->
            </dependencies>
        

Installation
------------

None of these .jar files need to be unpacked for normal use -- simply
place them in a convenient directory.

To use BioJava, add the required JAR files to your CLASSPATH environment
variable. The exact syntax varies between platforms.

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
