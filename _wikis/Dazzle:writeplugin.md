---
title: Dazzle:writeplugin
---

How to write your own Dazzle plugin
===================================

Each Dazzle plugin has to implement certain interfaces. Here we will
show how to implement a Dazzle plugin that supports the DAS - features
command, using the GFFFeatureSource interface. There are also other
plugin mechanisms in Dazzle, but for the moment let's only consider this
one.

The GFFFeatureSource interface
------------------------------

The Interface that needs to be implemented is the
[GFFFeatureSource](http://www.derkholm.net/svn/repos/dazzle/trunk/src/org/biojava/servlets/dazzle/datasource/GFFFeatureSource.java)
interface.

What this means is that the DAS source provides a method called

`GFFFeature getFeatures(String reference);`

This method accepts a String as an argument, that represents either the
chromosomal region or the accession code that is requested. It returns
an array of
[GFFFeature](http://www.derkholm.net/svn/repos/dazzle/trunk/src/org/biojava/servlets/dazzle/datasource/GFFFeature.java)
objects that contain the data that should be transported.

When Dazzle gets a DAS - Features request for your DAS source, it will
call this getFeatures method in order to obtain the data and then return
it as DAS-XML.

The AbstractGFFFeatureSource class
----------------------------------

For full DAS-specification support a couple of more methods are
required, but they do not need to worry us right now, since there is a
utility class available that contains most of the required code already.
Your plugin simply needs to extend
[AbstractGFFFeatureSource](http://www.derkholm.net/svn/repos/dazzle/trunk/src/org/biojava/servlets/dazzle/datasource/AbstractGFFFeatureSource.java).
