---
title: BioJava3 eclipse
---

Eclipse is a common IDE for using BioJava.

Prerequisites
-------------

1.  Download Eclipse from
    [<http://www.eclipse.org/>](http://www.eclipse.org/). Several
    flavors are available, which come with different pre-installed
    plugins. We recommend starting with 'Eclipse IDE for Java
    Developers'.
2.  Install the following plugins. See [Plugin
    Installation](#Plugin_Installation "wikilink") below for detailed
    instructions.
    -   m2e - Maven Integration for Eclipse
    -   Eclipse EGit
    -   m2e-egit SCM Handler

Cloning the repository
----------------------

We recommend [creating a
fork](Contributing to BioJava#Forking_Biojava "wikilink") on github for
day-to-day development. In the following instructions you should
substitute something like '<https://github.com/><username>/biojava.git'
for the repository URL. If you don't want to make a fork (for instance,
if you don't plan to make any changes), you can follow the instructions
below exactly.

Option 1: *Try these instructions first. If they don't work, try option
2.*

1.  Go to
2.  In the Maven category, select 'Check out Maven Projects from SCM'
    and click Next.
3.  Select 'git' in the dropdown box. If 'git' is not an option, make
    sure you have the m2e-egit connector installed as descripted below.
4.  Add the URL for your biojava repository on github. For instance, to
    checkout the main repository, use
        https://github.com/biojava/biojava.git

    Make sure that 'Checkout All Projects' is selected and click Finish.

5.  Initiate git tracking for the projects
    1.  Select all biojava modules in the Project Explorer
    2.  Right click and select
    3.  Select 'Git' and click Next
    4.  Select 'Use or create repository in parent folder of project'.
        This will make *{Eclipse Workspace}/biojava* into the local git
        repository.

Finished!

Option 2: *These instructions are more difficult, but may work if Option
1 fails.*

1.  Open the Git Repository View
    1.  Go to
    2.  Under 'Git', select 'Git Repositories'

2.  Clone your git repository. The following is the easiest way to do
    this from within Eclipse, but you could also get a local clone via
    the command line and then add it as a local repository.
    1.  Click the 'Clone Git Repository' icon in the Git Repository View
    2.  Add the URL of your biojava repository on github. For instance,
        to checkout the main repository, use
            https://github.com/biojava/biojava.git

    3.  Optionally add your Github username and password, then click
        Next.
    4.  Select which branches to include. If you plan to commit any
        changes, we recommend only tracking the 'master' branch, so you
        don't accidentally initiate a release. If you want the last
        stable version, you can select 'release' instead. Click Next.
    5.  Choose a destination directory (outside your Eclipse workspace),
        double-check your selection of Initial branch, and click Finish

3.  Import Maven projects from the git repository.
    1.  Right click on the biojava git repository in the Git
        Repositories viewer. Select 'Import Maven Projects...'
    2.  Select all modules and click Finish

4.  Initiate git tracking for the projects
    1.  Select all biojava modules in the Project Explorer
    2.  Right click and select
    3.  Select 'Git' and click Next
    4.  Select 'Use or create repository in parent folder of project'.
        This will use the local repository you cloned previously for
        your source code
    5.  Finished!

You should now have source to all the biojava modules (biojava3-core,
biojava3-structure, etc). Viewing the history for any file should show
you all commits since 2009 which have contributed to that file.

Plugin Installation
-------------------

*This section needs to be expanded with specific instructions for
installing plugins using either Marketplace or directly from the Install
software menu.*

Recent versions of Eclipse come with the Marketplace plugin, which can
be used to find and install additional plugins. Feel free to install the
prerequisites from Marketplace. This tutorial uses the older method of
installing plugins directly from their repositories, which is compatible
with more versions of Eclipse.

### 1. Install Maven m2e

![Screenshot of Install New Software dialog after selecting m2e for
install.](Install_m2e.png "Screenshot of Install New Software dialog after selecting m2e for install.")

1.  In eclipse, go to
2.  Choose '--All Available Sites--' from the 'Work with' dropdown
3.  Search for 'm2e' and check the box next to 'm2e - Maven Integration
    for Eclipse' under Collaboration
4.  Click 'Next', accept the license, and finish the installation
5.  Restart Eclipse at the prompt

If everything went smoothly, after reboot the 'Welcome' screen should
mention 'Maven Integration for Eclipse'.

### 2. Install EGit

Installing egit is very similar to installing m2e.

1.  In eclipse, go to
2.  Choose '--All Available Sites--' from the 'Work with' dropdown
3.  Search for 'egit' and check the box next to 'Eclipse EGit' under
    Collaboration
4.  Click 'Next', accept the license, and finish the installation
5.  Restart Eclipse at the prompt

After rebooting, the Welcome screen should have a section about Git.

### 3. Install the SCM Handler

![The dialog. [Step
1](#3._Install_the_SCM_Handler "wikilink")](EGit SCM install 1.png "fig:The  dialog. Step 1")
![Link to the m2e Marketplace, without any SCM connectors installed.
[Step
3](#3._Install_the_SCM_Handler "wikilink")](EGit SCM install 2.png "fig:Link to the m2e Marketplace, without any SCM connectors installed. Step 3")
![Installing m2e-egit from the m2e Marketplace [Step
4](#3._Install_the_SCM_Handler "wikilink")](EGit SCM install 3.png "fig:Installing m2e-egit from the m2e Marketplace Step 4")

1.  Go to
2.  In the Maven category, select 'Check out Maven Projects from SCM'
    and click Next
3.  At this point, the Git connector is not installed, so the 'SCM URL'
    dropdown will either be blank or will only contain other SCM
    connectors like SVN. Click 'Find more SCM connectors in the m2e
    Marketplace'
4.  Search for 'egit' in the 'Install m2e connectors' dialog. Check the
    'm2e-egit' connector and click Finish.
5.  Click through the installer dialog and license. The security warning
    about unsigned content is safe to ignore.
6.  Restart eclipse (last time!)

Eclipse should now be ready to get the latest checkout of BioJava. See
[Cloning the repository](#Cloning_the_repository "wikilink") above.

Configuring EGit
----------------

You should set your git name and email in Eclipse.

1.  Go to Eclipse Preferences
2.  View
3.  In the 'User Settings' tab, update your name and email.

