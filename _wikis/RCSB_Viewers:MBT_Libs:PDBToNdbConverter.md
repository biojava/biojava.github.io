---
title: RCSB Viewers:MBT Libs:PDBToNdbConverter
---

Notes
-----

-   `     Probably the most confusing aspect of the loading/model creation mechanism.  See John Beaver's`  
    `     notes, below.`  
    `   `
-   `     Ids stored in the model are `<em>`Ndb`</em>` ids, not Pdb.  Pdb ids are looked up.`  
    `   `
-   `     One problem is the conversion methods are quite hard to use - they return a two-element array of`  
    `     objects which have to be tested for existence and cast.  I'm currently working on providing`  
    `     simplified versions.`  
    `   `

Explanation
-----------

*Ndb* ids primarily come from .cif/.xml files, Pdb ids from .pdb files.
The identification schemes are quite different.

Thus, the requirement to map from one to the other. The
PdbToNdbConverter performs this conversion.

-   On loading XML files, the chain and residue ids are extracted in
    both Ndb and Pdb namespaces.

<!-- -->

-   On loading PDB files, the Ndb ids are set to their corresponding Pdb
    ids, thus the mapping is essentially 1:1.

The loaders create the *PdbToNdbConverter* as the last step from the
lists of names extracted. It is handed off to the *StructureMap*, which
then uses it throughout the rest of the application.

Non-protein chains present their own issues -

` From John Beaver (edited):`

  
  
Pdb and Ndb deal with one of the major legacy problems of the PDB data.

<!-- -->

  
  
The old .pdb file format has been around for a very long time. It's
simple, and it's what most people who don't use the website use. It has
several technical limitations, but the data matches the original author
submission very closely.

<!-- -->

  
  
This is a problem. Very commonly, a small molecule or DNA strand will
have the same chain ID as a protein chain, for example. This can cause
problems when the viewer is deciding where to draw ribbons and bonds.

<!-- -->

  
  
The Ndb (whose name I took from one of the Xml tags in the PDB XML
format and which may or may not be proper terminology) is a separate
namespace for chain IDs and residue IDs. It is much more highly cleaned;
you'll almost never see a small molecule or DNA chain mixed with protein
in one chain. Also, PDB residue IDs can have letters in them; NDB
residue IDs are always integers.

<!-- -->

  
  
The Ndb namespace still has data cleanliness problems, but it seems much
better overall than the Pdb namespace.

For an example of what I mean, look at the following .xml snippet.Scroll
about halfway down the file, and you'll see something like...

<!-- -->

  
  
<code>

\<PDBx:atom\_site id="1249"\>
\<PDBx:group\_PDB\>ATOM\</PDBx:group\_PDB\>
\<PDBx:type\_symbol\>C\</PDBx:type\_symbol\>
\<PDBx:label\_atom\_id\>CG\</PDBx:label\_atom\_id\>
\<PDBx:label\_alt\_id xsi:nil="true" /\>
\<PDBx:label\_comp\_id\>ARG\</PDBx:label\_comp\_id\>
\<PDBx:label\_asym\_id\>A\</PDBx:label\_asym\_id\> (--\> NDB chain ID)
\<PDBx:label\_entity\_id\>1\</PDBx:label\_entity\_id\>
\<PDBx:label\_seq\_id\>165\</PDBx:label\_seq\_id\> (--\> NDB residue ID)
\<PDBx:Cartn\_x\>15.583\</PDBx:Cartn\_x\>
\<PDBx:Cartn\_y\>0.027\</PDBx:Cartn\_y\>
\<PDBx:Cartn\_z\>-10.746\</PDBx:Cartn\_z\>
\<PDBx:occupancy\>1.00\</PDBx:occupancy\>
\<PDBx:B\_iso\_or\_equiv\>26.76\</PDBx:B\_iso\_or\_equiv\>
\<PDBx:auth\_seq\_id\>165\</PDBx:auth\_seq\_id\> (--\> PDB residue ID)
\<PDBx:auth\_comp\_id\>ARG\</PDBx:auth\_comp\_id\>
\<PDBx:auth\_asym\_id\>E\</PDBx:auth\_asym\_id\> (--\> PDB chain ID)
\<PDBx:auth\_atom\_id\>CG\</PDBx:auth\_atom\_id\>
\<PDBx:pdbx\_PDB\_model\_num\>1\</PDBx:pdbx\_PDB\_model\_num\>
\</PDBx:atom\_site\> </code>

  
  
Here, label\_asym\_id is the NDB chain ID and auth\_asym\_id is the PDB
chain ID. Similarly, label\_seq\_id is the NDB residue ID and
auth\_seq\_id is the PDB residue ID.

<!-- -->

  
  
To make matters worse, Phil Bourne insisted that the community prefers
to see the PDB nomenclature. This is correct, since most of the
community uses the .pdb format. Whereas the NDB nomenclature is \*much\*
more amenable to use in the internal data structures, I had to make a
large dictionary to translate NDB to PDB


