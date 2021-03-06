---
title: BioJava:CookBookItaliano:SeqIO:GBtoFasta
permalink: wiki/BioJava%3ACookBookItaliano%3ASeqIO%3AGBtoFasta
---

Come posso leggere una sequenza GenBank/EMBL/Swissprot e convertirla nel formato FASTA?
---------------------------------------------------------------------------------------

Per effettuare questa conversione estendiamo l'esempio precedente
(clicca [qui](/wiki/BioJava:CookBookItaliano:SeqIO:ReadGES "wikilink"))
aggiungendo la funzionalità di scrivere la sequenza in formato FASTA. Di
seguito è mostrato un esempio:

```java import java.io.BufferedReader; import java.io.File; import
java.io.FileOutputStream; import java.io.FileReader;

import org.biojavax.Namespace; import org.biojavax.RichObjectFactory;
import org.biojavax.bio.seq.RichSequence; import
org.biojavax.bio.seq.RichSequenceIterator;

public class ReadWriteGES\_BJ1\_6{

`   public static void main(String[] args) {`  
`       BufferedReader br = null;`  
`       Namespace ns = null;`  
`               //questo è il path utilizzato anche per il file in formato fasta`  
`       String filePath= "/whereYourFileIs/sequences";`  
`       String insdExt=".gbc";`  
`       String fastaExt=".FASTA";`  
`       `  
  
`       try{`  
`           br = new BufferedReader(new FileReader(filePath+insdExt));`  
`           ns = RichObjectFactory.getDefaultNamespace();`  
  
  
`                       // Si può utilizzare uno qualsiasi dei metodi presenti nelle BioJava 1.6 API        `  
`                       RichSequenceIterator rsi = RichSequence.IOTools.readINSDseqDNA(br, ns);`  
  
`                       //Se un file contiene più sequenze è possibile utilizzare un iteratore per leggerle tutte`  
`                       while (rsi.hasNext()) {`  
`                           RichSequence seq = rsi.nextRichSequence();`  
`                           RichSequence.IOTools.writeFasta(new `  
`                                        FileOutputStream(new File(filePath+fastaExt)), seq, ns);`  
`                           System.out.println(`  
`                                   seq.toString() +`  
`                                   " has " + seq.countFeatures() + `  
`                                   " features");`  
`                       }`

`       }`  
`       catch(Exception be){`  
`           be.printStackTrace();`  
`           System.exit(-1);`  
`       }`  
`   }`

} ```
