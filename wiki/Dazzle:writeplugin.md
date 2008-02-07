---
title: Dazzle:writeplugin
---

How to write your own Dazzle plugin
===================================

Each Dazzle plugin has to implement several interfaces. Here we will
show how to implement a Dazzle plugin that supports the DAS - features
command:

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
