---
title: BioJava:CookBookItaliano:Sequence:Regex
---

Come posso trasformare un motivo di interesse biologico in una espressione regolare?
------------------------------------------------------------------------------------

Fra le più interessanti funzioni di BioJava ci sono quelle che si
possono eseguire con MotifTools, come ad esempio trasformare una String
([motivo](Biojava:CookBookItaliano:Sequence:Regex:Motivo "wikilink")) in
un Pattern come espressione regolare. E' possibile ricercare poi questo
Pattern all'interno di una SymbolList. Il Pattern generato può provenire
a partire da una sequenza ambigua come ad esempio "acgytnwacrs". Per
poter compiere questa operazione, in BioJava è presente un wrapper verso
le funzionalità relative alle espressioni regolari built-in di Java.

Un semplice programma d'esempio è mostrato di seguito:

<java> // Biojava imports import org.biojava.\*;

public class AmbiguitySearch {

`   public static void main(String[] args) {`  
`      try {`  
`       //Inizializziamo le variabili`  
`       Matcher occurences;`  
`       FiniteAlphabet IUPAC = DNATools.getDNA();`  
`       SymbolList WorkingSequence = DNATools.createDNA("tagagatagacgatagc");`  
`       `  
`               // Creo un pattern utilizzando un pattern factory.`  
`       Pattern pattern;`  
`       PatternFactory FACTORY = PatternFactory.makeFactory(IUPAC);`  
`       try{`  
`           pattern = FACTORY.compile("wtagn");`  
`       } catch(Exception e) {`  
`                   e.printStackTrace(); `  
`                   return;`  
`               }`  
`       System.out.println("Effettuo la ricerca per: "+pattern.patternAsString());`  
`       `  
`       // Ottengo un iteratore per i match ottenuti`  
`       try {`  
`           occurences = pattern.matcher( WorkingSequence );`  
`       } catch(Exception e) {`  
`                       e.printStackTrace(); `  
`                       return;`  
`               }`

`       // Per ognuno di questi stampo il valore`  
`       while( occurences.find() ) {`  
`           System.out.println("Match: " +"\t"+ WorkingSequence `  
`                       +"\n"+ occurences.start() +"\t"+ occurences.group().seqString());`  
`           }`  
`       }`  
`       `  
`       catch (Exception ex) {`  
`           ex.printStackTrace();`  
`               System.exit(1);`  
`       }`  
`   }`

} </java>

Alternativamente, il seguente esempio proposto da Andy Hammer dimostra
come le funzionalità delle java regular expression possono essere
utilizzate direttamente per ricercare un oggetto Stringa per il pattern
matching.

<java> /\*\*

`* MotifLister.java`  
`* Modified slightly from the original by Andy Hammer`  
`*`  
`* Lists all instances of a motif in specified (dna\rna\protein) fasta file.`  
`* The motif can contain Ambiguity symbols`  
`* Lists the ORF title and position of motif`  
`* Outputs a list of counts to stdout.`  
`*/`

import java.io.\*; import java.util.\*; import org.biojava.\*;

public class MotifLister{

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

`   //leggo gli input`  
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
