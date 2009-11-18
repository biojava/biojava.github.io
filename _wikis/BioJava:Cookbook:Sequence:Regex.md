---
title: BioJava:Cookbook:Sequence:Regex
---

How can make a motif into a regular expression?
-----------------------------------------------

One of the interesting things you can do with BioJava's MotifTools is to
make a String into a regular expression Pattern. You can then use this
Pattern to search a SymbolList object for the existence of that Pattern.
The generated Pattern can even be from an ambiguous sequence such as
"acgytnwacrs". To accomplish this task, BioJava contains a wrapper to
Java's built-in regular expression functionality.

A simple program is implemented below:

<java> // Biojava imports import org.biojava.bio.\*;

public class AmbiguitySearch {

`   public static void main(String[] args) {`  
`      try {`  
`       // Variables needed...`  
`       Matcher occurences;`  
`       FiniteAlphabet IUPAC = DNATools.getDNA();`  
`       SymbolList WorkingSequence = DNATools.createDNA("tagagatagacgatagc");`  
`       `  
`       // Create pattern using pattern factory.`  
`       Pattern pattern;`  
`       PatternFactory FACTORY = PatternFactory.makeFactory(IUPAC);`  
`       try{`  
`           pattern = FACTORY.compile("wtagn");`  
`       } catch(Exception e) {e.printStackTrace(); return;}`  
`           System.out.println("Searching for: "+pattern.patternAsString());`  
`       `  
`       // Obtain iterator of matches.`  
`       try {`  
`           occurences = pattern.matcher( WorkingSequence );`  
`       } catch(Exception e) {e.printStackTrace(); return;}`

`       // Foreach match`  
`       while( occurences.find() ) {`  
`           System.out.println("Match: " +"\t"+ WorkingSequence `  
`                       +"\n"+ occurences.start() +"\t"+ occurences.group().seqString());`  
`       }`  
`       }`  
`       `  
`       catch (Exception ex) {`  
`           ex.printStackTrace();`  
`           System.exit(1);`  
`       }`  
`   }`

} </java>

Alternatively, the following example from Andy Hammer demonstrates how
the java regular expression functionality can be used directly to search
a String object for pattern matches.

<java> /\*\*

`* MotifLister.java`  
`* Modified slightly from the original by Andy Hammer`  
`*`  
`* Lists all instances of a motif in specified (dna\rna\protein) fasta file.`  
`* The motif can contain Ambiguity symbols`  
`* Lists the ORF title and position of motif`  
`* Outputs a list of counts to stdout.`  
`*/`

import java.io.\*; import java.util.\*;

import org.biojava.\* public class MotifLister{

` private SymbolList motif;`  
` private int frame;`  
` private int count;`  
` private SequenceIterator si;`

` public MotifLister(String type, String inputFile,`  
`                    String target, String placement)throws Exception{`

`   System.out.println("MotifLister is searching file " + inputFile +`  
`                      " for the motif '" + target +`  
`                       "' in frame " + placement + ".");`

`   try{`  
`     if(type.equalsIgnoreCase("dna")){`  
`       motif = DNATools.createDNA(target);`  
`     }else if(type.equalsIgnoreCase("rna")){`  
`       motif = RNATools.createRNA(target);`  
`     }else{`  
`       motif = ProteinTools.createProtein(target);`  
`     }`  
`   }`  
`   catch(BioError e){`  
`     System.out.println("Error!!  Data type must match type of motif.");`  
`     System.out.println("Specifically, " + target + " is not " + type);`  
`     System.exit(0);`  
`   }`

`   frame = Integer.parseInt(placement);`

`   if (frame < 0 || frame > 3) {`  
`     System.out.println("Only frames 0 through 3 are allowed");`  
`     System.out.println("frame zero searches all frames.");`  
`     System.exit(0);`  
`   }`

`   //make a regex expression for the SymbolList using MotifTools`  
`   Pattern p = Pattern.compile( MotifTools.createRegex(motif) );`

`   count = 0;`

`   //read the input`  
`   FileInputStream fis = new FileInputStream(inputFile);`  
`   InputStreamReader isr = new InputStreamReader(fis);`  
`   BufferedReader input = new BufferedReader(isr);`

`   try{`  
`     si = (SequenceIterator)SeqIOTools.fileToBiojava("fasta", type, input);`

`     //for each sequence`  
`     while (si.hasNext()){`  
`       Sequence seq = si.nextSequence();`

`       //get the regex matcher for the pattern`  
`       Matcher matcher = p.matcher(seq.seqString());`

`       int start = 0;`

`       //find the next match from start`  
`       while(matcher.find(start)) {`  
`         start = matcher.start();`  
`         int end = matcher.end();`  
`         int result = (start % 3) + 1;`  
`         if(result == frame || frame == 0){`

`           //print the match location`  
`           System.out.println(seq.getName() + " : " +`  
`                              "[" + (start + 1) + "," + (end) + "]");`  
`           count++;`  
`         }`  
`         start++;`  
`       }`  
`     }`

`     input.close(); //close the file`  
`     System.out.println("Total Hits = " + count);`  
`   }`  
`   catch(BioException e){`  
`     System.out.println(inputFile + " is not a " + type + " file.");`  
`     System.out.println(e);`  
`   }`  
` }`

` public static void main(String[] args)throws Exception{`  
`   if (args.length < 4) {`  
`     System.err.println(" Usage: >java -jar MotifLister.jar type fastaFile motif frame" +`  
`                        "\n Ex: >java -jar MotifLister.jar dna eColi.fasta AAAAAAG 3 > output.txt" +`  
`                        "\n would search for A AAA AAG in the third frame in dna file eColi.fasta" +`  
`                        "\n and print the results to file output.txt." +`  
`                        "\n 'type' can be dna, rna, or protein." +`  
`                        "\n 'frame' can be integers 0 through 3." +`  
`                        "\n 0 counts any instance of the motif." +`  
`                        "\n 1, 2, 3 counts only instances of the motif in the specified frame." +`  
`                        "\n Capture output with redirection operator '>'.");`  
`   }else{`  
`     MotifLister ML = new MotifLister(args[0], args[1], args[2], args[3]);`  
`   }`  
` }`

} </java>
