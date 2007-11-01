---
title: Get source
---

BioJava starting to use SVN
===========================

Over the next weeks (until Christmas) Biojava will finally move from CVS
to Subversion (svn) as the source code repository. This is happening in
parallel to the other open-bio projects. We will ensure that nothing
gets lost during this migration. This means that all Biojava modules,
branches and tags and the history of the files will be imported into the
new repository.

### Steps during the migration process

Over the next weeks we will

A) Test the migration procedure to ensure nothing gets lost

B) We will declare a CVS freeze at a certain date (giving you enough
time to commit all your latest changes to CVS)

C) After the freeze the final svn migration will happen

D) from that moment on all future Biojava development will happen via
svn, CVS will remain frozen.

Detailed instructions for how to check out and commit code to svn will
be announced closer to the migration date.

Progress Status
---------------

### Testing the migration procedure

currently ongoing.

This procedure will be used for the conversion: (a hack of cvs2svn)
[1](http://hoopajoo.net/misc/converting_to_svn.html)

Thanks to George Hartzell for doing the actual conversion.

### CVS freeze

The date for the final CVS freeze will be announced at least 2 weeks
before the freeze. This should give enough time for all developers to
commit their current developments.

After the CVS freeze we will also do a (minor) BioJava release. This
will be BioJava version 1.5.1

### Final migration to SVN

waiting for CVS freeze first.

### how future checkouts might look like

It is not yet fully set in stone, but the current plan is to use SVN via
ssh. This means a future BioJava checkout might look like this:

svn co svn+ssh://somewhere.open-bio.org/path/not/sure/biojava-live/trunk
./biojava-live

after initial checkout, you can change into this directory and execute
SVN commands without the URL. For example:

svn update svn commit -m "comments for this commit" svn add myfile.java

We will also provide anonymouse checkouts and a browsable interface to
the repository
