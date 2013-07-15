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

### Prepare your release server

Make sure you have access to a server that has the ssh keys setup for
cloudportal.open-bio.org. If you need help with that, talk to
root@open-bio.org.

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

remove .svn files (fore preparing -all file)

`find ./ -name ".svn" | xargs rm -Rf`

build javadoc:

`mvn site`

`cd biojava-svn/target/checkout/target/site/`

` mv apidocs/ api3.0.3`

` tar cvf api3.0.3.tar api3.0.3/`  
  
` gzip api3.0.3.tar`

` scp api3.0.3.tar.gz username@cloudportal.open-bio.org:/home/websites/biojava.org/html/static/docs/`

now log into the couldportal server:

`ssh andreas@cloudportal.open-bio.org`

`cd /home/websites/biojava.org/html/static/docs/`

`tar zxvf api3.0.4.tar.gz`

`rm api`  
  
`ln -s api3.0.3 api`

and back to your local machine...

### Create the biojava-all bundle

in biojava-svn/target

`mv checkout/ bj3.0.3`

`tar zcvf bj3.0.3.tar.gz bj3.0.3`

`mv bj3.0.3.tar.gz biojava-3.0.3-all.tar.gz`  

on portal.open-bio

`cd /home/websites/biojava.org/html/static/download`

`mkdir bj3.0.3`

back to your local machine

`scp biojava-3.0.3-all.tar.gz andreas@portal.open-bio.org:/home/websites/biojava.org/html/static/download/bj3.0.3`

### Javadocs

this is how to enable analytics in javadocs

`cd biojava-svn/target/bj3.0.4/`

`mvn clean install source:jar javadoc:jar deploy javadoc:aggregate`

`cd biojava-svn/target/bj3.0.4/target/site/apidocs`

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
