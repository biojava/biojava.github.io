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

You can get the latest version of BioJava3+ from the download page
[BioJava (v) (requires Java 1.6+)](Biojava:Download "wikilink").

You can get the latest version of BioJava-legacy (a.k.a. BioJava1) from
the download page [BioJava1 (v) (requires Java
1.5+)](Biojava:Download_{{current version legacy}} "wikilink").

You can also integrate BioJava with NetBeans IDE. To find out how follow
this [link](How_to_integrate_BioJava_in_NetBeans_IDE "wikilink").

A step by step guide on 'How to integrate BioJava in Netbeans IDE' is
[here](BioJava-Installation_Guide.png "wikilink").

Maven
-----

BioJava uses [Maven](http://maven.apache.org/) as a build and
distribution system. If you are new to Maven, take a look at the
[Getting Started with
Maven](http://maven.apache.org/guides/getting-started/index.html) guide.

BioJava, as of release 4.0.0 is available through Maven Central.

You can add the BioJava repository by adding the following XML to your
project pom.xml file:

            
            <dependencies>
                    ...
                    <dependency>
                            <groupId>org.biojava</groupId>
                            <artifactId>biojava-core</artifactId>
                            <version>4.2.0</version>
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
[Maven repository](http://biojava.org/download/maven/) or from
[github](Get source "wikilink").

BioJava is now built using [Apache Maven](http://maven.apache.org/).
