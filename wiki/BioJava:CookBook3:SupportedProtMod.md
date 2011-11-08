---
title: BioJava:CookBook3:SupportedProtMod
---

How can I get the list of supported protein modifications?
----------------------------------------------------------

The protmod module contains [an XML
file](http://code.open-bio.org/svnweb/index.cgi/biojava/browse/biojava-live/trunk/biojava3-modfinder/src/main/resources/org/biojava3/protmod),
defining a list of protein modifications, retrieved from [Protein Data
Bank Chemical Component Dictrionary](http://www.wwpdb.org/ccd.html),
[RESID](http://www.ebi.ac.uk/RESID/), and
[PSI-MOD](http://psidev.sourceforge.net/mod/). It contains many common
modifications such glycosylation, phosphorylation, acelytation,
methylation, etc. Crosslinks are also included, such disulfide bonds and
iso-peptide bonds.

The protmod maintains a registry of supported protein modifications. The
list of protein modifications contained in the XML file will be
automatically loaded. You can [ define and register a new protein
modification](BioJava:CookBook3:AddProtMod "wikilink") if it has not
been defined in the XML file. From the protein modification registry, a
user can retrieve

-   all protein modifications,
-   a protein modification by ID,
-   a set of protein modifications by RESID ID,
-   a set of protein modifications by PSI-MOD ID,
-   a set of protein modifications by PDBCC ID,
-   a set of protein modifications by category (attachment, modified
    residue, crosslink1, crosslink2, ..., crosslink7),
-   a set of protein modifications by occurrence type (natural or
    hypothetical),
-   a set of protein modifications by a keyword (glycoprotein,
    phosphoprotein, sulfoprotein, ...),
-   a set of protein modifications by involved components.

Example: retrieve registered protein modifications
--------------------------------------------------

<java> // a protein modification by ID ProteinModification mod =
ProteinModificationRegistry.getById("0001");

Set<ProteinModification> mods;

// all protein modifications mods =
ProteinModificationRegistry.allModifications();

// a set of protein modifications by RESID ID mods =
ProteinModificationRegistry.getByResidId("AA0151");

// a set of protein modifications by PSI-MOD ID mods =
ProteinModificationRegistry.getByPsimodId("MOD:00305");

// a set of protein modifications by PDBCC ID mods =
ProteinModificationRegistry.getByPdbccId("SEP");

// a set of protein modifications by category mods =
ProteinModificationRegistry.getByCategory(ModificationCategory.ATTACHMENT);

// a set of protein modifications by occurrence type mods =
ProteinModificationRegistry.getByOccurrenceType(ModificationOccurrenceType.NATURAL);

// a set of protein modifications by a keyword mods =
ProteinModificationRegistry.getByKeyword("phosphoprotein");

// a set of protein modifications by involved components. mods =
ProteinModificationRegistry.getByComponent(Component.of("FAD"));

</java>

See also
--------

<div style="-moz-column-count:3; column-count:3;">
-   [How can I identify protein modifications in a
    structure](BioJava:CookBook3:ProtMod "wikilink")
-   [How can I define a new protein
    modification?](BioJava:CookBook3:AddProtMod "wikilink")

</div>

