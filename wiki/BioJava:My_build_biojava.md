---
title: BioJava:My build biojava
---

<xml>

<?xml version="1.0"?>
<project name="biojava" default="package-biojava" basedir=".">

` `<target name="init" description="Checks environment and setup variables">  
`   `<tstamp />  
`   `<tstamp>  
`     `<format property="build.time" pattern="MM/dd/yyyy hh:mm aa" />  
`   `</tstamp>  
`   `<property name="version"        value="1.7.1" />  
`   `<property name="build.compiler" value="javac1.5" />  
`   `<property name="classpath"      value="bytecode.jar:commons-cli.jar:commons-collections-2.1.jar:commons-dbcp-1.1.jar:commons-pool-1.1.jar:hsqldb.jar:jgrapht-jdk1.5.jar" />  
`   `<property name="ant-tasks.path" value="ant-lib/sablecc.jar:ant-lib/anttask.jar" />

`   `<available classpath="${java.class.path}"
               classname="junit.framework.TestCase"
               property="junit.present" />

`   `<available classpath="${java.class.path}"
               classname="org.apache.tools.ant.taskdefs.XSLTProcess$OutputProperty"
               property="outputproperty.support" />

`   `<available classpath="${java.class.path}"
               classname="org.apache.tools.ant.taskdefs.optional.junit.JUnitTest"
               property="junit.support" />

`   `<available classpath="${java.class.path}"
               classname="java.nio.Buffer"
               property="java14">  
`   `</available>

`   `<available classpath="${classpath}"
               classname="org.hsqldb.jdbcDriver"
               property="sqlDriver.hsqldb">  
`   `</available>

`   `<echo message="Building biojava-${version} at ${build.time}" />  
`   `<echo message="Java Home:                       ${java.home}"/>  
`   `<echo message="JUnit present:                   ${junit.present}" />  
`   `<echo message="JUnit supported by Ant:          ${junit.support}" />  
`   `<echo message="HSQLDB driver present:           ${sqlDriver.hsqldb}" />  
`   `<echo message="XSLT support:                    ${outputproperty.support}"/>

`   `<property name="bioj" value="."/>

`   `<property name="readme"        value="${bioj}/README" />  
`   `<property name="license"       value="${bioj}/LICENSE" />  
`   `<property name="src.dir"       value="${bioj}/src" />  
`   `<property name="tests.dir"     value="${bioj}/tests" />  
`   `<property name="demos.dir"     value="${bioj}/demos" />  
`   `<property name="apps.dir"      value="${bioj}/apps" />  
`   `<property name="docs.dir"      value="${bioj}/docs" />  
`   `<property name="doc.css.file"  value="${bioj}/biojava-doc.css" />  
`   `<property name="reports.dir"   value="${bioj}/reports" />  
`   `<property name="manifest.dir"  value="${bioj}/manifest" />  
`   `<property name="resources.dir" value="${bioj}/resources" />

`   `<property name="build.dir"         value="${bioj}/ant-build" />  
`   `<property name="build.classes.dir" value="${build.dir}/classes" />

`   `<property name="javac.depend"      value="false" />  
`   `<property name="javac.debug"       value="true" />  
`   `<property name="javac.deprecation" value="false" />  
`   `<property name="javac.source"      value="1.5" />  
`   `<property name="javac.target"      value="1.5" />

`   `<property name="build.dest.docs"     value="${build.dir}/docs" />  
`   `<property name="build.dest.doccheck" value="${build.dir}/docs/check" />  
`   `<property name="packages"            value="org.*" />

