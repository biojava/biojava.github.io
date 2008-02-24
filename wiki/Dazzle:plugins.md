---
title: Dazzle:plugins
---

Dazzle plugins
==============

The following plugins are already provided within
[Dazzle](Dazzle "wikilink") and can be used to set up a DAS source very
quickly by configuring **dazzlecfg.xml**. For more info on how to
configure Dazzle see <Dazzle:deployment>. For information on how to
write your own Dazzle plugin see <Dazzle:writeplugin>

The EMBL-file plugin
--------------------

The EMBL-file plugin provides a DAS reference datasource backed by a
standard EMBL-format flatfile. It is included in the basic Dazzle
package, with classname

`org.biojava.servlets.dazzle.datasource.EmblDataSource.`

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
[GFF version
2](http://www.sanger.ac.uk/Software/formats/GFF/GFF_Spec.shtml) file. It
is very easy to set up, but has some limitations (no complex features,
no links out to external data). A more sophisticated \`general purpose'
annotation datasource should be released soon.

The GFF plugin has class name

`org.biojava.servlets.dazzle.datasource.GFFAnnotationSource `

The following properties are available:

    Name        Datatype    Description

    name        string      The display name of the datasource
    description     string      A textual description of the datasource
    version     string      The version of the database being served. Individual sequences are served with version numbers copies from the reference server.
    stylesheet  string      Filename of a DAS stylesheet to associate with this datasource
    mapMaster   string      URL of a DAS reference server.
    fileName    string      Name of a GFF file which is read at startup.
    dotVersions     boolean     Interpret sequence names contains a '.' character as id.version.

### Attributes

The following attributes in the GFF file can be used:

    Atttribute  field
    id      the feature ID
    href:       the LINK href

### Example

The Ldas plugin
---------------

The Ldas plugin is an annotation datasource which reads from a
Bio::DB::GFF format database, and is largely compatible with the [LDAS
DAS server](http://www.biodas.org/servers/). This plugin is useful for
existing LDAS users who want to consolidate on a single general purpose
DAS server. It's also a good choice for serving straightforward sets of
features which are too large to serve up using the GFF plugin, but don't
already have their own database. Currently, there is only an Ldas
annotation plugin. An equivalent for reference servers is possible in
the future.

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

See the [LDAS installation
page](http://www.biodas.org/servers/LDAS.html) for instructions on
creating a Bio::DB::GFF database and populating it with annotation data.

The Ldas plugin has class name

<java>org.biojava.servlets.dazzle.datasource.LdasDataSource</java>

The following properties are available:

    Name        Datatype    Description
    name        string  The display name of the datasource
    description     string  A textual description of the datasource
    version     string  The version of the database being served.
    stylesheet  string  Filename of a DAS stylesheet to associate with this datasource
    mapMaster   string  URL of a DAS reference server.
    dbURL       string  A JDBC-style URL specifying which database to use (e.g jdbc:mysql://localhost/dicty).
    dbUser      string  The username to use when connecting to the database.
    dbPass      string  The password to use when connecting to the database (may be an empty string).

The UniProt plugin
------------------

A Uniprot file can be easily used to set up a reference and annotation
server. add the following config in your dazzlecfg.xml file:

<xml>
<datasource id="myUniProtSource" jclass="org.biojava.servlets.dazzle.datasource.UniProtDataSource">

`   `<string name="name" value="myUniProtSource" />  
`   `<string name="description" value="some data on a uniprot sequence" />  
`   `<string name="version" value="default" />  
`   `<string name="fileName" value="example.up" />

</datasource> </xml>

the example.up file is the uniprot file contains the data.

To see how the UniProt plugin is written see <Dazzle:examplePlugin>.
