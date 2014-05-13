---
title: BioJava:Make release
---

How to make a BioJava release
-----------------------------

This page is intended for BioJava release managers. I was documenting
this while I was doing the BioJava 1.7
release. --[Andreas](User:Andreas "wikilink") 15:14, 12 April 2009 (UTC)

### Required time

A few hours. Most time is being spent in verifying that the code base is
release ready. The actual preparation of the .jar files and copying them
to the open-bio.org server is quite quick and can be done
semi-automatic.

### Prior to release

-   Announce release deadlines on mailing list

### Configure Authentication Keys

To complete the release you need permission to scp files to the maven
repository on cloudportal.open-bio.org. If you need help with that, talk
to root@open-bio.org. Make sure you have ssh keys set up to log in, and
that you are a member of the apache group so that you can write to the
web directory.

You also need to configure maven with your username and identity file.
In ~/.m2/settings.xml (on the build machine), add or merge the following
xml:

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
     http://maven.apache.org/xsd/settings-1.0.0.xsd">  
`    `<localRepository/>  
`    `<interactiveMode/>  
`    `<usePluginRegistry/>  
`    `<offline/>  
`    `<pluginGroups/>  
`    `<mirrors/>  
`    `<proxies/>  
`    `<profiles/>  
`    `<activeProfiles/>  
`    `<servers>  
`        `<server>  
`            `<id>`biojava-maven-repo`</id>  
`            `<username>`username`</username>  
`            `<privateKey>`/full/path/to/.ssh/id_rsa`</privateKey>  
`        `</server>  
`    `</servers>  
</settings>

Maven reports 'Auth Error' in the release:perform stage if you keys are
not properly set up. Permissions errors mean that authentication was
successful but you can not write to the correct location (for instance,
if a maven-metadata.xml exists from a previous build by another user).

On release date
---------------

**Verify code base**

-   Make sure code is ready for release. Check last minute commits
    (there usually are some).
-   Make sure the auto-build page (cruisecontrol) does not report any
    problems

### Make maven release

the release process is very straightforward nowadays.

`mvn release:clean `

`mvn release:prepare `

`mvn release:perform`

If all three steps work fine, the biggest part of the release has been
completed!. The next steps are just updates of documentation. If
something went wrong you can reset the release process by doing:

`mvn release:rollback`

### Prepare and release javadoc files

`cd biojava-git/target/checkout/`

remove .git files (for preparing -all file)

`find ./ -name ".git" | xargs rm -Rf`

build javadoc:

`mvn site`

`cd biojava-svn/target/checkout/target/site/`

Here we assume the version nr. of the current release is 3.0.7.

` mv apidocs/ api3.0.7`

` tar cvf api3.0.3.tar api3.0.7/`  
  
` gzip api3.0.7.tar`

` scp api3.0.7.tar.gz username@cloudportal.open-bio.org:/home/websites/biojava.org/html/static/docs/`

now log into the couldportal server:

`ssh andreas@cloudportal.open-bio.org`

`cd /home/websites/biojava.org/html/static/docs/`

`tar zxvf api3.0.7.tar.gz`

`rm api`  
  
`ln -s api3.0.7 api`

and back to your local machine...

### Create the biojava-all bundle

in biojava-svn/target

`mv checkout/ bj3.0.7`

`tar zcvf bj3.0.7.tar.gz bj3.0.7`

`mv bj3.0.7.tar.gz biojava-3.0.7-all.tar.gz`  

on portal.open-bio

`cd /home/websites/biojava.org/html/static/download`

`mkdir bj3.0.7`

back to your local machine

`scp biojava-3.0.7-all.tar.gz andreas@cloudportal.open-bio.org:/home/websites/biojava.org/html/static/download/bj3.0.7`

### Javadocs

this is how to enable analytics in javadocs

`cd biojava-svn/target/bj3.0.7/`

`mvn clean install source:jar javadoc:jar deploy javadoc:aggregate`

`cd biojava-svn/target/bj3.0.7/target/site/apidocs`

upload apidocs

### Update the wikipedia pages to link to the new release

Create a new download file for the release. (I copied
<BioJava:Download_3.0.4> to <BioJava:Download_3.0.5>). Modify the new
page to the latest data.

Update <BioJava:Download> (Change the redirect on the BioJava:Download
page to <BioJava:Download_3.0.5>)

Update the <MediaWiki:Sidebar> to point to the new Javadoc api

### AND FINALLY

Write release announcement to biojava-l and biojava-dev
