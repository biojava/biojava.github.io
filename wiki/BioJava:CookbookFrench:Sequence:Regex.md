---
title: BioJava:CookbookFrench:Sequence:Regex
---

Comment transformer un motif en expression régulière?
-----------------------------------------------------

Une utilisation très intéressante de la classe *MotifTools* est la
transformation d'une *Sequence* en expression régulière de type
*Pattern* utilisable à partir de Java 1.4. Vous pouvez ensuite utiliser
ce *Pattern* pour faire des recherches sur des *Strings* avec ce
*Pattern*. L'expression régulière peut même être créer à partir d'une
séquence aussi ambigue que "acgytnwacrs".

L'exemple suivant, gracieuseté de Andy Hammer, montre comment faire pour
chercher des motifs dans des *Sequences*. Le programme trouve toutes les
instances d'un motif sur une séquence lue en format FASTA et les
affichent en sortie standard.

    import java.io.BufferedReader;
    import java.io.FileInputStream;
    import java.io.InputStreamReader;
    import java.util.regex.Matcher;
    import java.util.regex.Pattern;

    import org.biojava.bio.BioError;
    import org.biojava.bio.BioException;
    import org.biojava.bio.seq.DNATools;
    import org.biojava.bio.seq.ProteinTools;
    import org.biojava.bio.seq.RNATools;
    import org.biojava.bio.seq.Sequence;
    import org.biojava.bio.seq.SequenceIterator;
    import org.biojava.bio.seq.io.SeqIOTools;
    import org.biojava.bio.symbol.MotifTools;
    import org.biojava.bio.symbol.SymbolList;

    public class MotifLister{

      private SymbolList motif;
      private int frame;
      private int count;
      private SequenceIterator si;


      public MotifLister(String type, String inputFile,
                         String target, String placement)throws Exception{

        System.out.println("MotifLister is searching file " + inputFile +
                           " for the motif "" + target +
                           "" in frame " + placement + ".");

        try{
          if(type.equalsIgnoreCase("dna")){
            motif = DNATools.createDNA(target);
          }else if(type.equalsIgnoreCase("rna")){
            motif = RNATools.createRNA(target);
          }else{
            motif = ProteinTools.createProtein(target);
          }
        }
        catch(BioError e){
          System.out.println("Error!!  Data type must match type of motif.");
          System.out.println("Specifically, " + target + " is not " + type);
          System.exit(0);
        }

        frame = Integer.parseInt(placement);

        if (frame < 0 || frame > 3) {
          System.out.println("Only frames 0 through 3 are allowed");
          System.out.println("frame zero searches all frames.");
          System.exit(0);
        }

        // créer une expression régulière avec la 
        // SymbolList en utilisant MotifTools
        Pattern p = Pattern.compile( MotifTools.createRegex(motif) );

        count = 0;

        // lire le fichier en entrée de donnée
        FileInputStream fis = new FileInputStream(inputFile);
        InputStreamReader isr = new InputStreamReader(fis);
        BufferedReader input = new BufferedReader(isr);

        try{
          si = (SequenceIterator)SeqIOTools.fileToBiojava("fasta", "type", input);

          // pour chaque séquence
          while (si.hasNext()){
            Sequence seq = si.nextSequence();

            // obtenir le Matcher correspondant au Pattern
            Matcher matcher = p.matcher(seq.seqString());

            int start = 0;

            // trouver la prochaine instance du motif
            // à partir du début
            while(matcher.find(start)) {
              start = matcher.start();
              int end = matcher.end();
              int result = (start % 3) + 1;
              if(result == frame || frame == 0){

                // imprimer la position de l"occurance sur la console 
                System.out.println(seq.getName() + " : " +
                                   "[" + (start + 1) + "," + (end) + "]");
                count++;
              }
              start++;
            }
          }
          // fermer le fichier
          input.close(); 
          System.out.println("Total Hits = " + count);
        }
        catch(BioException e){
          System.out.println(inputFile + " is not a " + type + " file.");
          System.out.println(e);
        }
      }

      public static void main(String[] args)throws Exception{
        if (args.length < 4) {
          System.err.println(" Usage: java -jar MotifLister.jar type fastaFile motif frame" +
                             "\n Ex: java -jar MotifLister.jar dna eColi.fasta AAAAAAG 3 > output.txt" +
                             "\n would search for A AAA AAG in the third frame in dna file eColi.fasta" +
                             "\n and print the results to file output.txt." +
                             "\n "type" can be dna, rna, or protein." +
                             "\n "frame" can be integers 0 through 3." +
                             "\n 0 counts any instance of the motif." +
                             "\n 1, 2, 3 counts only instances of the motif in the specified frame." +
                             "\n Capture output with redirection operator \">\".");
        }else{
          MotifLister ML = new MotifLister(args[0], args[1], args[2], args[3]);
        }
      }
    }
