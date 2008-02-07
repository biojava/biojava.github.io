---
title: Dazzle
---

Dazzle
======

Dazzle is an easy to use [DAS](http://www.biodas.org) server.

Dazzle is a general purpose server for the Distributed Annotation System
(DAS) protocol. It is implemented as a Java servlet, using the BioJava
APIs. Dazzle is a modular system which uses small "datasource" plugins
to provide access to a range of databases. Several [general-purpose
plugins](Dazzle:plugins "wikilink") are included in the package, and it
it straightforward to develop new plugins to connect to your own
databases.

Dazzle has been developed at the Wellcome Trust Sanger Institute by
[Thomas Down](Thomas_Down "wikilink").

Getting Dazzle
--------------

Dazzle can be downloaded from <Dazzle:download>.

Installation and Configuration
------------------------------

For installation and configuration instructions, please see the
<Dazzle:deployment> guide.

If you want to follow Dazzle development, you can obtain up-to-date
source code via Subversion from
[<http://www.derkholm.net/svn/repos/dazzle/>](http://www.derkholm.net/svn/repos/dazzle/).

Deploying an Ensembl DAS reference server
-----------------------------------------

see the [instructions here](Dazzle:Ensembl "wikilink").

Available Plugins
-----------------

There are a number of [ready made plugins](Dazzle:plugins "wikilink")
availabele that can be set up with simply configuring dazzlecfg.xml
correctly. See <Dazzle:plugins> for more details on this.

DAS Extensions
--------------

Dazzle provides support for the DAS extensions that are available in the
[DAS 1.53E specification](http://www.dasregistry.org/spec_1.53E.jsp)