`   `<property name="name.biojava"           value="biojava" />  
`   `<property name="Name.biojava"           value="BioJava" />  
`   `<property name="build.dest.biojava"     value="${build.classes.dir}/${name.biojava}" />  
`   `<property name="build.docs.biojava"     value="${build.dest.docs}/${name.biojava}" />  
`   `<property name="build.doccheck.biojava" value="${build.dest.doccheck}/${name.biojava}" />  
`   `<property name="jar.biojava"            value="${build.dir}/${name.biojava}.jar" />  
`   `<property name="manifest.file.biojava"  value="${manifest.dir}/${name.biojava}.txt" />  
`   `  
`   `<property name="name.tests"       value="tests" />  
`   `<property name="build.dest.tests" value="${build.classes.dir}/${name.tests}" />  
`   `<property name="build.docs.tests" value="${build.dest.docs}/${name.tests}" />  
`   `<property name="reports.tests"    value="${bioj}/reports/tests" />  
`   `  
`   `<property name="name.demos"          value="demos" />  
`   `<property name="Name.demos"          value="BioJava Demos" />  
`   `<property name="build.dest.demos"    value="${build.classes.dir}/${name.demos}" />  
`   `<property name="build.docs.demos"    value="${build.dest.docs}/${name.demos}" />  
`   `<property name="jar.demos"           value="${build.dir}/${name.demos}.jar" />  
`   `<property name="manifest.file.demos" value="${manifest.dir}/${name.demos}.txt" />  
`   `  
`   `<property name="name.apps"          value="apps" />  
`   `<property name="Name.apps"          value="BioJava Applications" />  
`   `<property name="build.dest.apps"    value="${build.classes.dir}/${name.apps}" />  
`   `<property name="build.docs.apps"    value="${build.dest.docs}/${name.apps}" />  
`   `<property name="jar.apps"           value="${build.dir}/${name.apps}.jar" />  
`   `<property name="manifest.file.apps" value="${manifest.dir}/${name.apps}.txt" />

`   `<property name="dist.root"          value="${bioj}/dist" />  
`   `<property name="dist.dir"           value="${dist.root}/${name.biojava}-${version}" />  
` `</target>

` `<target name="prepare" depends="init" description="creates basic directories">  
`   `  
`   `<mkdir dir="${build.dir}" />

`   `<copy todir="${build.dir}">  
`     `<fileset dir=".">  
`       `<include name="*.jar" />  
`     `</fileset>  
`   `</copy>

` `</target>

` `<target name="prepare-taglets" depends="prepare" description="Copies taglet files">  
`   `<mkdir dir="${build.dest.taglets}" />  
`   `<mkdir dir="${build.docs.taglets}" />  
` `</target>

` `<target name="prepare-biojava" depends="prepare"
  description="Prepares biojava source files">  
`   `  
`   `<mkdir dir="${build.dest.biojava}" />  
`   `<mkdir dir="${build.docs.biojava}" />  
`   `<mkdir dir="${build.doccheck.biojava}" />  
` `</target>

` `<target name="prepare-tests" depends="prepare"
  description="Prepares the test source code">

`   `<mkdir dir="${build.dest.tests}" />  
`   `<mkdir dir="${build.docs.tests}" />  
`   `<mkdir dir="${reports.tests}" />  
` `</target>

` `<target name="prepare-demos" depends="prepare"
  description="Prepares the demos code">

`   `<mkdir dir="${build.dest.demos}" />  
`   `<mkdir dir="${build.docs.demos}" />  
` `</target>

` `<target name="prepare-apps" depends="prepare"
  description="Prepares the apps code">

`   `<mkdir dir="${build.dest.apps}" />  
`   `<mkdir dir="${build.docs.apps}" />  
` `</target>

` `<target name="prepare-javadocs" depends="prepare" description="Prepares the javadocs">

`   `<mkdir dir="${build.dest.docs}" />  
` `</target>

` `<target name="compile-biojava" depends="prepare-biojava"
  description="Compiles the source directory">  
`   `<javac
      encoding="ISO-8859-1"
      srcdir="${src.dir}"
      destdir="${build.dest.biojava}"
      depend="${javac.depend}"
      deprecation="${javac.deprecation}"
      source="${javac.source}"
      target="${javac.target}"
      debug="${javac.debug}">  
`     `<classpath>  
`       `<pathelement path="${classpath}" />  
`     `</classpath>  
`   `</javac>  
` `</target>

` `<target name="compile-tests" depends="prepare-tests,package-biojava"
  description="Compiles the tests directory">  
`   `<javac
      encoding="ISO-8859-1"
      srcdir="${tests.dir}"
      destdir="${build.dest.tests}"
      depend="${javac.depend}"
      deprecation="${javac.deprecation}"
      source="${javac.source}"
      target="${javac.target}"
      debug="${javac.debug}">  
