---
title: BioJava:Cookbook:Annotations:Filter
---

How do I filter sequences based on their species?
-------------------------------------------------

The species field of a GenBank SwissProt or EMBL file ends up as an
Annotation entry. Essentially all you need to do is get the species
property from a sequences Annotation and check to see if it is what you
want.

The species property name depends on the source: for EMBL or SwissProt
it is "OS" for GenBank it is "Organism".

The following program will read in Sequences from a file and filter them
according to their species. The same general recipe with a little
modification could be used for any Annotation property.

    import java.io.*;

    import org.biojava.bio.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.db.*;
    import org.biojava.bio.seq.io.*;

    public class FilterEMBLBySpecies {
      public static void main(String[] args) {

        try {
          //read an EMBL file specified in args[0]
          BufferedReader br = new BufferedReader(new FileReader(args[0]));
          SequenceIterator iter = SeqIOTools.readEmbl(br);

          //the species name to search for (specified by args[1]);
          String species = args[1];

          //A sequenceDB to store the filtered Seqs
          SequenceDB db = new HashSequenceDB();

          //As each sequence is read
          while(iter.hasNext()){
            Sequence seq = iter.nextSequence();
            Annotation anno = seq.getAnnotation();

            //check the annotation for Embl organism field "OS"
            if(anno.containsProperty("OS")){

              String property = (String)anno.getProperty("OS");

              //check the value of the property, could also do this with a regular expression
              if(property.startsWith(species)){
                db.addSequence(seq);
              }
            }
          }

          //write the sequences as FASTA
          SeqIOTools.writeFasta(System.out, db);
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
      }
    }
