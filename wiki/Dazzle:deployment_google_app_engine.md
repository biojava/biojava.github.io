---
title: Dazzle:deployment google app engine
---

Work in progress ...
--------------------

**WARNING:[Vincent Rouilly](User:Vincent Rouilly "wikilink") 15:18, 17
August 2009 (UTC)**: this is a very preliminary tutorial. It worked for
me, but this tutorial would need some more inputs to be more robust.
Please drop your comments / feedback at the bottom of the page if you
have given it a try.

### Prerequisites

-   Java 1.5
-   Eclipse 3.4.1 + Google App Engine plug-in from
    <http://code.google.com/appengine/docs/java/tools/eclipse.html>
-   Dazzle code into /tmp/dazzle from: svn checkout
    <http://www.derkholm.net/svn/repos/dazzle/trunk> /tmp/dazzle

### Installation Steps

1.  Create new Google App Engine project from Eclipse (after Google
    Engine plug-in installation):
    1.  Project name: dazzle
    2.  Package: org.biojava.servlets.dazzle
    3.  Uncheck 'Use Google Web Toolkit'
    4.  Finish

<!-- -->

1.  Import 'dazzle' Jar files into 'dazzle google engine' project
    1.  In Eclipse, 'dazzle' project Properties -\> Java Build Path -\>
        Add External Jars
    2.  Import from /tmp/dazzle/jars: bioJava.jar, bytecode.jar,
        dasmi-model.jar, servlet-api-2.3.jar

2.  Import 'dazzle' ressources folder into 'dazzle google engine'
    project
    1.  drag-and-drop /tmp/dazzle/resources folder into
        'Eclipse:/dazzle' folder

3.  Import 'dazzle' src files into 'dazzle google engine' project
    1.  drag-and-drop /tmp/dazzle/src/org folder into 'Eclipse:/
        dazzle/src' folder
    2.  Comment: you should have 3 errors due to the use of Context in
        'MysqlFeatureCache'. For now, I just commented the 2 lines
        involved.

4.  Import /tmp/dazzle/dazzle-webapp files into 'dazzle google engine'
    project
5.  drag-and-drop files from /tmp/dazzle/dazzle-webapp into
    Eclipse:/dazzle/war/. (do not select WEB-INF folder)
6.  Import Jars to WEB-INF/lib
    1.  drag and drop jar files from /tmp/dazzle/jars into 'dazzle
        google engine' Eclipse:/dazzle/war/WEB-INF/lib
    2.  biojava.jar, bytecode.jar, dasmi-model.jar, servelt-api-2.3.jar,
        dazzle.jar

7.  Update web.xml file in Eclipse:/dazzle/war/WEB-INF/

`         [....]`  
`         `<servlet>  
`         `<servlet-name>`Dazzle`</servlet-name>  
`        `<servlet-class>`org.biojava.servlets.dazzle.DazzleServlet`</servlet-class>  
`        `</servlet>  
`        `<servlet-mapping>  
`        `<servlet-name>`Dazzle`</servlet-name>  
`        `<url-pattern>`/das/*`</url-pattern>  
`        `</servlet-mapping>  
`       `<welcome-file-list>  
`               `<welcome-file>`das_welcome.html`</welcome-file>  
`       `</welcome-file-list>  
`       [...]`

1.  Run application in Eclipse as web Application (standalone test)
    1.  check with your web browser: <http://localhost:8080/das/dsn>

2.  If it works, you can create a Google App Engine Application ID and
    deploy your dazzle server on the cloud.
    1.  <http://code.google.com/appengine/docs/java/tools/uploadinganapp.html>

### Comments / Feedback

-   write your comment here ...

It would be nice to see a picture of how the eclipse project should look
after all the imports/moving of code.
