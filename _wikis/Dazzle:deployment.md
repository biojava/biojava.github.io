---
title: Dazzle:deployment
---

Deploying the Dazzle servlet
============================

This document describes the steps required to install and start the
[Dazzle](Dazzle "wikilink") server. Some knowledge of the DAS system is
assumed: read the specification for more information.

These instructions apply to release 1.01 of Dazzle.

Prerequisites
-------------

Dazzle requires a runtime environment for the Java 2 platform, standard
edition (J2SE) version 1.5 or later. It also requires a servlet
container complying with the servlets 2.3 specification (a servlet
container is a Java-aware web server). Dazzle was developed using the
Tomcat 5.x servlet container, and this is recommended. It has also been
tested successfully using Resin.

The webapp structure
--------------------

Servlet containers work with bundles of code and data known as webapps.
To deploy Dazzle, you must create a webapp with a well-defined
structure. The required files and directories are shown below:

    WEB-INF/
        web.xml                       Deployment descriptor, used by the servlet container.
        lib/
            biojava.jar               BioJava library
            bytecode.jar              (Required for BioJava)
            dazzle.jar                DazzleServer code
        classes/
    dazzlecfg.xml                     Data-sources configuration file
    stylesheet.xml                    Default DAS stylesheet
    welcome.html                      Welcome message, included front page