`     `<classpath>  
`       `<pathelement path="${classpath}" />  
`       `<pathelement path="${jar.biojava}" />  
`     `</classpath>  
`   `</javac>  
` `</target>

` `<target name="compile-demos" depends="prepare-demos,package-biojava"
  description="Compiles the demos directory">  
`   `<javac
      encoding="ISO-8859-1"
      srcdir="${demos.dir}"
      destdir="${build.dest.demos}"
      depend="${javac.depend}"
      deprecation="${javac.deprecation}"
      source="${javac.source}"
      target="${javac.target}"
      debug="${javac.debug}">  
`     `<classpath>  
`       `<pathelement path="${classpath}" />  
`       `<pathelement path="${jar.biojava}" />  
`     `</classpath>  
`   `</javac>  
` `</target>

` `<target name="compile-apps" depends="prepare-apps,package-biojava"
  description="Compiles the apps directory">  
`   `<javac
      encoding="ISO-8859-1"
      srcdir="${apps.dir}"
      destdir="${build.dest.apps}"
      depend="${javac.depend}"
      deprecation="${javac.deprecation}"
      source="${javac.source}"
      target="${javac.target}"
      debug="${javac.debug}">  
`     `<classpath>  
`       `<pathelement path="${classpath}" />  
`       `<pathelement path="${jar.biojava}" />  
`     `</classpath>  
`   `</javac>  
` `</target>

` `<target name="package-biojava" depends="compile-biojava"
  description="create biojava class jar file">  
`   `<jar
      jarfile="${jar.biojava}"
      manifest="${manifest.dir}/biojava.txt"
    >  
`     `<fileset dir="${build.dest.biojava}" />  
`     `<fileset dir="${resources.dir}" />  
`   `</jar>  
` `</target>

` `<target name="package-demos" depends="init,package-biojava,compile-demos"
  description="create the demo jar file">  
`   `<jar
      jarfile="${jar.demos}"
      manifest="${manifest.dir}/demos.txt"
    >  
`     `<fileset dir="${build.dest.demos}" />  
`   `</jar>  
` `</target>

` `<target name="package-apps" depends="init,package-biojava,compile-apps"
  description="create the apps jar file">  
`   `<jar
      jarfile="${jar.apps}"
      manifest="${manifest.dir}/apps.txt"
    >  
`     `<fileset dir="${build.dest.apps}" />  
`   `</jar>  
` `</target>

` `<target
    name="package-all"
    depends="package-biojava,package-demos,package-apps"
    description="create all the jar files" />

<target
    name="sign"
    depends="package-biojava"
    description="sign the biojava.jar file with jarsigner"
    >

`   `<copy file="${jar.biojava}" tofile="${build.dir}/biojavaUnsigned.jar" />

`   `<signjar jar="${build.dir}/biojavaUnsigned.jar"
             signedjar="${jar.biojava}"
             keystore="selfSignedCertificate/selfSignedCertificate.store"
             storepass="biojavaCVS" 
         alias="biojavaCVS" />

`    `<delete file="${build.dir}/biojavaUnsigned.jar"/>

` `</target>

` `<target name="javadocs-biojava" depends="clean, prepare-biojava"
  description="Creates the API documentation">  
`   `<echo message="building custom javadocs" />  
`   `<javadoc
      encoding="ISO-8859-1"
      packagenames="${packages}"
      sourcepath="${src.dir}"
      classpath="${classpath}"
      destdir="${build.docs.biojava}"
      author="true"
      version="true"
      use="true"
      source="1.5"
      windowtitle="${Name.biojava}-${version} API (Javadocs) (${build.time})"
      doctitle="${Name.biojava}-${version} API (${build.time})"
      maxmemory="150m"
      footer="&lt;script src=&quot;http://www.google-analytics.com/urchin.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;&lt;script type=&quot;text/javascript&quot;&gt;_uacct = &quot;UA-1326640-1&quot;;urchinTracker();&lt;/script&gt;"
      >  
