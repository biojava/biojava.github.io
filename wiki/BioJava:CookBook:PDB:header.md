---
title: BioJava:CookBook:PDB:header
---

### How can I access the header information of a PDB file?

new: BioJava in CVS now can parse the COMPND and SOURCE header files.
The contained information is availabe via the Compounds class that can
be accessed from structure.getCompounds().

<java>

public static void main(String[] args){

`       String code =  "1aoi";`

`       PDBFileReader pdbreader = new PDBFileReader();`  
`       pdbreader.setPath("/Path/To/PDBFiles/");`  
`       pdbreader.setParseSecStruc(true);`  
`       pdbreader.setAlignSeqRes(true);`  
`       pdbreader.setAutoFetch(true);`

`       try{`  
`           Structure struc = pdbreader.getStructureById(code);`  
`           Map`<String,Object>` m = struc.getHeader();`

`           Set`<String>` keys = m.keySet();`  
`           for (String key: keys) {`  
`               System.out.println(key +": " +  m.get(key));`  
`           }`

`           System.out.println(struc);`

`       } catch (Exception e) {`  
`           e.printStackTrace();`  
`       }`  
`   }`  
`   `

</java>

gives the following output:

    title: COMPLEX BETWEEN NUCLEOSOME CORE PARTICLE (H3,H4,H2A,H2B) AND 146 BP LONG DNA FRAGMENT 
    technique: X-RAY DIFFRACTION 
    classification: DNA BINDING PROTEIN/DNA
    depDate: 03-JUL-97
    modDate: 01-APR-03
    idCode: 1AOI
    resolution: 2.8
    structure  1AOI{title=COMPLEX BETWEEN NUCLEOSOME CORE PARTICLE (H3,H4,H2A,H2B) AND 146 BP LONG DNA FRAGMENT , technique=X-RAY DIFFRACTION , classification=DNA BINDING PROTEIN/DNA, depDate=03-JUL-97, modDate=01-APR-03, idCode=1AOI, resolution=2.8} chains:
    chain: >A< length SEQRES: 116 length ATOM: 98 aminos: 98 hetatms: 0 nucleotides: 0
    chain: >B< length SEQRES: 87 length ATOM: 83 aminos: 83 hetatms: 0 nucleotides: 0
    chain: >C< length SEQRES: 116 length ATOM: 115 aminos: 115 hetatms: 0 nucleotides: 0
    chain: >D< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0
    chain: >E< length SEQRES: 116 length ATOM: 116 aminos: 116 hetatms: 0 nucleotides: 0
    chain: >F< length SEQRES: 87 length ATOM: 87 aminos: 87 hetatms: 0 nucleotides: 0
    chain: >G< length SEQRES: 116 length ATOM: 108 aminos: 108 hetatms: 0 nucleotides: 0
    chain: >H< length SEQRES: 99 length ATOM: 99 aminos: 99 hetatms: 0 nucleotides: 0
    chain: >I< length SEQRES: 0 length ATOM: 146 aminos: 0 hetatms: 0 nucleotides: 146
    chain: >J< length SEQRES: 0 length ATOM: 146 aminos: 0 hetatms: 0 nucleotides: 146
    chain: > < length SEQRES: 0 length ATOM: 19 aminos: 0 hetatms: 19 nucleotides: 0
    Molecules: 
    Compound: 1 HISTONE H3 Chains: ChainId: A E Engineered: YES OrganismScientific: XENOPUS LAEVIS OrganismCommon: AFRICAN CLAWED FROG ExpressionSystem: ESCHERICHIA COLI Fragment: HISTONE H3 
    Compound: 2 HISTONE H4 Chains: ChainId: B F Engineered: YES OrganismScientific: XENOPUS LAEVIS OrganismCommon: AFRICAN CLAWED FROG ExpressionSystem: ESCHERICHIA COLI ExpressionSystemOtherDetails: SYNTHETIC GENE, OPTIMIZED CODON USAGE FOR Fragment: HISTONE H4 
    Compound: 3 HISTONE H2A Chains: ChainId: C G Engineered: YES OrganismScientific: XENOPUS LAEVIS OrganismCommon: AFRICAN CLAWED FROG ExpressionSystem: ESCHERICHIA COLI Fragment: HISTONE H2A 
    Compound: 4 HISTONE H2B Chains: ChainId: D H Engineered: YES Mutation: YES OrganismScientific: XENOPUS LAEVIS OrganismCommon: AFRICAN CLAWED FROG ExpressionSystem: ESCHERICHIA COLI Fragment: HISTONE H2B 
    Compound: 5 PALINDROMIC 146 BP DNA REPEAT 8/9 FROM HUMAN X- CHROMOSOME ALPHA SATELLITE DNA Chains: ChainId: I J Engineered: YES Synthetic: YES 

Next: <BioJava:CookBook:PDB:align> - How to align two protein structures
