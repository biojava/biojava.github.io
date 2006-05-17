---
title: BioJava:Tutorial:MultiAlignClustalW
---

**by [Dickson S. Guedes](Dickson Guedes "wikilink")**

Because there are many question in list about Multi-Alignment using
BioJava. BioJava DON'T make multi-alignments by itself, so I'll place a
code that I created in my teses.

Ok. Let's Go...

First, this is how you call methods from ClustalWAlign's class.

**MultAlignTest.java**

<java> /\*\*

`* MultAlignTest.java`  
`* `  
`* @author Dickson S. Guedes (guedes@unisul.br)`  
`* @version 1.0 `  
`* @serialData 20060120 `  
`* `  
`* Copyright (c) 2006.`  
`* `  
`*/`

import org.biojava.bio.seq.DNATools; import
org.biojava.bio.seq.Sequence; import
org.biojava.bio.seq.SequenceIterator;

public class MultAlignTest {

`   public static void main(String[] args) {`  
`       try {`  
`           // First create an instance for ClustalWAlign`  
`           ClustalWAlign alSequences = new ClustalWAlign("FakeSequencesFile");`  
`           `  
`           // Now only add Sequences to alSequences`  
`           alSequences.addSequence(DNATools.createDNASequence("atttagatgatatatcggccactagcatcgactacgactgacatcgt","Sequence1"));`  
`           alSequences.addSequence(DNATools.createDNASequence("atagatgatggccatcgatcgagacgggatgactgacgtacgt","Sequence2"));`  
`           alSequences.addSequence(DNATools.createDNASequence("atagatgatggccatcgatcgaagacggatgactgacgtacgt","Sequence3"));`  
`           alSequences.addSequence(DNATools.createDNASequence("atagatgatggccatggatgactgacgtacgt","Sequence4"));`  
`           alSequences.addSequence(DNATools.createDNASequence("atagatgatggccatccgatgaggacgtacgt","Sequence5"));`

`           // Here you are calling the core of class - The Multi-Alignment!`  
`           alSequences.doMultAlign();`

`           // Now, you want to see results. Well...`  
`           SequenceIterator it = alSequences.getIterator();`  
`           `  
`           while (it.hasNext()) {`  
`               Sequence seq = it.nextSequence();`  
`               System.out.println(seq.getName() + ": " + seq.seqString());`  
`           }`  
`           `  
`           System.out.print("GUIDE TREE:" + alSequences.getGuideTree());`  
`           `  
`       } catch (Throwable t) {`  
`           t.printStackTrace();`  
`       }`  
`   }`

} </java>

Now, I you

**ClustalWAlign.java** <java> /\*\*

`* ClustalWAlign.java`  
`* `  
`* @author Dickson S. Guedes (guedes@unisul.br)`  
`* @version 1.0 `  
`* @serialData 20060120 `  
`* `  
`* Copyright (c) 2006.`  
`* `  
`*/`

import java.io.BufferedInputStream; import java.io.BufferedReader;
import java.io.FileInputStream; import java.io.FileOutputStream; import
java.io.FileReader; import java.io.IOException; import
java.io.InputStream; import java.io.InputStreamReader;

import org.biojava.bio.BioException; import
org.biojava.bio.seq.Sequence; import
org.biojava.bio.seq.SequenceIterator; import
org.biojava.bio.seq.db.HashSequenceDB; import
org.biojava.bio.seq.db.SequenceDB; import
org.biojava.bio.seq.io.SeqIOTools; import
org.biojava.bio.symbol.AlphabetManager; import
org.biojava.utils.ChangeVetoException;

