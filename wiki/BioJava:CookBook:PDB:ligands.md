---
title: BioJava:CookBook:PDB:ligands
---

{code:Java}

`        Structure struct = structure;`  
`        List`<Group>` hets = struct.getHetGroups();`  
`           for (Group group : hets) {`  
`               System.out.println(group);`  
`               List`<Group>` fourAngstromShell = StructureTools.getGroupsWithinShell(struct, group, 4.00, false);`  
`               System.out.println("Groups within 4 Angstroms of " + group + ":");`  
`               for (Group fourAngstromgroup : fourAngstromShell) {`  
`                   System.out.println(fourAngstromgroup);`  
`                       `  
`               }`  
`               for (Bond bond : StructureTools.findBonds(group, fourAngstromShell)) {`  
`                       System.out.println(bond);`  
`               }`  
`           }`

{code}
