---
title: BioJava3 Eclipse with SVN
---

Prerequisite
------------

-   Make sure you have a copy of the latest eclipse (Galileo)

<!-- -->

-   Make sure you have Java 1.6 installed. (if you are on oSX 10.4.x
    install [soylatte](http://landonf.bikemonkey.org/static/soylatte/)

<!-- -->

-   Install the [m2eclipse](http://m2eclipse.sonatype.org/) Maven
    eclipse plugin. Be sure to include SCM integration, offered through
    the m2eclipse-extras package.

<!-- -->

-   Install the [subclipse](http://subclipse.tigris.org/) plugin for
    subversion (latest version: 1.6)

Installation
------------

-   In the SVN Repository Exploring view: Right click on the folder
    <i>/biojava/biojava-live/trunk</i> and select Check Out as Maven
    project

Details for specific Eclipse Versions
=====================================

=

### Update for Eclipse Helios SR2 (May 2011)

The above plugins are still available and work fine, however, below are
the few important particulars.

-   Use update URLs from the plugins web site, do not use Eclipse market
    place, as in that case you will have to install all the components
    of the plugin manually and it will be very easy to forget to install
    something important, besides it does not always work.

<!-- -->

-   Make sure you have full JDK 1.6 installed, JRE will not be
    sufficient (some *Maven* plugins will not work)

<!-- -->

-   After JDK installation point Eclipse to the JDK location. For this
    edit *eclipse.ini* found in the Eclipse root directory. Insert *-vm*
    keyword with the location of your JDK and make sure that this
    keyword precedes *-vmargs* (!) for example

`  -vm`  
`  C:/Java/jdk1.6.23/bin`  
`  -vmargs`  
`  -Xms40m`  
`  -Xmx512m`

-   If you work on any other operating system but win32, you will have
    to install JavaHL library for the *subclipse* plugin manually. More
    information about it can be found here:
    [<http://subclipse.tigris.org/wiki/JavaHL>](http://subclipse.tigris.org/wiki/JavaHL)

<!-- -->

-   When adding the URL of BioJava development repository do not add the
    actual folder you want to check out, otherwise you may not be able
    to checkout it as maven project. For example if you want to checkout

`svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live/trunk/`

use

`svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live`

as the repository URL and then navigate to trunk in the Eclipse SVN
explorer.

### Eclipse Indigo (August 29th 2011)

I downloaded the Eclipse j2ee version (OSX Lion) and used the Eclipse
Marketplace to find and install the following plugins:

from Eclipse Marketplace:

`- Subclipse `  
`- Maven Integration for Eclipse`  
`- Maven Integration for Eclipse WTP (probably  not needed, but I do a lot of web stuff, so I added it)`

- m2e-subclipse (SCM connector, bring Maven and subclipse together) from
Yoxos Marketplace

`- SvnKit Client Adapter (needs to be enabled in Preferences->Team->SVN, SVN Interface ->SVNKit, Pure Java )`  

To check out BioJava you can do: new -\> Maven -\>checkout project from
SCM, add biojava URL to .../biojava-live/trunk, press finish

A useful blog article providing more help for how to install Maven is
here:
[1](http://www.shareyourwork.org/roller/ralphsjavablog/entry/eclipse_indigo_maven_and_svn)

--[Andreas](User:Andreas "wikilink") 04:43, 30 August 2011 (UTC)
