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

    <nowiki>
     export CLASSPATH=$CLASSPATH:/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:
                                 /home/thomas/commons-cli.jar:
                                 /home/thomas/commons-collections-2.1.jar:
                                 /home/thomas/commons-dbcp-1.1.jar:
                                 /home/thomas/commons-pool-1.1.jar:.
    </nowiki>

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### UNIX C-type shell (Mac OS X pre-10.3)

    <nowiki>
    setenv CLASSPATH ${CLASSPATH}:/home/thomas/biojava-live.jar:/home/thomas/bytecode.jar:
                                  /home/thomas/commons-cli.jar:
                                  /home/thomas/commons-collections-2.1.jar:
                                  /home/thomas/commons-dbcp-1.1.jar:
                                  /home/thomas/commons-pool-1.1.jar:.
    </nowiki>

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### Windows from command line

    <nowiki>
    set CLASSPATH=%CLASSPATH%;C:\biojava-live.jar;C:\bytecode.jar;C:\commons-cli.jar;
                              C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;
                              C:\commons-dbcp-1.1.jar;.
    </nowiki>

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

### Windows autoexec.bat files

    <nowiki>
    set CLASSPATH=%CLASSPATH%;C:\biojava-live.jar;C:\bytecode.jar;C:\commons-cli.jar;
                              C:\commons-collections-2.1.jar;C:\commons-dbcp-1.1.jar;
                              C:\commons-pool-1.1.jar;.
    </nowiki>

In alcune distribuzioni di BioJava, bisogna sostituire biojava.jar
invece di biojava-live.jar. Stiamo lavorando per risolvere questo
problema.

E' anche possibile installare i file JAR nel proprio sistema copiandoli
all'interno di una installazione esistente di Java. Sulla maggior parte
dei sistemi Linux che sui sistemi Windows-like basta copiare i jar
elencati sopra all'interno di *${JAVA\_HOME}/jre/lib/ext*. Su Mac OS X
c'è una directory per ogni utente chiamata *~/Library/Java/Extensions*
(nel caso non esista basta crearsela da soli). Per altre piattaforme
consultare questo
[link](http://java.sun.com/javase/downloads/index.jsp).

A questo punto sarà possibile compilare ed eseguire i programmi BioJava
utilizzando i comandi *javac* e *java*. E' opportuno dare uno sguardo al
[tutorial](BioJava:Tutorial "wikilink"), alla documentazione relativa
alle [API](http://www.biojava.org/docs/api15b/index.html) e alla sezione
[BioJava in anger](BioJava:CookBookItaliano "wikilink"). Infine si può
imparare molto riguardo BioJava semplicemente utilizzando i programmi
demo inclusi nei sorgenti (segue).

Building your own
-----------------

If you want to modify BioJava, you can obtain a copy of the source code
from the [Source directory](http://www.biojava.org/download/source) of
the download area. Source releases are distributed in .tar.gz format.
You can also obtain up-to-the-minute source code via an [ anonymous SVN
checkout](CVS_to_SVN_Migration "wikilink").

BioJava is built using the *ant* build tool, a Java-specific equivalent
of the common Make utilities. Please download and install the latest
version of *ant* (currently 1.6.1). It is available
[here](http://ant.apache.org).

To build the library, just change into the biojava-live directory and
type *ant*. The final JAR file will be placed in the *ant-build*
directory. You can also use the command *ant javadocs-biojava* to build
the API documentation.

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
