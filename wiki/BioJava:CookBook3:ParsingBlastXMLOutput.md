---
title: BioJava:CookBook3:ParsingBlastXMLOutput
---

How can I use Blast XML output in my program?
---------------------------------------------

This page describes how to get Java objects from Blast results XML file
in a few simple steps.

Steps similar to those described below could also be applied to use
output from any other bioinformatics related services, capable of
returning results in XML format.

### Acquire Blast output in XML format

It can be done in various ways, including saving manual Blast search
results in XML format or by using biojava's
[NCBIQBlastService](BioJava:CookBook3:NCBIQBlastService "wikilink").

Blast output XML file should look like this (note the root element
BlastOutput): <xml>

<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">
<BlastOutput> ... </BlastOutput> </xml>

### Acquire referenced schema files

You might need referenced schema files: NCBI\_BlastOutput.dtd,
NCBI\_BlastOutput.mod.dtd and NCBI\_Entity.mod.dtd (they can be
downloaded from [1](http://www.ncbi.nlm.nih.gov/data_specs/dtd/)).

### Generate necessary Java classes

It can be done using xjc tool (part of Java Architecture for XML Binding
(JAXB)), which accepts an XML schema and generates Java classes. The
generated classes contain properties, which map to the XML elements
defined in the schema.

xjc can be used from command line
[2](http://docs.oracle.com/javase/6/docs/technotes/tools/share/xjc.html)
or as a Maven plugin [3](http://jaxb.java.net/jaxb-maven2-plugin/).
Command line usage example:

`
<nowiki>xjc -d <output directory> -p <package name> -dtd http://www.ncbi.nlm.nih.gov/dtd/NCBI_BlastOutput.dtd</nowiki>
`

Maven plugin config example: <xml> <plugin>

` `<groupId>`org.jvnet.jaxb2.maven2`</groupId>  
` `<artifactId>`maven-jaxb2-plugin`</artifactId>  
` `<version>`0.8.0`</version>  
` `<executions>  
`   `<execution>  
`     `<goals>  
`       `<goal>`generate`</goal>  
`     `</goals>  
`     `<configuration>  
`       `<generatePackage>`ncbi.blast.result.generated`</generatePackage>  
`       `<generateDirectory>`${basedir}/src/main/java`</generateDirectory>  
`       `<schemaLanguage>`dtd`</schemaLanguage>  
`       `<schemaIncludes>  
`         `  
`         `<value>`schemaFolder/NCBI_BlastOutput.dtd`</value>  
`       `</schemaIncludes>  
`     `</configuration>  
`   `</execution>  
` `</executions>  
` `<dependencies>  
`   `<dependency>  
`     `<groupId>`org.jvnet.jaxb2-commons`</groupId>  
`     `<artifactId>`property-listener-injector`</artifactId>  
`     `<version>`1.0`</version>  
`   `</dependency>  
` `</dependencies>

</plugin> </xml>

### Create Java objects from Blast results XML

In this step an object (instance of generated BlastOutput class)
representing root XML element will be created.

The most simple way to do it as follows, however you'll need to copy the
3 aforementioned XML schema files to every directory in which you want
to process Blast output XML files. <java> JAXBContext jc =
JAXBContext.newInstance(BlastOutput.class); Unmarshaller u =
jc.createUnmarshaller(); return (BlastOutput) u.unmarshal(new
File("blast-xml-output.xml")); </java>

As a workaround, place the 3 schema files in the same folder where the
generated classes are located and use the following code, which will
then use those files: <java> JAXBContext jc =
JAXBContext.newInstance(BlastOutput.class); Unmarshaller u =
jc.createUnmarshaller();

XMLReader xmlreader = XMLReaderFactory.createXMLReader();
xmlreader.setFeature("<http://xml.org/sax/features/namespaces>", true);
xmlreader.setFeature("<http://xml.org/sax/features/namespace-prefixes>",
true); xmlreader.setEntityResolver(new EntityResolver() {

`    public InputSource resolveEntity(String publicId, String systemId) throws SAXException, IOException {`  
`         String file = null;`  
`         if (systemId.contains("NCBI_BlastOutput.dtd")) {`  
`              file = "NCBI_BlastOutput.dtd";`  
`         }`  
`         if (systemId.contains("NCBI_Entity.mod.dtd")) {`  
`              file = "NCBI_Entity.mod.dtd";`  
`         }`  
`         if (systemId.contains("NCBI_BlastOutput.mod.dtd")) {`  
`              file = "NCBI_BlastOutput.mod.dtd";`  
`         }`  
`         return new InputSource(BlastOutput.class.getResourceAsStream(file));`  
`   }`

}); InputSource input = new InputSource(new FileReader(new
File("blast-xml-output.xml"))); Source source = new SAXSource(xmlreader,
input); return (BlastOutput) u.unmarshal(source); </java>

### Use the created BlastOutput object

Finally, BlastOutput object, created in the previous step, can be used
like any other Java object.

For example, you can get the matrix used for given Blast search like
this: <java> BlastOutput blastOutput; // assign BlastOutput object,
returned by Unmarshaller (see previous step) String matrix =
blastOutput.getBlastOutputParam().getParameters().getParametersMatrix();
</java> Note that this corresponds to the XML structure: <xml>
<BlastOutput>

` ...`  
` `<BlastOutput_param>  
`   `<Parameters>  
`     `<Parameters_matrix>`BLOSUM62`</Parameters_matrix>  
`     ...`  
`   `</Parameters>  
` `</BlastOutput_param>  
` ...`

</BlastOutput> </xml>