You can add your own data files to this structure, either at the top
level or in your own directories. If you are using a datasource plugin
which isn't included in the core Dazzle package, you can either package
it as a JAR file (if it isn't already) and place it in the WEB-INF/lib
directory, or place raw .class files in the WEB-INF/classes directory.

You can download a complete \`skeleton' webapp with all these files in
place from the Dazzle homepage. In this case, you just need to unpack
the skeleton, configure your datasources, then follow the deployment
instructions below. Alternatively, you can download the source and
compile your own. If so, you will need the following:

BioJava (current version)

`   Available from `[`BioJava:download`](BioJava:download "wikilink")`. `

BioJava bytecode library

`   Binaries can be downloaded from BioJava.org. Also in `[`BioJava`
`SVN`](CVS_to_SVN_Migration "wikilink")`.`

servlet.jar

`   The Java Servlet 2.3 API files. This should be included with your Servlet container distribution. These are only needed for compiling Dazzle: when you deploy the servlet, it should automatically pick up servlet API classes from the servlet container. `

The current Dazzle sourcecode is available from the BioJava Subversion
repository. Follow the instructions there to connect to the server and
check out the dazzle module. You will need to copy all the libraries
above into the dazzle directory, then use the supplied ANT build-script
to compile the code.

Configuring datasources
-----------------------

Dazzle relies on small datasource plugins to supply sequence and feature
data, and also to customize the DAS messages. Each Dazzle installation
includes one or more data sources. These are defined in an XML
configuration file, dazzlecfg.xml. A typical example is shown below:

    <?xml version="1.0" ?>

    <!-- Sample Dazzle configuration file -->

    <dazzle xmlns="http://www.biojava.org/2000/dazzle">
      <datasource id="test" jclass="org.biojava.servlets.dazzle.datasource.EmblDataSource">
        <string name="name" value="Test seqs" />
        <string name="description" value="Evalutation sequences for promoter-finding software" />
        <string name="version" value="1.0" />
        <string name="fileName" value="test.embl" />

        <string name="stylesheet" value="test.style" />
      </datasource>

      <datasource id="tss" jclass="org.biojava.servlets.dazzle.datasource.GFFAnnotationSource">
        <string name="name" value="TSS" />
        <string name="description" value="Transcription start sites for fickett set" />
        <string name="version" value="1.0" />
        <string name="fileName" value="fickett-tss.gff" />
        <boolean name="dotVersions" value="true" />
        <string name="mapMaster" value="http://my-server:8080/das/test/" />

        <string name="stylesheet" value="tss.style" />
      </datasource>
    </dazzle>

Each datasource element has two required attributes: a unique ID, and
the fully-qualified Java class-name of the plugin. The datasource
element can contain any number of property elements, which set some
property of the plugin. Property elements are always named after the
data-type of the property to be set, and have two attributes: name and
value. The set of properties recognized by a given plugin should be
listed in the plugin documentation. (NOTE: The format of the property
elements may change in a future release to match the SOAP encoding
rules).

Some properties are commonly recognized by many plugins:

`   * name`  
`   * description`  
`   * version - the version of the database being served`  
`   * stylesheet - a path to a DAS stylesheet, relative to the top level of the webapp`  
`   * mapMaster`

The mapMaster attribute is recognized by all annotation server plugins.
It should be set to a URL pointing to the reference server whose
sequences are annotated by this data source. Note that this must always
be an absolute URL, even if the reference datasource is contained within
the same Dazzle webapp.

A list of plugins included in the standard Dazzle distribution is
included at the end of this document.

Packaging and deployment
------------------------

Once you are happy with your configuration file, and you've added any
extra resource files that are needed, you should package the webapp as a
WAR file. WAR files are just normal Java ARchives (JAR files) which
contain a WEB-INF directory and a web.xml file (as show in the directory
tree, above). To create this file, change into the directory where you
have been building your webapp, and type:

`   jar cf ../das.war * `

By convention, webapps containing DAS servers are called das.war, but
this isn't strictly necessary. Note, however, that the DAS client
support in Ensembl expects all DAS URLs to end /das/, so naming your
webapp something else may prevent you accessing your data via ensembl.

Details of deploying webapps vary between containers. If you are using
Tomcat, simply copy the das.war file into the ${TOMCAT\_HOME}/webapps/
directory, then re-start the server. Note that Tomcat creates temporary
directories for each deployed webapp (e.g. a das/ directory
corresponding to das.war). If you are replacing an existing webapp with
a newer version, you should shut down the server then delete the
temporary directory before deploying the new webapp.

When the webapp is deployed, you can test it with your favourite DAS
browser. You can also try visiting the root page (for instance,
<http://my-server:8080/das/>) using a web browser -- you should see a
welcome page listing the available data sources. Note that the welcome
page can be customized by editing the welcome.html file in your webapp.

If something goes wrong, most servlet containers will create a log file
containing the details of the errors. In the case of Tomcat, the log
file is usually called ${TOMCAT\_HOME}/logs/localhost\_log\_<data>.txt.
For other containers, consult your vendor. If you need to submit a bug
report, please locate the relevant log file and include it with your
report.

The EMBL-file plugin
--------------------

The EMBL-file plugin provides a DAS reference datasource backed by a
standard EMBL-format flatfile. It is included in the basic Dazzle
package, with classname
org.biojava.servlets.dazzle.datasource.EmblDataSource.

Properties of the EMBL plugin: Name Datatype Description name string The
display name of the datasource description string A textual description
of the datasource version string The version of the database being
served (note that individual sequences are served with version numbers
taken from the EMBL file stylesheet string Filename of a DAS stylesheet
to associate with this datasource fileName string Name of an EMBL file
which is read at startup.

The GFF plugin
--------------

The GFF plugin is a very lightweight annotation datasource, backed by a
GFF version 2 file. It is very easy to set up, but has some limitations
(no complex features, no links out to external data). A more
sophisticated \`general purpose' annotation datasource should be
released soon.

The GFF plugin has class name
org.biojava.servlets.dazzle.datasource.GFFAnnotationSource. The
following properties are available: Name Datatype Description name
string The display name of the datasource description string A textual
description of the datasource version string The version of the database
being served. Individual sequences are served with version numbers
copies from the reference server. stylesheet string Filename of a DAS
stylesheet to associate with this datasource mapMaster string URL of a
DAS reference server. fileName string Name of a GFF file which is read
at startup. dotVersions boolean Interpret sequence names contains a '.'
character as id.version.

The Ldas plugin
---------------

The Ldas plugin is an annotation datasource which reads from a
Bio::DB::GFF format database, and is largely compatible with the LDAS
DAS server. This plugin is useful for existing LDAS users who want to
consolidate on a single general purpose DAS server. It's also a good
choice for serving straightforward sets of features which are too large
to serve up using the GFF plugin, but don't already have their own
database. Currently, there is only an Ldas annotation plugin. An
equivalent for reference servers is possible in the future.

The Ldas plugin is included as standard with Dazzle 1.01 or later. But
to use it, you will need to add several extra JAR files to your
WEB-INF/lib directory:

`   * commons-collections-2.1.jar`  
`   * commons-dbcp-1.1.jar`  
`   * commons-pool-1.1.jar`  
`   * mysql-connector-java.jar`

The first three files are distributed with BioJava. The MySQL database
connector can be download from MySQL AB.. It should be possible to use
the Ldas plugin with other relational databases, but this has not been
tested -- contact the author if in doubt.

See the LDAS installation page for instructions on creating a
Bio::DB::GFF database and populating it with annotation data.

The Ldas plugin has class name
org.biojava.servlets.dazzle.datasource.LdasDataSource. The following
properties are available: Name Datatype Description name string The
display name of the datasource description string A textual description
of the datasource version string The version of the database being
served. stylesheet string Filename of a DAS stylesheet to associate with
this datasource mapMaster string URL of a DAS reference server. dbURL
string A JDBC-style URL specifying which database to use (e.g
jdbc:mysql://localhost/dicty). dbUser string The username to use when
connecting to the database. dbPass string The password to use when
connecting to the database (may be an empty string).
