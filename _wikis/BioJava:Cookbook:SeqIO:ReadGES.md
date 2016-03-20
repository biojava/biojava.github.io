---
title: BioJava:Cookbook:SeqIO:ReadGES
---

How Do I read a GenBank, SwissProt or EMBL file?
------------------------------------------------

The SeqIOTools class contains methods for reading GenBank, SwissProt and
EMBL files. Because any of these files can contain more than one
sequence entry SeqIOTools will return a SequenceIterator which can be
used to iterate through the individual sequences. One of the attractive
features of this model is that the Sequences are only parsed and created
as needed so very large collections of sequences can be handled with
moderate resources.

Information in the file is stored in the Sequence as Annotations or
where there is location information as Features.

Three specific solutions are presented (which are all very similar)
followed by a generic solution (for biojava1.3 pre1). A fourth solution
revises the generic solution for the biojava1.3 API which is a bit
friendlier.

### Reading GenBank

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.seq.io.\*;
import java.io.\*; import org.biojava.bio.\*; import java.util.\*;

public class ReadGB {

` public static void main(String[] args) {`  
`   BufferedReader br = null;`

`   try {`

`     //create a buffered reader to read the sequence file specified by args[0]`  
`     br = new BufferedReader(new FileReader(args[0]));`

`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find the file specified by args[0]`  
`     ex.printStackTrace();`  
`     System.exit(-1);`  
`   }`

`   //read the GenBank File`  
`   SequenceIterator sequences = SeqIOTools.readGenbank(br);`

`   //iterate through the sequences`  
`   while(sequences.hasNext()){`  
`     try {`

`       Sequence seq = sequences.nextSequence();`  
`       //do stuff with the sequence`

`     }`  
`     catch (BioException ex) {`  
`       //not in GenBank format`  
`       ex.printStackTrace();`  
`     }catch (NoSuchElementException ex) {`  
`       //request for more sequence when there isn't any`  
`       ex.printStackTrace();`  
`     }`  
`   }`  
` }`

} </java>

### Reading SwissProt

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.seq.io.\*;
import java.io.\*; import org.biojava.bio.\*; import java.util.\*;

public class ReadSwiss {

` public static void main(String[] args) {`  
`   BufferedReader br = null;`

`   try {`

`     //create a buffered reader to read the sequence file specified by args[0]`  
`     br = new BufferedReader(new FileReader(args[0]));`

`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find the file specified by args[0]`  
`     ex.printStackTrace();`  
`     System.exit(-1);`  
`   }`

`   //read the SwissProt File`  
`   SequenceIterator sequences = SeqIOTools.readSwissprot(br);`

`   //iterate through the sequences`  
`   while(sequences.hasNext()){`  
`     try {`

`       Sequence seq = sequences.nextSequence();`  
`       //do stuff with the sequence`

`     }`  
`     catch (BioException ex) {`  
`       //not in SwissProt format`  
`       ex.printStackTrace();`  
`     }catch (NoSuchElementException ex) {`  
`       //request for more sequence when there isn't any`  
`       ex.printStackTrace();`  
`     }`  
`   }`  
` }`

} </java>

### Reading EMBL

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.seq.io.\*;
import java.io.\*; import org.biojava.bio.\*; import java.util.\*;

public class ReadEMBL {

` public static void main(String[] args) {`  
`   BufferedReader br = null;`

`   try {`

`     //create a buffered reader to read the sequence file specified by args[0]`  
`     br = new BufferedReader(new FileReader(args[0]));`

`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find the file specified by args[0]`  
`     ex.printStackTrace();`  
`     System.exit(-1);`  
`   }`

`   //read the EMBL File`  
`   SequenceIterator sequences = SeqIOTools.readEmbl(br);`

`   //iterate through the sequences`  
`   while(sequences.hasNext()){`  
`     try {`

`       Sequence seq = sequences.nextSequence();`  
`       //do stuff with the sequence`

`     }`  
`     catch (BioException ex) {`  
`       //not in EMBL format`  
`       ex.printStackTrace();`  
`     }catch (NoSuchElementException ex) {`  
`       //request for more sequence when there isn't any`  
`       ex.printStackTrace();`  
`     }`  
`   }`  
` }`

} </java>