`      `<link href="http://java.sun.com/j2se/1.5.0/docs/api/" offline="false"/>

`      `<group title="Core biological packages"
              packages="org.biojava.bio:org.biojava.bio.dist:org.biojava.bio.search:org.biojava.bio.seq:org.biojava.bio.seq.db:org.biojava.bio.seq.genomic:org.biojava.bio.seq.io:org.biojava.bio.symbol:org.biojava.bio.alignment:org.biojava.directory:org.biojava.bibliography:org.biojava.bio.taxa:org.biojava.bio.seq.filter" />

`      `<group title="User interface components"
              packages="org.biojava.bio.gui:org.biojava.bio.gui.glyph:org.biojava.bio.gui.sequence:org.biojava.bio.gui.sequence.tracklayout" />

`      `<group title="Sequence databases and formats"
              packages="org.biojava.bio.seq.io.agave:org.biojava.bio.program.das:org.biojava.bio.seq.ragbag:org.biojava.bio.seq.db.emblcd:org.biojava.bio.program.xff:org.biojava.bio.seq.dist:org.biojava.bio.seq.io.game:org.biojava.bio.seq.io.game12:org.biojava.bio.seq.db.biofetch:org.biojava.bio.seq.db.flat:org.biojava.bio.seq.db.biosql:org.biojava.bio.program.indexdb:org.biojava.bio.program.das.dasalignment:org.biojava.bio.program.homologene" />

`      `<group title="Handling output from external tools"
              packages="org.biojava.bio.program:org.biojava.bio.program.gff:org.biojava.bio.program.gff3:org.biojava.bio.program.sax:org.biojava.bio.program.xml:org.biojava.bio.program.blast2html:org.biojava.bio.program.search:org.biojava.bio.program.ssbind:org.biojava.bio.program.phred:org.biojava.bio.program.hmmer:org.biojava.bio.program.sax.blastxml" />

`      `<group title="Dynamic programming packages"
              packages="org.biojava.bio.dp:org.biojava.bio.dp.onehead:org.biojava.bio.dp.twohead" />

`      `<group title="Chromatogram and trace file support"
              packages="org.biojava.bio.chromatogram:org.biojava.bio.program.abi:org.biojava.bio.program.scf:org.biojava.bio.chromatogram.graphic" />

`      `<group title="Macromolecular structure"
              packages="org.biojava.bio.structure:org.biojava.bio.structure.io:org.biojava.bio.program.das.dasstructure:org.biojava.bio.structure.align:org.biojava.bio.structure.align.helper:org.biojava.bio.structure.align.pairwise:org.biojava.bio.structure.jama" />`    `  
`             `  
`      `<group title="Utilities and developers' packages"
              packages="org.biojava.utils.process:org.biojava.bio.seq.impl:org.biojava.bio.seq.projection:org.biojava.utils:org.biojava.utils.cache:org.biojava.utils.xml:org.biojava.utils.stax:org.biojava.utils.io:org.biojava.utils.math:org.biojava.utils.net:org.biojava.utils.candy:org.biojava.bio.seq.io.filterxml:org.biojava.bio.program.tagvalue:org.biojava.ontology:org.biojava.ontology.io:org.biojava.utils.automata:org.biojava.utils.regex:org.biojava.naming:org.biojava.utils.walker" />

`      `<group title="Molecular biology packages"
              packages = "org.biojava.bio.proteomics:org.biojava.bio.proteomics.aaindex:org.biojava.bio.molbio" />  
`             `  
`      `<group title="Ontology packages"
              packages = "org.biojava.bio.ontology:org.biojava.bio.ontology.io"/>  
`                     `  
`      `<group title="Experimental packages"
              packages="org.biojava.stats.svm:org.biojava.stats.svm.tools:org.biojava.bio.seq.homol:org.biojava.utils.lsid:org.biojava.bio.program.unigene:org.biojava.bio.program.ssaha:org.biojava.bio.seq.distributed:org.biojava.bio.annodb:org.biojava.bio.program.formats" />

