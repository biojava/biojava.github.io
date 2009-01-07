---
title: Dazzle
---

Dazzle
======

Dazzle is an easy to use server for the Distributed Annotation System
([DAS](http://www.biodas.org)).

It is implemented as a Java servlet, using the BioJava APIs. Dazzle is a
modular system which uses small "datasource plugins" to provide access
to a range of databases. Several [general-purpose
plugins](Dazzle:plugins "wikilink") are included in the package, and it
it straightforward to [ develop new
plugins](Dazzle:writeplugin "wikilink") to connect to your own
databases.

Dazzle has been developed at the Wellcome Trust Sanger Institute by
[Thomas Down](Thomas_Down "wikilink").

Getting Dazzle
--------------

Dazzle can be downloaded from
[<http://www.derkholm.net/svn/repos/dazzle/trunk>](http://www.derkholm.net/svn/repos/dazzle/trunk)
using subversion and built using ant:

    svn checkout http://www.derkholm.net/svn/repos/dazzle/trunk ./dazzle
    cd ./dazzle
    ant clean
    ant

Note that the above download includes biojava, and some other JARs that
you may find useful (and impossible to track down elsewhere). By default
it is using the jar files located in the jars subdirectory. If you have
your own installation of biojava please copy it there or update the
build.xml to point to your path. Note that on your system you may need
to use "ant -lib jars" instead of "ant" above.

Installation and Configuration
------------------------------

For installation and configuration instructions, please see the
<Dazzle:deployment> guide.

For learning how to write your own Dazzle plugins, please see the
<Dazzle:writeplugin> tutorial.

For learning how to deploy an Ensembl DAS reference server see the
[instructions here](Dazzle:Ensembl "wikilink").

If you want to follow Dazzle development, you can obtain up-to-date
source code via Subversion from
[<http://www.derkholm.net/svn/repos/dazzle/>](http://www.derkholm.net/svn/repos/dazzle/).

Available Plugins
-----------------

There are a number of [ready made plugins](Dazzle:plugins "wikilink")
available that can be set up with simply configuring dazzlecfg.xml
correctly. For instructions how to write your own plugin go to
<Dazzle:writeplugin>

DAS Extensions
--------------

Dazzle provides support for the DAS extensions that are available in the
[DAS 1.53E specification](http://www.dasregistry.org/spec_1.53E.jsp)

DAS client
----------

The BioJava based DAS client library
[Dasobert](http://www.spice-3d.org/dasobert/) is available from
[<http://www.spice-3d.org/dasobert/>](http://www.spice-3d.org/dasobert/)
