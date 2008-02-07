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

A minimal plugin
----------------

A minimal plugin for Dazzle looks like this: let's call the file below
MyPlugin.java <java> package org.dazzle;

import org.biojava.servlets.dazzle.datasource.AbstractGFFFeatureSource;
import org.biojava.servlets.dazzle.datasource.DataSourceException;
import org.biojava.servlets.dazzle.datasource.GFFFeature;

public class MyPlugin extends AbstractGFFFeatureSource {

`   public GFFFeature[] getFeatures(String reference) `  
`   throws DataSourceException{`  
`       System.out.println("got a features request for " + reference);`  
`       return new GFFFeature[0];`  
`   }`

} </java>

and to enable this in Dazzle we add the following lines to
**dazzlecfg.xml** :


     <datasource id="myplugin" jclass="org.dazzle.MyPlugin">
        <string name="name" value="My 1st Plugin" />
        <string name="description" value="a demo for how to write a Dazzle plugin" />
        <string name="version" value="1.0" />
      </datasource>
