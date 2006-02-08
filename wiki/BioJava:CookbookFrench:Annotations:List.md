---
title: BioJava:CookbookFrench:Annotations:List
---

Comment obtenir la liste des Annotations d'une Sequence?
--------------------------------------------------------

Lorsque vous lisez un fichier de séquences annotées, comme GenBank or
EMBL, celui-ci contient bien plus d'informations que la simple séquence.
Si cette information est à une position précise, elle devient un
Feature. Si elle est plus générique, comme le nom de l"espèce, cette
information devient une Annotation.

Les objets Annotations de BioJava sont semblables à des objets de type
Map et contiennent des clés et leur valeurs associées.

Voici le début d'un fichier EMBL:

    ID   AY130859  standard; DNA; HUM; 44226 BP.
    XX
    AC   AY130859;
    XX
    SV   AY130859.1
    XX
    DT   25-JUL-2002 (Rel. 72, Created)
    DT   25-JUL-2002 (Rel. 72, Last updated, Version 1)
    XX
    DE   Homo sapiens cyclin-dependent kinase 7 (CDK7) gene, complete cds.
    XX
    KW   .
    XX
    OS   Homo sapiens (human)
    OC   Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Mammalia;
    OC   Eutheria; Primates; Catarrhini; Hominidae; Homo.
    XX
    RN   [1]
    RP   1-44226
    RA   Rieder M.J., Livingston R.J., Braun A.C., Montoya M.A., Chung M.-W.,
    RA   Miyamoto K.E., Nguyen C.P., Nguyen D.A., Poel C.L., Robertson P.D.,
    RA   Schackwitz W.S., Sherwood J.K., Witrak L.A., Nickerson D.A.;
    RT   ;
    RL   Submitted (11-JUL-2002) to the EMBL/GenBank/DDBJ databases.
    RL   Genome Sciences, University of Washington, 1705 NE Pacific, Seattle, WA
    RL   98195, USA
    XX
    CC   To cite this work please use:  NIEHS-SNPs, Environmental Genome
    CC   Project, NIEHS ES15478, Department of Genome Sciences, Seattle, 
    WA
    CC   (URL: http://egp.gs.washington.edu).

Le programme suivant lit un fichier EMBL et donne la liste des
différentes propriétés des Annotations. La sortie du programme est
donnée en exemple à la fin du programme.

    import java.io.*;
    import java.util.*;

    import org.biojava.bio.*;
    import org.biojava.bio.seq.*;
    import org.biojava.bio.seq.io.*;

    public class ListAnnotations {
      public static void main(String[] args) {

        try {
          //lire un fichier EMBL 
          BufferedReader br = new  BufferedReader(new FileReader(args[0]));
          SequenceIterator seqs = SeqIOTools.readEmbl(br);

          //pour chacune des séquences du fichier, faire la liste des annotations
          while(seqs.hasNext()){
            Annotation anno = seqs.nextSequence().getAnnotation();

            //imprimer chacune des paires clé-valeur 
            for (Iterator i = anno.keys().iterator(); i.hasNext(); ) {
              Object key = i.next();
              System.out.println(key +" : "+ anno.getProperty(key));
            }
          }
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
      }
    }

Sortie du programme:

    RN : [1]
    KW : . 
    RL : [Submitted (11-JUL-2002) to the EMBL/GenBank/DDBJ databases., Genome 
    Sciences, University of Washington, 1705 NE Pacific, Seattle, WA, 98195, USA]
    embl_accessions : [AY130859]
    DE : Homo sapiens cyclin-dependent kinase 7 (CDK7) gene, complete cds.
    SV : AY130859.1
    AC : AY130859;
    FH : Key Location/Qualifiers
    XX :
    OC : [Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Mammalia;, 
    Eutheria; Primates; Catarrhini; Hominidae; Homo.]
    RA : [Rieder M.J., Livingston R.J., Braun A.C., Montoya M.A., Chung M.-W.,, 
    Miyamoto K.E., Nguyen C.P., Nguyen D.A., Poel C.L., Robertson P.D.,, Schackwitz 
    W.S., Sherwood J.K., Witrak L.A., Nickerson D.A.;]
    ID : AY130859 standard; DNA; HUM; 44226 BP.
    DT : [25-JUL-2002 (Rel. 72, Created), 25-JUL-2002 (Rel. 72, Last updated, 
    Version 1)] 
    CC : [To cite this work please use: NIEHS-SNPs, Environmental Genome, Project, 
    NIEHS ES15478, Department of Genome Sciences, Seattle, WA, (URL: http://egp.gs.washington.edu).]
    RT : ;
    OS : Homo sapiens (human)
    RP : 1-44226
