---
title: BioJava:CookBook:PDB:restful
---

### How to get RESTful data from RCSB

Biojava includes a package
[org.biojava.bio.structure.rcsb](http://www.biojava.org/docs/api/org/biojava/bio/structure/rcsb/package-summary.html)
that can be used to get information from [RCSB's RESTful
service](http://www.pdb.org/pdb/software/rest.do). As of 3.0.6, the
package is only for "describeMol" descriptions of PDB entries: see
[1](http://www.pdb.org/pdb/rest/describeMol?structureId=4hhb) for an
example. These description files typically contain accession numbers,
molecular weights, EC numbers, and other information.

The most important class is
[RCSBDescriptionFactory](http://www.biojava.org/docs/api/org/biojava/bio/structure/rcsb/RCSBDescriptionFactory.html).
To use it: <java> RCSBDescription description =
RCSBDescriptionFactory.get("1w0p"); </java> This will automatically
download and parse the describeMol file.

If you need an alternate stream (for example you don't want to download
the files each time), RCSBDescriptionFactory has another factory method:
<java> RCSBDescriptionFactory.get(InputStream stream); // stream is an
opened InputStream to the describeMol file </java>

The RCSBDescription contains the PDB Id and a list of
[RCSBPolymers](http://www.biojava.org/docs/api/org/biojava/bio/structure/rcsb/RCSBPolymer.html).
We can use RCSBPolymer to obtain the molecular weight, EC number,
taxonomy, and accession numbers of the first polymer as follows: <java>
RCSBDescription description = RCSBDescriptionFactory.get("1w0p");
RCSBPolymer polymer = description.getPolymers().get(0);
System.out.println(polymer.getWeight()); // \*
System.out.println(polymer.getEnzClass()); RCSBMacromolecule molecule =
polymer.getMolecule(); RCSBTaxonomy taxonomy = polymer.getTaxonomy();
System.out.println(taxonomy.getId() + "\\t" + taxonomy.getName()); for
(String accession : molecule.getAccessions()) {

`   System.out.println(accession);`

} </java>

RCSBPolymer and
[RCSBMacromolecule](http://www.biojava.org/docs/api/org/biojava/bio/structure/rcsb/RCSBMacromolecule)
also contain other information from the describeMol file; see the
Javadoc for a complete list.

Many of the numeric values in the describeMol file can be null. It is
therefore crucial to check for null values when using these fields. For
example, the molecular weight in the marked line above can be null, so
the following code might throw a NullPointerException: <java> int weight
= polymer.getWeight(); </java> Instead, the following is preferred:
<java> Integer weight = polymer.getWeight(); if (weight == null) {

`   // do something`

} else {

`   // do something else`

} </java>
