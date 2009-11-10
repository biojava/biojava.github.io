---
title: BioJava:CookBookItaliano:GetStarted
---

Introduzione
------------

BioJava può essere eseguito su qualsiasi computer che abbia una Java
Virtual Machine conforme alle specifiche J2SE 1.4 (o superiore). Java è
disponibile per Linux, Windows, Solaris ed è possibile ottenerlo da
[Sun's java website](http://java.sun.com/javase/downloads/index.jsp).
Versioni recenti di MacOS X includono Java come standard. Java è anche
disponibile per altre piattaforme: in caso di dubbi contattare il
proprio rivenditore. I file binare di BioJava sono distribuiti in
formato .jar (Java ARchive).

L'ultima versione di [BioJava 1.7 (richiede Java
1.5+)](Biojava:Download "wikilink") è scaricabile da qui [area
download](Biojava:Download "wikilink").

Versioni legacy di BioJava 1.5 sono scaricabili da qui [BioJava 1.5
(richiede Java 1.4+)](Biojava:Download 1.5 "wikilink") ; o

Versioni legacy di BioJava 1.4 sono scaricabili da qui [BioJava
1.4](Biojava:Download 1.4 "wikilink");

E' possibile integrare BioJava anche con NetBeans IDE. Per sapere come
seguire questo
[link](How_to_integrate_BioJava_in_NetBeans_IDE "wikilink").

Installazione
-------------

Nessuno di questi archivi jar ha bisogno di essere estratto per essere
utilizzato, bisogna semplicemente copiarli in una directory a piacere e
aggiungerli al proprio CLASSPATH. La sintassi corretta per aggiungere
nuove elementi al proprio CLASSPATH cambia a seconda dell piattaforma
utilizzata.

Attualmente basta eseguire uno di questi comandi (tutto su un riga):

### UNIX Bourne-type shells (Linux e MacOS 10.3)

`export CLASSPATH=$CLASSPATH:/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:`  
`                            /home/thomas/commons-cli.jar:`  
`                            /home/thomas/commons-collections-2.1.jar:`  
`                            /home/thomas/commons-dbcp-1.1.jar:`  
`                            /home/thomas/commons-pool-1.1.jar:.`

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### UNIX C-type shell (Mac OS X pre-10.3)

setenv CLASSPATH
${CLASSPATH}:/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:

`                             /home/thomas/commons-cli.jar:`  
`                             /home/thomas/commons-collections-2.1.jar:`  
`                             /home/thomas/commons-dbcp-1.1.jar:`  
`                             /home/thomas/commons-pool-1.1.jar:.`

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### Windows from command line

set
CLASSPATH=%CLASSPATH%;C:\\biojava-live.jar;C:\\bytecode.jar;C:\\commons-cli.jar;

`                         C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;`  
`                         C:\commons-dbcp-1.1.jar;.`

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### Windows autoexec.bat files

set
CLASSPATH=%CLASSPATH%;C:\\biojava-live.jar;C:\\bytecode.jar;C:\\commons-cli.jar;

`                         C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;`  
`                         C:\commons-pool-1.1.jar;.`

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

E' anche possibile installare i file JAR nel proprio sistema copiandoli
all'interno di una installazione esistente di Java. Sulla maggior parte
dei sistemi Linux che sui sistemi Windows-like basta copiare i jar
elencati sopra all'interno di *${JAVA\_HOME}/jre/lib/ext*. Su Mac OS X
c'è una directory per ogni utente chiamata *~/Library/Java/Extensions*

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
