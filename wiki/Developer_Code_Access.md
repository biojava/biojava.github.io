---
title: Developer Code Access
---

Developer Access to SVN
=======================

For the developer access a user account on the dev.open-bio server is
required. Once you have such an account, the SVN checkout works like
this:

`svn co svn+ssh://dev.open-bio.org/home/svn-repositories/biojava/biojava-live/trunk/  ./biojava-live`

after initial checkout, you can change into the local ./biojava-live
directory and execute SVN commands without the URL. For example:

`svn update`  
`svn commit -m "comments for this commit"`  
`svn add myfile.java`

If your local user name is different from the one one the open-bio
server you can edit

`~/.ssh/config`

and add

`host dev.open-bio.org`  
`user blablabla`

Eclipse Tips
------------

SVN plugin: Get the subclipse SVN plugin from
[<http://subclipse.tigris.org/>](http://subclipse.tigris.org/) Maven
plugin: We recommend getting the m2eclipse plugin from
[<http://m2eclipse.sonatype.org/>](http://m2eclipse.sonatype.org/)

Once you have both plugins installed, you can browse through the SVN
repository within eclipse, right-click on the biojava/trunk folder and
check out as a Maven project.

For more details see [BioJava3\_eclipse](BioJava3_eclipse "wikilink").

SVN and EOL
-----------

Unlike CVS, Subversion does not automatically convert End Of Line
characters, which can cause problems across different operating systems.
To work around this SVN is providing the [eol-style
property](http://svnbook.red-bean.com/en/1.1/ch07s02.html#svn-ch-7-sect-2.3.5).

An easy way to ensure that new files are added with this property
present is to configure the auto-props in your

`~/.subversion/config `

file. By default this will contain commented-out configuration entries
for enabling auto-props. Change this to

    ### Section for configuring miscellaneous Subversion options.
    [miscellany]
    ### Set enable-auto-props to 'yes' to enable automatic properties
    ### for 'svn add' and 'svn import', it defaults to 'no'.
    ### Automatic properties are defined in the section 'auto-props'.
    enable-auto-props = yes

    ### Section for configuring automatic properties.
    ### The format of the entries is:
    ###   file-name-pattern = propname[=value][;propname[=value]...]
    ### The file-name-pattern can contain wildcards (such as '*' and
    ### '?').  All entries which match will be applied to the file.
    ### Note that auto-props functionality must be enabled, which
    ### is typically done by setting the 'enable-auto-props' option.
    [auto-props]
    *.bat = svn:mime-type=text/plain;svn:eol-style=native
    *.bmp = svn:mime-type=image/bmp
    *.c = svn:mime-type=text/plain;svn:eol-style=native
    *.css = svn:mime-type=text/css;svn:eol-style=native
    *.cpp = svn:mime-type=text/plain;svn:eol-style=native
    *.cxx = svn:mime-type=text/plain;svn:eol-style=native
    *.dylan = svn:mime-type=text/plain;svn:eol-style=native
    *.dylgram = svn:mime-type=text/plain;svn:eol-style=native
    *.el = svn:mime-type=text/plain;svn:eol-style=native
    *.gif = svn:mime-type=image/gif
    *.h = svn:mime-type=text/plain;svn:eol-style=native
    *.hdp = svn:mime-type=text/plain;svn:eol-style=native
    *.htm = svn:mime-type=text/html;svn:eol-style=native
    *.html = svn:mime-type=text/html;svn:eol-style=native
    *.ico = svn:mime-type=image/x-icon
    *.idl = svn:mime-type=text/plain;svn:eol-style=native
    *.intr = svn:mime-type=text/plain;svn:eol-style=native
    *.jam = svn:mime-type=text/plain;svn:eol-style=native
    *.java = svn:mime-type=text/plain;svn:eol-style=native
    *.jpeg = svn:mime-type=image/jpeg
    *.jpg = svn:mime-type=image/jpeg
    *.lid = svn:mime-type=text/plain;svn:eol-style=native
    *.lisp = svn:mime-type=text/plain;svn:eol-style=native
    *.lout = svn:mime-type=text/plain;svn:eol-style=native
    *.m4 = svn:mime-type=text/plain;svn:eol-style=native
    *.pdf = svn:mime-type=application/pdf
    *.pl = svn:mime-type=text/plain;svn:eol-style=native;svn:executable
    *.png = svn:mime-type=image/png
    *.py = svn:mime-type=text/plain;svn:eol-style=native;svn:executable
    *.rc = svn:mime-type=text/plain;svn:eol-style=native
    *.sgm = svn:mime-type=text/sgml;svn:eol-style=native
    *.sgml = svn:mime-type=text/sgml;svn:eol-style=native
    *.sh = svn:mime-type=text/plain;svn:eol-style=native;svn:executable
    *.spec = svn:mime-type=text/plain;svn:eol-style=native
    *.sql = svn:mime-type=text/plain;svn:eol-style=native
    *.tif = svn:mime-type=image/tiff
    *.tiff = svn:mime-type=image/tiff
    *.text = svn:mime-type=text/plain;svn:eol-style=native
    *.txt = svn:mime-type=text/plain;svn:eol-style=native
    *.xhtml = svn:eol-style=native
    *.xml = svn:mime-type=text/xml;svn:eol-style=native
    INSTALL = svn:mime-type=text/plain;svn:eol-style=native
    README = svn:mime-type=text/plain;svn:eol-style=native
