---
title: Get source
---

BioJava now using SVN
=====================

As of January 2008 BioJava has moved the version control system from CVS
to Subversion (svn). All Biojava modules, branches and tags and the
history of the files has been imported into the new repository.

Downloading and updating code via Anonymous SVN
-----------------------------------------------

The code.open-bio.org server offers up read-only copies of source code
repositories via anonymous SVN. A list of code repositories available
via SVN can be seen here: <http://code.open-bio.org/svnweb/index.cgi>

Example Usage:

To see what SVN modules the BioJava project is making available, try
this command:

`svn list `[`svn://code.open-bio.org/biojava`](svn://code.open-bio.org/biojava)

### Checking out the latest BioJava code

The following example shows how to obtain the latest BioJava codebase
snapshot using anonymous SVN, it will check out the latest copy of
biojava-live/ from the "SVN trunk" and will locally store it in a
directory named "biojava-live" on your system:

`svn co `[`svn://code.open-bio.org/biojava/biojava-live/trunk`](svn://code.open-bio.org/biojava/biojava-live/trunk)` biojava-live`

### Troubleshooting Anonymous SVN

If you encounter an error while using the SVN client or SVN Web
interface, the likely cause is that our server is in the middle of
replicating the repository from the primary source. While the mirror and
replication process occurs, it is not unusual for SVN client
functionality to break temporarily.

The final step of our codebase replication process is to explicitly
re-verify the health and status of each repository, this process takes a
few moments but while it occurs the repository is "locked" and
unavailable for access.

`   * Anonymous SVN repositories are updated/mirrored hourly from the primary developer server`  
`   * Anonymous SVN repositories are verified and repaired (if necessary) every 20 minutes `

If a SVN client error occurs for longer than 20 minutes, please report
this to: support@helpdesk.open-bio.org

Developer checkout
------------------

For a developer the SVN checkout works like this:

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

### SVN and EOL

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

### Links

See also the [SVN developers page in the OBF
wiki](http://www.open-bio.org/wiki/SVN-Developers)

If you are working with Eclipse see how to configure a svn+ssh://
connection: [subclipse](http://subclipse.tigris.org/faq.html#svn-ssh)

History of the update procedure
-------------------------------

for more detailed documentation about the procedure used for the CVS to
SVN migration see [SVNmigrationHistory](SVNmigrationHistory "wikilink")