### GeneralReader (biojava 1.3 pre 1)

<java> import org.biojava.bio.seq.io.\*; import org.biojava.bio.seq.\*;
import java.io.\*;

public class GeneralReader {

` /**`  
`  * This program will read any file supported by SeqIOTools it takes two`  
`  * arguments, the first is the file name the second is the int constant`  
`  * for the file type in SeqIOTools. See SeqIOTools for possible file types.`  
`  * The constants used are:`  
`  * UNKNOWN = 0;`  
`  * FASTADNA = 1;`  
`  * FASTAPROTEIN = 2;`  
`  * EMBL = 3;`  
`  * GENBANK = 4;`  
`  * SWISSPROT = 5;`  
`  * GENPEPT = 6;`  
`  * MSFDNA = 7;`  
`  * FASTAALIGNDNA = 9;`  
`  * MSFPROTEIN = 10;`  
`  * FASTAALIGNPROTEIN = 11;`  
`  * MSF = 12;               //only appropriate for reading`  
`  *`  
`  */`  
` public static void main(String[] args) {`  
`   try {`  
`     //prepare a BufferedReader for file io`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`     //get the int constant for the file type`  
`     int fileType = Integer.parseInt(args[1]);`

`     /*`  
`      * get a Sequence Iterator over all the sequences in the file.`  
`      * SeqIOTools.fileToBiojava() returns an Object. If the file read`  
`      * is an alignment format like MSF and Alignment object is returned`  
`      * otherwise a SequenceIterator is returned.`  
`      */`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(fileType, br);`  
`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find file specified by args[0]`  
`     ex.printStackTrace();`  
`   }catch (NumberFormatException ex) {`  
`     //args[1] is not an integer`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>

### GeneralReader (biojava 1.3)

<java> import java.io.\*;

import org.biojava.bio.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*;

public class GeneralReader {

` /**`  
`  * This program will read any file supported by SeqIOTools it takes three`  
`  * arguments, the first is the file name the second is the format type the`  
`  * third is the type of residue being read. Illegal combinations such as`  
`  * SwissProt and DNA will cause an exception.`  
`  *`  
`  * Allowed formats are: (case insensitive).`  
`  *`  
`  * FASTA`  
`  * EMBL`  
`  * GENBANK`  
`  * SWISSPROT (or swiss)`  
`  * GENPEPT`  
`  *`  
`  * Allowed sequence types are: (case insensititve).`  
`  *`  
`  * DNA`  
`  * AA (or Protein)`  
`  * RNA`  
`  *`  
`  */`  
` public static void main(String[] args) {`  
`   try {`  
`     //prepare a BufferedReader for file io`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`     //the flat file format`  
`     String format = args[1];`

`     //the Alphabet`  
`     String alpha = args[2];`

`     //get the int value for the format and alphabet`

`     /*`  
`      * get a Sequence Iterator over all the sequences in the file.`  
`      * SeqIOTools.fileToBiojava() returns an Object. If the file read`  
`      * is an alignment format like MSF and Alignment object is returned`  
`      * otherwise a SequenceIterator is returned.`  
`      */`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(format, alpha, br);`

`     // do something with the sequences`  
`     SeqIOTools.writeFasta(System.out, iter);`  
`   }`  
`   catch (FileNotFoundException ex) {`  
`     //can't find file specified by args[0]`  
`     ex.printStackTrace();`  
`   }catch (BioException ex) {`  
`     //invalid file format name`  
`     ex.printStackTrace();`  
`   }catch (IOException ex){`  
`     //error writing to fasta`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
