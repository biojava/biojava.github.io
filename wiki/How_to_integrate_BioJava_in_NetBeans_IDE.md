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