`      `<group title="Biojava extension (biojavax) packages"
              packages="org.biojavax:org.biojavax.bio:org.biojavax.bio.db:org.biojavax.bio.db.biosql:org.biojavax.bio.db.ncbi:org.biojavax.bio.seq:org.biojavax.bio.seq.io:org.biojavax.bio.taxa:org.biojavax.bio.taxa.io:org.biojavax.ontology:org.biojavax.utils" />  
`             `  
`      `<group title="Genetic Algorithm Framework"
              packages="org.biojavax.ga:org.biojavax.ga.exception:org.biojavax.ga.functions:org.biojavax.ga.impl:org.biojavax.ga.util" />  
`      `<group title="Experimental Phylogeny packages"
              packages="org.biojavax.bio.phylo:org.biojavax.bio.phylo.io:org.biojavax.bio.phylo.io.nexus:org.biojavax.bio.phylo.io.phylip:org.biojavax.bio.phylo.tree" />  
`      `  
`   `</javadoc>  
` `</target>

` `<target name="javadocs-demos" depends="prepare-demos,compile-biojava"
  description="Create the demos API documentation">  
`   `<javadoc
      encoding="ISO-8859-1"
      packagenames="**"
      sourcepath="${demos.dir}"
      classpath="${classpath}:${build.dest.biojava}"
      destdir="${build.docs.demos}"
      author="true"
      version="true"
      use="true"
      source="1.5"
      windowtitle="${Name.demos} API"
      doctitle="${Name.demos}"
      maxmemory="100m">  
`     `<link href="http://java.sun.com/j2se/1.5.0/docs/api/" offline="false"/>  
`     `<link href="../biojava" offline="true" packagelistLoc="${build.docs.biojava}/package-list}"/>  
`   `</javadoc>  
` `</target>

` `<target name="javadocs-apps" depends="prepare-apps,compile-biojava"
  description="Create the apps API documentation">  
`   `<javadoc
      encoding="ISO-8859-1"
      packagenames="org.*"
      sourcepath="${apps.dir}"
      classpath="${classpath}:${build.dest.biojava}"
      destdir="${build.docs.apps}"
      author="true"
      version="true"
      use="true"
      source="1.5"
      windowtitle="${Name.apps} API"
      doctitle="${Name.apps}"
      maxmemory="100m">  
`     `<link href="http://java.sun.com/j2se/1.5.0/docs/api/" offline="false"/>  
`     `<link href="../biojava" offline="true" packagelistLoc="${build.docs.biojava}/package-list}"/>  
`   `</javadoc>  
` `</target>

` `<target
    name="javadocs-all"
    depends="javadocs-biojava,javadocs-demos,javadocs-apps"
    description="Creates the javadocs for all components"
  />

` `<target name="runtests" 
      depends="compile-tests"
      description="Run all tests, can be quite slow">  
`   `<property name="test.subtree" value="**" />  
`   `<echo message="Running tests:           ${test.subtree}" />  
`   `<junit maxmemory="128m" printsummary="yes" haltonfailure="no" reloading="no">  
`     `<formatter type="plain" usefile="true" />  
`     `<classpath>  
`       `  
`       `<pathelement path="${build.dest.biojava}" />  
`       `  
`       `<pathelement path="${resources.dir}" />  
`       `  
`       `<pathelement path="${build.dest.tests}" />  
`       `  
`       `<pathelement path="${tests.dir}/files" />  
`       `  
`       `<pathelement path="${tests.dir}" />  
`       `  
`       `<pathelement path="${classpath}" />  
`       `  
`       `<pathelement path="${java.class.path}" />  
`     `</classpath>  
`     `  
`     `<batchtest fork="no" todir="${reports.tests}" if="junit.present">  
`       `<fileset dir="${build.dest.tests}">  
`         `<include name="${test.subtree}/*Test.class" />  
`         `<include name="${test.subtree}/*TestSuite.class" />  
`         `<exclude name="**/Abstract*Test.class" />  
`       `</fileset>  
`     `</batchtest>  
`   `</junit>  
` `</target>

` `<target name="doccheck-biojava" depends="prepare-biojava"
    description="Checks the API documentation">  
