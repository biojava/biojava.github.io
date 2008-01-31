---
title: Dazzle:eclipse
---

### Dazzle & plugin installation in Eclipse

Instructions how to run [Dazzle](Dazzle "wikilink") in Eclipse using the
Web Standard Tools.

required plugins
----------------

To run Dazzle in Eclipse make sure you have the following eclipse
plugins installed:

`WST - the `[`Web` `Standard` `Tools`
`project`](http://www.eclipse.org/webtools/wst/main.php)  
`Subclipse - the `[`subversion` `plugin` `for`
`eclipse`](http://subclipse.tigris.org/)

`For WST make sure to have your Tomcat/Resin server configured correctly as a Server in Eclipse.`

Step 1 check out Dazzle
-----------------------

Check out the Dazzle code from Subversion as a new Java Project.

Step 2 create a new Dynamic Web Project
---------------------------------------

This project will provide your Dazzle plugin. Let's call it "mydazzle"
for this example.

Step 3 configure new project
----------------------------

Configure the dependencies of "mydazzle".

`->right mouse click ->preferences -> J2EE dependencies`  
`select Dazzle, biojava-live`  
`add the .jar files from biojava-live/`

`->right mouse click ->preferences -> Java Build Path `  
`   ->Projects`  
`    select Dazzle and biojava-live`  

Step 3 copy files
-----------------

Copy the files from the Dazzle/dazzle-webapp subdirectory into you
Dynamic web project / WebContent/

Copy the Dazzle/dazzle-webapp/WEB-INF/web.xml to your Dynamic web
project / WebContent/WEB-INF/web.xml

Step 5 start dynamic web project
--------------------------------

Right mouse click on the dynamic web project-\> run on server.

This will start your project on the server
