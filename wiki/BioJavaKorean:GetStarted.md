---
title: BioJavaKorean:GetStarted
---

소개
----

BioJava will run on any computer with a Java virtual machine complying
to the Java 2 Standard Edition (J2SE) 1.4 (or later) specifications.
Java implementations for Linux, Windows, and Solaris are available to
download from Sun's java website. Recent versions of MacOS X include a
suitable Java implementation as standard. Java is also available on many
other platforms: if in doubt, contact your vendor. BioJava binaries are
distributed in .jar (Java ARchive) format.

You can get the latest version BioJava 1.6 (requires Java 1.5+) from the
download area .

You can get the legacy version of BioJava 1.5 (requires Java 1.4+) ; or

You can get the legacy release version of BioJava 1.4 here;

You can also integrate BioJava with NetBeans IDE. To find out how follow
this link.

설치
----

None of these .jar files need to be unpacked for normal use -- simply
place them in a convenient directory.

To use BioJava, add the required JAR files to your CLASSPATH environment
variable. The exact syntax varies between platforms. The text is wrapped
due to limited space. The actual commands should be on a single line:

### 유닉스 본 쉘 타입 (대부분의 리눅스 배포본이나 MacOS 10.3)

`export CLASSPATH=/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:`  
`                        /home/thomas/commons-cli.jar:`  
`                        /home/thomas/commons-collections-2.1.jar:`  
`                        /home/thomas/commons-dbcp-1.1.jar:`  
`                        /home/thomas/commons-pool-1.1.jar:.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### 유닉스 C 쉘 타입 (예: Mac OS X pre-10.3 버전)

`setenv CLASSPATH /home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:`  
`                        /home/thomas/commons-cli.jar:`  
`                        /home/thomas/commons-collections-2.1.jar:`  
`                        /home/thomas/commons-dbcp-1.1.jar:`  
`                        /home/thomas/commons-pool-1.1.jar:.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### 윈도우즈 명령어

`set CLASSPATH C:\biojava-live.jar;C:\bytecode.jar;C:\commons-cli.jar;`  
`                        C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;`  
`                        C:\commons-dbcp-1.1.jar;.`

In some distributions of Biojava, you need to specify biojava.jar
instead of biojava-live.jar in the above. We are working on resolving
this.

### 윈도우즈 autoexec.bat 파일

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
*java* commands. You might like to look at the
[tutorial](BioJava:Tutorial "wikilink"), [API
documentation](http://www.biojava.org/docs/api15b/index.html) and the
[BioJava in anger](BioJava:Cookbook "wikilink") section . Finally, you
can learn a lot about BioJava by trying the demo programs included in
the source distribution (see below).
