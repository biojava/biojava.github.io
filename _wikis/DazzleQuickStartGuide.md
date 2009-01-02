---
title: DazzleQuickStartGuide
---

Steps required to set up dazzle with already available plugins:

download container (apache tomcat 5.26)
=======================================

Go to

download eclipse (EasyEclipse which has Web tools already).
===========================================================

right click on the servers tab at the bottom of eclipse. click new,
server. browse to the tomcat 5.5.26 dir and select. then select the
jvm1.60 from the dropdown menu below. next, next, ok. drag the web.xml
file from the dazzle-webapp dir to the webcontent/web-inf dir then drag
all the other files from that dir into the webcontent dir above the
web-inf dir!!!

choose import, other, checkout projects from svn. click next (create new
repository location). type in
"<http://www.derkholm.net/svn/repos/dazzle/>" next select the trunk
directory next leave the default "check out the project using the New
Project Wizard" open web dir then select dynamic web project type in the
name of your project "TutorialDazzleTest" finish click ok when it talks
about standard resources right click on the project in the eclipse
explorer window and select "build path" then "configure build path","add
jars" then open the project in the popup that appears and a jars dir
should be visible, then select all the jar files, then ok. (newer
features require java 5.0 so we need to make sure the project is
configured to use java 5.0 as standard). rigt click on the project and
select properties then the J2EE tab, then select the jar files as before
to be added to the project.

go to project properties again and select the source tab- then tick the
resources foler and ok. now go to the dazzlecfg.xml file that you just
moved into the webcontent folder and alter the "value" next to filename
for all occurances and put a / in front e.g. change "test.embl" to
"/test.embl"

get dazzle from svn
===================

configure dazzle.xml
====================

deploy using eclipse
====================
