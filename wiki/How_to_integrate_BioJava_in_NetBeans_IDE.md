---
title: How to integrate BioJava in NetBeans IDE
---

Follow these steps and start using BioJava with the [NetBeans
IDE](http://www.netbeans.org).

### Option 1 - Add BioJava to your project

1) Download the necessary .jar files, javadocs and source from the
Biojava download [area](BioJava:Download_1.8 "wikilink").

2) Open a project in Netbeans (one that you will use BioJava for) and go
to the Project Panel.

3) Right click the Libraries tab and choose Wrapped JARs.

4) Add the appropriate .jar files and start using them in your project.

### Option 2 - Create a BioJava library wrapper module and refer to it

1) Download the necessary .jar files, javadocs and source from the
Biojava download [area](BioJava:Download_1.8 "wikilink").

2) Create a new library wrapper module.

3) In the project properties, right click the Libraries tab and choose
Wrapped JARs.

4) Add the appropriate .jar files.

5) In the project properties, right click the API Versioning tab and
declare all BioJava packages public.

6) Save and add a dependency to this module in each module that will be
using BioJava:

-   Open each module;
-   In the project properties, right click the Libraries tab and choose
    Module dependencies.
-   Add your wrapped BioJava library module.

It is not mandatory to add the javadocs and source codes but adding them
provides help during coding:

-   Go to Main menu \> Tools \> Libraries.
-   Create a new library, name it BioJava
-   In the classpath, add the BioJava JARs located in
    yourmodule/release/modules/ext folder
-   Reference as well the location of source code and javadocs.
-   Click OK; BioJava code is now accessible.

### Option 3 - Download BioJava using Maven

NetBeans comes in default with the necessary plugins to use Maven, so no
plugins need to be installed.

We recommend [creating a
fork](https://help.github.com/articles/fork-a-repo) on github for
day-to-day development. In the following instructions you should
substitute something like '<https://github.com/><username>/biojava.git'
for the repository URL. If you don't want to make a fork (for instance,
if you don't plan to make any changes), you can follow the instructions
below exactly.

1.  Download and install NetBeans from
    <https://netbeans.org/downloads/>.
2.  Go to
3.  Add the URL for your biojava repository on github, and press next.
    For instance, to checkout the main repository, use
        https://github.com/biojava/biojava.git

4.  Select master\* from the Select Remote Branches list, and press
    next.
5.  If you don't want to make any changes, press finish.
6.  Wait for BioJava to be cloned.
7.  Open the cloned project.
8.  Right-click on the BioJava project, and select .
9.  Once the build complete, you are ready to start using BioJava!

