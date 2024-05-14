---
title: BioJava
permalink:wiki/BioJava%3AGetStarted
---
git@github.com:sbl-sdsc/biojava-notebooks.git
Introduction
------------
https://github.com/sbl-sdsc/biojava-notebooks.git
----
BioJava will run on any computer with a Java virtual machine complying
to the Java specifications.
Java implementations for Linux, Windows, and Solaris are available to
download from [Oracle's java
website](http://www.oracle.com/technetwork/java/). Recent versions of
MacOS X include a suitable Java implementation as standard. Java is also
available on many other platforms: if in doubt, contact your vendor.
BioJava binaries are distributed in .jar (Java ARchive) format.

Obtain BioJava
--------------

BioJava is open-source and entirely hosted on [GitHub](https://github.com/biojava/biojava). You can check the code, submit issues and pull requests and download latest and past release binaries from GitHub.

You can manually download the latest version of BioJava ({{site.release.version}}), which requires Java 1.8+, from the [GitHub releases page](https://github.com/biojava/biojava/releases), but continue reading this article for a more convenient solution to integrate BioJava into your project.

For instructions on how to obtain the BioJava-legacy (a.k.a. BioJava1), which requires Java 1.5+, follow [this link](BioJava%3AGetStartedLegacy) or check the [biojava-legacy](https://github.com/biojava/biojava-legacy) project on GitHub.

Quick Installation
------------------

BioJava uses [Maven](http://maven.apache.org/) as a build and
distribution system. If you are new to Maven and want to find out more about it (although most details are not required for using BioJava), take a look at the
[Getting Started with
Maven](http://maven.apache.org/guides/getting-started/index.html) guide.

BioJava is available through [Maven Central](https://mvnrepository.com/artifact/org.biojava), so if you are using Maven to build your Java project you can import BioJava by adding the following XML to your project pom.xml file:

```xml
    <dependencies>
      <dependency>
        <groupId>org.biojava</groupId>
        <artifactId>biojava-core</artifactId>
        <version>{{site.release.version}}</version>
      </dependency>
      <!-- other biojava jars as needed -->
    </dependencies>
```

More options can be found in the [README](https://github.com/biojava/biojava) of the GitHub repository.


Manual Installation
-------------------

None of the BioJava .jar files need to be unpacked for normal use - simply
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
[Main page](http://www.biojava.org) for documentation,
cookbook and tutorials. Finally, you can learn a lot about BioJava by
trying the demo programs included in the source distribution (see
below).

Building your own
-----------------

If you want to modify BioJava, you can clone or fork the GitHub repository or obtain the source code from any of the previous releases from the [releases page](https://github.com/biojava/biojava/releases).
Source releases are distributed in .tar.gz format.

If you think your modifications can benefit others do not hesitate to submit a [pull request on GitHub](https://github.com/biojava/biojava/pulls). We always welcome new contributions. Here is how you can [get involved](GetInvolved).