public class ClustalWAlign {

`   // This are Constants, but I'll change...`  
`   private static final String fileFormat = "fasta";`  
`   private static final String clustalwPath = "C:\\JAVA\\Workspace\\clustalw\\";`  
`   `  
`   private SequenceDB      dbSequences;`  
`   private String          strAlfa;`  
`   private String          fileName;`  
`   private String          guideTree;`  
`   `

`   public ClustalWAlign () {`  
`       `  
`       this.dbSequences = new HashSequenceDB();`  
`       this.strAlfa = "DNA";`  
`       `  
`   }`  
`   `  
`   public ClustalWAlign (String fileName) {`  
`       `  
`       this.dbSequences = new HashSequenceDB();`  
`       this.strAlfa = "DNA";`  
`       this.fileName = fileName;`  
`       `  
`   }`  
`   `  
`   `  
`   public ClustalWAlign (SequenceIterator itSequences, String strAlfa) throws BioException, ChangeVetoException {`  
`       `  
`       this.dbSequences = new HashSequenceDB();`  
`       `  
`       this.strAlfa = strAlfa;`  
`       `  
`       while (itSequences.hasNext()) {`  
`           this.dbSequences.addSequence(itSequences.nextSequence());`  
`       }`  
`       `  
`   }`  
`   `  
`   public ClustalWAlign (BufferedReader bufSequences, String strAlfa) throws BioException, ChangeVetoException {`  
`       `  
`       this.dbSequences = new HashSequenceDB();`  
`       this.strAlfa = strAlfa;`  
`       `  
`       SequenceIterator itSequences = (SequenceIterator)SeqIOTools.fileToBiojava(fileFormat,strAlfa,bufSequences); `  
`       `  
`       while (itSequences.hasNext()) {`  
`           this.dbSequences.addSequence(itSequences.nextSequence());`  
`       }       `  
`   }`  
`   `  
`   public void addSequence(Sequence seqSequence) throws BioException, ChangeVetoException {`  
`       this.dbSequences.addSequence(seqSequence);`  
`   }`  
`   `  
`   public void removeSequence(String idSequence) throws BioException, ChangeVetoException {`  
`       this.dbSequences.removeSequence(idSequence);`  
`   }`  
`   `  
`   public int doMultAlign() {  `  
`       int exitVal=999;`  
`       `  
`       try {`  
`           `  
`           FileOutputStream newFile = new FileOutputStream(clustalwPath + fileName + ".input");`  
`           `  
`           SeqIOTools.writeFasta(newFile,this.dbSequences);`  
`           `  
`           Runtime rt = Runtime.getRuntime();`  
`           `  
`           String [] strComando =  `  
`                               {clustalwPath+"ClustalW.EXE",`  
`                               "/infile="  + clustalwPath + fileName + ".input",`  
`                               "/outfile=" + clustalwPath + fileName + ".output",`  
`                               "/output=" + fileFormat,`  
`                               "/align"};`  
`           `  
`           Process proc = rt.exec(strComando);`  
`           `  
`           InputStream stdin = proc.getInputStream();`  
`           BufferedReader br = new BufferedReader(new InputStreamReader(stdin));`  
`           `  
`           while ( (br.readLine()) != null) {`  
`               // do nothing only read "stdout" from ClustalW`  
`           }`  
`           `  
`           exitVal = proc.waitFor();`  
`           if (exitVal == 0) {`  
`               this.dbSequences = SeqIOTools.readFasta(`  
`                       new BufferedInputStream(`  
`                               new FileInputStream(`  
`                                       clustalwPath + `  
`                                       fileName + `  
`                               ".output")),`  
`                               AlphabetManager.alphabetForName(strAlfa)`  
`               );`  
`               `  
`               this.guideTree = fileToString(`  
`                                       clustalwPath + `  
`                                       fileName + `  
`                                       ".dnd"`  
`                                       );`  
`           }`  
`       `  
`       } catch (Throwable t) {`  
`           t.printStackTrace();`  
`       }`  
`       return (exitVal);`  
`   }`  
`       `  
`   public void setAlphabet(String strAlfa) {`  
`       this.strAlfa = strAlfa;`  
`   }`  
`   `  
`   public SequenceDB getDBSequences() {`  
`       return this.dbSequences;`  
`   }`  
`   `  
`   public SequenceIterator getIterator() {`  
`       return this.dbSequences.sequenceIterator();`  
`   }`  
`   `  
`   public String getGuideTree() {`  
`       return guideTree;`  
`   }`

`   public void setGuideTree(String guideTree) {`  
`       this.guideTree = guideTree;`  
`   }   `  
`   `  
`   private String fileToString(String fileName) {`  
`       `  
`       String fileBody = "";`  
`       boolean endOfFile = false;`  
`       `  
`       try {`  
`           `  
`           FileReader fileClustalW = new FileReader(fileName);`  
`           BufferedReader fileBuffer = new BufferedReader(fileClustalW);`  
`           `  
`           while (!endOfFile) {`  
`               String fileLine = fileBuffer.readLine();`  
`               `  
`               if (fileLine == null) {`  
`                   endOfFile = true;`  
`               } else {`  
`                   fileBody = fileBody.concat(fileLine);`  
`               }`  
`           }`  
`           fileBuffer.close();`  
`           `  
`       } catch (IOException e) {`  
`           e.printStackTrace();`  
`       }`

`       return fileBody;`  
`   }`

} </java>
