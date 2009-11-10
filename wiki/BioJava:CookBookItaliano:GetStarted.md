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

Come compilare BioJava a partire da zero
----------------------------------------

Se si ha la necessità di modificare BioJava, si può ottenere una copia
del codice sorgente dalla [Source
directory](http://www.biojava.org/download/source) dell'area download. I
sorgenti sono distribuiti nel formato .tar.gz. L'ultima versione del
codice (aggiornata al minuto) si può reperire tramite svn qui: [
anonymous SVN checkout](CVS_to_SVN_Migration "wikilink").

BioJava è compilato utilizzando *ant* build tool, l'equivalente Java
della famosa utilità Make. Scaricare e utilizzare l'ultima versione di
*ant* (attualmente la 1.7.1). E' disponibile a questo
[link](http://ant.apache.org).

Per compilare la libreria bisogna eseguire il comando *ant* all'interno
della directory biojava-live. L'archivio jar costruito sarà poi posto
nella directory *ant-build*. Utilizzando il comando *ant
javadocs-biojava* è possibile generare la documentazione relativa alle
API.

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