`   `<javadoc
      encoding="ISO-8859-1"
      doclet="com.sun.tools.doclets.doccheck.DocCheck"
      docletpath="doccheck.jar"
      packagenames="${packages}"
      sourcepath="${src.dir}"
      classpath="${classpath}"
      destdir="${build.doccheck.biojava}"
      source="1.5"
      maxmemory="80m">  
`   `</javadoc>  
` `</target>

` `<target name="cruise" 
          depends="clean,package-biojava,compile-tests"
          description="Run clean, build and tests for CruiseControl">  
`   `<property name="test.subtree" value="**" />  
`   `<echo message="Running tests:           ${test.subtree}" />  
`   `<junit  maxmemory="128m" 
            printsummary="yes" 
        haltonfailure="no" 
        reloading="no"
        errorProperty="test.failed"
        >  
`     `<formatter type="xml" />  
`     `<classpath>  
`       `  
`       `<pathelement path="${build.dest.biojava}" />  
`       `  
`       `<pathelement path="${resources.dir}" />  
`       `  
`       `<pathelement path="${build.dest.tests}" />  
`       `  
`       `<pathelement path="${tests.dir}/files" />  
`       `  
`       `<pathelement path="${tests.dir}" />  
`       `  
`       `<pathelement path="${classpath}" />  
`       `  
`       `<pathelement path="${java.class.path}" />  
`     `</classpath>  
`     `  
`     `<batchtest fork="no" todir="${reports.tests}" if="junit.present">  
`       `<fileset dir="${build.dest.tests}">  
`         `<include name="${test.subtree}/*Test.class" />  
`         `<include name="${test.subtree}/*TestSuite.class" />  
`         `<exclude name="**/Abstract*Test.class" />  
`       `</fileset>  
`     `</batchtest>`      `  
`   `</junit>  
`   `<fail message="Tests failed: check test reports." if="test.failed" />  
` `</target>

` `<target name="clean" 
      depends="init"
      description="Cleans everything">  
`   `<delete dir="${build.dir}" />  
`   `<delete dir="${reports.tests}" />  
` `</target>  
` `  
` `  
` `<target name="clean-dist" depends="init" description="Cleans the dist root directory">  
`     `<delete dir="${dist.root}" />  
` `</target>  
` `  
` `  
` `  
` `<target name="dist" depends="clean-dist, init, javadocs-all, package-all" description="copy all the files for a distribution">  
`     `<mkdir dir="${dist.root}"/>  
`     `<mkdir dir="${dist.dir}"/>  
`     `  
`    `  
`     `<copy file="${jar.biojava}" tofile="${dist.dir}/${name.biojava}-${version}.jar"/>  
`     `  
`     `  
`     `<copy file="${jar.apps}" tofile="${dist.dir}/apps-${version}.jar"/>  
`     `  
`     `  
`     `<copy file="${jar.demos}" tofile="${dist.dir}/demos-${version}.jar"/>  
`     `  
`     `  
`     `<copy todir="${dist.dir}">  
`       `<fileset dir=".">  
`         `<include name="*.jar" />  
`       `</fileset>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/doc">  
`         `<fileset dir="${build.dest.docs}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/src">  
`         `<fileset dir="${src.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy tofile="${dist.dir}/README" file="${bioj}/README"/>  
`     `<copy tofile="${dist.dir}/README.biosql" file="${bioj}/README.biosql"/>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/tests">  
`         `<fileset dir="${tests.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/demos">  
`         `<fileset dir="${demos.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/apps">  
`         `<fileset dir="${apps.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy tofile="${dist.dir}/LICENSE" file="${bioj}/LICENSE"/>  
`     `<copy tofile="${dist.dir}/LICENSE.COMMONS" file="${bioj}/LICENSE.COMMONS"/>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/manifest">  
`         `<fileset dir="${manifest.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/dtd">  
`         `<fileset dir="${bioj}/dtd"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/taglets">  
`         `<fileset dir="${taglets.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy todir="${dist.dir}/resources">  
`         `<fileset dir="${resources.dir}"/>  
`     `</copy>  
`     `  
`     `  
`     `<copy file="${ant.file}" tofile="${dist.dir}/build.xml"/>  
`     `  
` `</target>  
` `

</project> </xml>
