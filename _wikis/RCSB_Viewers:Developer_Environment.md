---
title: RCSB Viewers:Developer Environment
---

We are currently using <em>Eclipse</em> for our build environment. Other
environments may work, but since Eclipse is universally available and
free, we highly recommend your using it.

The rest of these instructions are presuming you are using Eclipse.

<dl>
<dt>
Install Java JDK

<dd>
On the Mac, JDK 1.5 is installed for you. Other platforms will vary. In
general, you want to install JDK1.6, if it's available on your
architecture. Make sure the 'JAVAHOME' environment points to your JDK
directory, and that 'JAVAHOME/bin' is in your path. You should be able
to run 'java -version' from the commandline from a fresh login without
having to do anything else.

<dt>
Install Eclipse

<dd>
You can download the latest version (<em>Ganymede, as of this
writing</em>) at the <a href="http://www.eclipse.org/">Eclipse</a>
website. Download the one for your OS/architecture and follow the
instructions to install.

<dt>
Add <em>SVN</em> plugin.

<dd>
We use a specific SVN release - don't use just a generic release:

-   Under the 'Help' menu item, go to 'Software Updates'.
-   Go to the 'Available Software' tab.
-   Click the 'Add' button.
-   Enter this URL in the prompt:
    <em><http://subclipse.tigris.org/></em>
-   After clicking 'Ok', the 'subclipse.tigris.org' selection will
    appear in the tree list. Expand that and select any 'required'
    <em>(Subclipse, SVNKit Adapter)</em> settings, as well as the
    following:
    -   <em>JAVAHL Adapter</em>. Use the Java native version for Mac or
        Linux. Optionally select the jni version for Windows.
-   Click 'Install'. You'll probably want to restart Eclipse.

<dt>
Add the 'open-bio.org' repository

<dd>
You should now be able to get to the SVN perspective (select from
dropdown in upper right.) In this perspective, right click the left
panel and select 'New/Repository Location'.

-   Enter 'svn+ssh://dev.open-bio.org/home/svn-repositories/biojava' in
    the prompt and 'Ok'.
-   Eclipse will further prompt you for your username and password for
    the 'biojava' account. Enter them. You will likely want Eclipse to
    retain your password - otherwise, it will prompt you for a username
    and password for every operation.
-   The repository should now show up in the SVN panel. You should be
    able to expand the tree and look at the various projects.

<dt>
Add the 'TestNG' plugin

<dd>
We have incorporated the <em>TestNG</em> unit testing framework (only in
the *MBT Libs project*.) Unfortunately, that means the project will not
build unless you add the plug-in. To do that:

-   Go to the 'Help/Software Updates/Available Software' panel, again.
-   Click the 'Add' Button.
-   In the prompt, enter: <em><http://beust.com/eclipse></em>
-   Expand the new entry and you will see 'TestNG'. Check that and click
    the Install button.
-   After installing, Eclipse will suggest you restart it. Probably a
    good idea.

<dt>
Check Out the Viewers Projects

<dd>
WARNING: do NOT just check out the 'RCSB Viewers' entry - the projects
will not get checked out properly (and you'll get all of the branches,
tags, and trunk versions, to boot.)

<dd>
In the repository item, expand the 'RCSB Viewers' entry. You will see
three subdirectories:

-   branches
-   tags
-   trunk

For the latest stable release, expand 'tags' and the last entry in tags.

<dd>
For continuing development, either create a new branch or select the
trunk, depending on your requirements.

<dd>
At this point, you will see the list of viewer projects. Select them
all, right click on the selection, and click 'Check Out' from the
dropdown. This can take some time, depending on where you are and what
OS you're using. Best to do it at night before you go to bed.

</dl>
<h1>
Other Build/OS Specific Tweaks

</h1>
The following may be necessary, depending on your environment:

<dl>
<dt>
All

<dd>
Generally, you want to make sure the 'Project/Build Automatically'
menuitem is checked. You can trigger a build manually from the menu, if
you like.

<dl>
<dt>
Jogl (Java OpenGL)

<dd>
Because there is a native component to Jogl, there are some fiddly
aspects to configuring. Almost all of the time there is a problem with a
viewer, it's because it can't create an OpenGL viewer and that's because
it can't find the respective jnilib.

<dd>
If you're having problems, make sure the following is set in the 'Build
Path' configuration panel of <em>all</em> the viewer projects:

-   In the 'Libraries' tab, <em>gluegen-rt.jar</em> and
    <em>jogl.jar</em> should be listed. If not, add them by clicking the
    'Add Jars' button and expanding the tree in the prompt box to '3rd
    Pary Libs/jogl' (ignore the versioned entries - they are there for
    backup purposes),
    `and selecting the jars.  Click 'Ok' and the new jar entries will appear in the list.`

-   In each one of these entries, the 'Native library location' setting
    should be set to:
    `'3rd Party Libs/jogl/jnilibs' (expand the item to see the setting.)`

</dl>
<dt>
Mac

<dd>
Should build and be runnable/debuggable, immediately. As of this
writing, Mac is only actively supporting JDK version 1.5, although 1.6
can be installed as an option. If you change it, make sure you update
all of the Eclipse project settings pertaining to JDK compile and build
environment.

<dt>
Linux & Windows

<dd>
The MBT lib needs the *JAI* and *vecmath* jars to build - these are
provided by default in the Mac JDK, but not on Linux and Windows.

To add them:

-   Right-click on the 'RCSB MBT Libs' project and select 'Build
    Path/Configure Build Path' from the drop-down.
-   Expand the 'Jai' entry (ignore the versioned entries, they are there
    for backup purposes) and select the <em>jai\_codec.jar</em> and
    <em>jai\_core.jar</em> entries. Also, select the *vecmath.jar*
    entry. On pressing ok, these will be added to the path list.
-   Nothing further needs to be done.

<dt>
Linux64/Win64/Sparc/Other

<dd>
The 64bit native shared library names for the Jogl libs unfortunately
conflict with the 32bit native library names, so there's not a real
graceful way to handle this, at the moment.

<dd>
The way I've been doing it is to go down into the 'RCSB Viewer Jars'
project and down to the '3rd Party Libs/jnilibs' path in that project
(this project defines a standalone runtime environment, which is why it
is here.)

<dd>
Here, you will find the original distribution zip files for each
architecture. Unzip the file that corresponds to your architecture and
copy the libs from the resulting '\<libarch...\>/lib/' directory to the
local (jnilibs) directory and to the '../../3rd Party Libs/jogl/jnilibs'
directory.

<dd>
(Expect this to get reorganized, in the future.)

<dd>
At this point, you should be able to debug or run the TestRun scripts.
