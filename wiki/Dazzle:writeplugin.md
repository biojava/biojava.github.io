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

`getFeatures(String reference)`

that returns an array of
[GFFFeature.java](http://www.derkholm.net/svn/repos/dazzle/trunk/src/org/biojava/servlets/dazzle/datasource/GFFFeature.java)
objects that contain the data that should be transported.
