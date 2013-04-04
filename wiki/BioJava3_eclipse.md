---
title: BioJava3 eclipse
---

Eclipse is a common IDE for using BioJava.

Prerequisites
-------------

1.  Download Eclipse from
    [<http://www.eclipse.org/>](http://www.eclipse.org/). Several
    flavors are available, which come with different pre-installed
    plugins. We recommend starting with 'Eclipse IDE for Java
    Developers'.
2.  Install the following plugins. See [\#Plugin
    Installation](#Plugin_Installation "wikilink") below for detailed
    instructions.
    -   m2e - Maven Integration for Eclipse
    -   Eclipse EGit
    -   m2e-egit SCM Handler

Cloning the repository
----------------------

We recommend [creating a
fork](Contributing to BioJava#Forking_Biojava "wikilink") on github for
day-to-day development. In the following instructions you should
substitute something like '<https://github.com/><username>/biojava.git'
for the repository URL. If you don't want to make a fork (for instance,
if you don't plan to make any changes), you can follow the instructions
below exactly.

*TODO: write instructions*

Plugin Installation
-------------------

*This section needs to be expanded with specific instructions for
installing plugins using either Marketplace or directly from the Install
software menu.*

Recent versions of Eclipse come with the Marketplace plugin, which can
be used to find and install additional plugins. Feel free to install the
prerequisites from Marketplace. This tutorial uses the older method of
installing plugins directly from their repositories, which is compatible
with more versions of Eclipse.

### 1. Install Maven m2e

![Screenshot of Install New Software dialog after selecting m2e for
install.](Install_m2e.png "Screenshot of Install New Software dialog after selecting m2e for install.")

1.  In eclipse, go to
2.  Choose '--All Available Sites--' from the 'Work with' dropdown
3.  Search for 'm2e' and check the box next to 'm2e - Maven Integration
    for Eclipse' under Collaboration
4.  Click 'Next', accept the license, and finish the installation
5.  Restart Eclipse at the prompt

If everything went smoothly, after reboot the 'Welcome' screen should
mention 'Maven Integration for Eclipse'.

### 2. Install EGit

### 3. Install the SCM Handler
