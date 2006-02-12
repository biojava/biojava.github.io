---
title: BioJava:Tutorial:Installing and using BioSQL
tags:
 - Tutorial
---

**by David Huen**

This document describes how to install and use BioSQL. BioSQL is a part
of the [OBDA](http://obda.open-bio.org/) standard and was developed as a
common sequence database schema for the different language projects
within the [Open Bioinformatics Foundation](http://www.open-bio.org/).

While BioSQL is fairly vendor-neutral in its design, this tutorial is
based on the case that I know best, that is, the installation of BioSQL
on an x86 machine running RedHat 7.2.

Installing Postgresql
---------------------

If not already installed, PostgreSQL can be installed from RPMs with:

    rpm -ivh postgresql-7.2.1-5.i386.rpm postgresql-libs-7.2.1-5.i386.rpm postgresql-server-7.2.1-5.i386.rpm

Root privileges will almost certainly be required (if not your machine
is seriously insecure!!!). You will also need a JDBC to permit Java to
connect to your PostgreSQL database and that can be installed with
`postgresql-jdbc-7.1.3-2.i386.rpm`. However, I would recommend
downloading the latest from
[here](http://jdbc.postgresql.org/download.html). You will end up with a
jar file containing the JDBC implementation which you will need to place
in your `CLASSPATH`.

The installs will place a control script within
`/etc/init.d<code> named <code>postgresql`. When this script runs for
the first time, it will create a *database cluster* and initialise it.
This cluster is the set of files used by the database for storage
purposes.

On RH7.2 the default location for the cluster in at `/var/lib/pgsql/`.
This is a bit of a disadvantage as `/var` is usually a pretty small
partition. It is possible at this stage to symlink `/var/lib/pgsql` to a
directory within another partition altogether to circumvent this
problem. I would suggest doing this immediately.

At this stage, you will need to create the database you intend using and
a user to use it. I would suggest **not** using the superuser named
`postgres` for anything other than occasional essential administration.

At this point, I will digress briefly into PostgreSQL authentication as
choices you make will affect what you can do. PostgreSQL has a variety
of routes to achieve this. The default at installation permits
connection only from local users and permits access to a database
**only** by a user of the same username. This may be quite adequate for
experimentation but not so convenient if you want to set up a BioSQL
database for several local users or possibly even remote users.

PostgresQL has other mechanisms which are described in their
[documentation](http://www.postgresql.org/idocs/index.php).
Authentication is specifically described
[here](http://www.postgresql.org/idocs/index.php?client-authentication.html).
You might consider password authentication but do use md5 encryption
with this option, especially if you intend to authenticate remote users.
In the Redhat 7.2 installation, the file you will need to edit to set
these options is `/var/lib/pgsql/data/pg_hba.conf`. The location of this
file varies with other distributions.

As initially installed in RH7.2, PostgreSQL will require root privileges
to set up further. The postgres superuser cannot be logged into but you
can invoke the necessary commands from root to execute:

    $ su postgres -c 'createdb <insert db name here>'

and a user created with:

    $ su postgres -c 'createuser <insert user name here>'

For the purposes of this tutorial, I will not change the default
authentication so the database name should be chosen to correspond to
your user name. The user name used in this exercise is *gadfly* and this
will be reflected in the choice of database name and user name. One
additional change that will be necessary is to enable TCP/IP connections
as the Unix domain socket restriction of the default installation is
incompatible with the PostgreSQL JDBC implementation.

To do so, you need to add the `-i` flag to the startup script. Edit
`/etc/init.d/postgresql` and change the line

    su -l postgres -s /bin/sh -c "/usr/bin/pg_ctl -D $PGDATA -p /usr/bin/postmaster start  > /dev/null 2>&1" < /dev/null

to

    su -l postgres -s /bin/sh -c "/usr/bin/pg_ctl -o "-i" -D $PGDATA -p /usr/bin/postmaster start  > /dev/null 2>&1" < /dev/null

The `/var/lib/pgsql/data/pg_hba.conf` file will also need to be edited
to permit access via TCP/IP. This can be achieved by uncommenting:

    #host       all         127.0.0.1     255.255.255.255    trust

Both these operations require root access: seek advice as to the best
option given your local security circumstances.

One additional change is that postgresql in RH7.3 does not come with the
pgsql language enabled. As BioSQL uses that for acceleration, you will
need to enable it. This can be done within root with:

    su postgres -c 'createlang plpgsql template1'

Installing BioSQL
-----------------

The PostgreSQL server must be running to complete the BioSQL
installation. You can check that it is with:-

    $ /etc/rc.d/postgresql status

and doing:-

    $ /etc/rc.d/postgresql start

if it is not running. You may require root privileges for this. You
should have PostgreSQL started up during system startup with the SysV
init system that comes with most Unixen.

You will need three scripts that serve to initialise the new database
with the BioSQL schema and load accelerators for this schema. These
are:-

    biosql-accelerators-pg.sql
    biosqldb-assembly-pg.sql
    biosqldb-pg.sql

They may be obtained from
[here](http://www.biojava.org/download/biosql/).

We now need to load the schema into the database we have created. We do
so as follows (user entries in bold):-

    $ psql gadfly
    Welcome to psql, the PostgreSQL interactive terminal.

    Type:  \copyright for distribution terms
           \h for help with SQL commands
           \? for help on internal slash commands
           \g or terminate with semicolon to execute query
           \q to quit

    gadfly=> \i biosqldb-pg.sql
    CREATE
    psql:biosqldb-pg.sql:13: NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index 'biodatabase_pkey' for table 'biodatabase'
    CREATE
    <rest of output snipped>
    INSERT 16862 1
    psql:biosqldb-pg.sql:304: NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index 'cache_corba_support_pkey' for table 'cache_corba_support'
    CREATE
    gadfly=> \i biosqldb-assembly-pg.sql
    <rest of output snipped>
    gadfly=> \i biosql-accelerators-pg.sql
    <rest of output snipped>
    gadfly=> \q

    $

Let's walk through the session above. psql is the name of the PostgreSQL
interactive shell. We invoke it to connect to the PostgreSQL server and
accept commands for a database named gadfly that we had created earlier.
psql starts and displays its user prompt. All psql commands begin with a
backslash (\\). The \\i instructs psql to take input from a file. I
instruct psql to take input from the biosqldb-pg.sql,
biosqldb-assembly-pg.sql and biosql-accelerators-pg.sql successively.
psql reads the SQL statements within each of the files and proceeds to
construct the BioSQL database schema, printing out a summary of its
actions as it proceeds. Finally, I quit the psql interactive shell with
\\q. At this point you have a BioSQL schema installed and ready to
run!!!

Do remember that if you do not explicitly load the JDBC drivers in your
code, you should set a Java environment variable to tell it what to look
for like so:-

    java -Djdbc.drivers=org.postgresql.Driver <whatever your java code is>

**NOTE: If you are using the 1.3 version of Biojava with the Singapore
schema, do not install biosqldb-assembly-pg.sql or
biosql-accelerators-pg.sql as described above. All you will need is the
the new
[biosqldb-pg.sql](http://cvs.open-bio.org/cgi-bin/viewcvs/viewcvs.cgi/biosql-schema/sql/?cvsroot=biosql).
There appear to be performance issues in some cases when the other stuff
is installed also. This note will be updated eventually to reflect this
advice.**
