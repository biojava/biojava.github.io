---
title: BioJava:CookbookFrench:BioSQL:Manage
---

Comment ajouter, voir et &eacuteliminer des objets de type Sequence d'une base de données BioSQL?
-------------------------------------------------------------------------------------------------

BioJava contient des classes utilitaires qui donne l'aspect d'une
instance SequenceDB à n'importe quel base de donnés respectant la schéma
BioSQL. La classe qui vous utiliserait probablement le plus est
*BioSQLSequenceDB*. *BioSQLSequenceDB* est une instance dérivée de
*SequenceDB* et s'utilise exactement de la même manière. L'heureuse
conséquence de cet état de fait est que ceci rends inutile l'utilisation
de commandes SQL ou la connaissance du scéma BioSQL. Toute opération
faite sur l'objet *BioSSQLSequenceDB* se répercute de fait dans la base
de données BioSQL qui se trouve derriè cette classe.

L'exemple suivant montre la technique à utiliser afin de se brancher à
une base de données BioSQL, comment y ajouter une séquence, comme faire
une recherche sur la base de données et comment éliminer cette séquence
de la base de données.

    import org.biojava.bio.BioException; 
    import org.biojava.bio.seq.DNATools; 
    import org.biojava.bio.seq.Sequence; 
    import org.biojava.bio.seq.db.biosql.BioSQLSequenceDB; 
    import org.biojava.utils.ChangeVetoException; 
    import org.biojava.bio.seq.io.SeqIOTools; 
    import java.io.*; 


    /** 
     * Test d'une simple connection a une BioSQLSequenceDB 
     * aveec ecriture/lecture/rature d'une Sequence 
     */ 

    public class Connect { 
      public static void main(String[] args) {
        
        //le format de l'url dependra du pilote JDBC utilise
        String dbURL = "jdbc:oracle:thin:@mydbserver:1521:biosql"; 
        String dbUser = "username"; 
        String dbPass = "secret_password";
        
        //branchons nous a une biodatabase appellee test
        String biodatabase = "test";
        //ou bien nous en creons une
        boolean createIfMissing = true; 

        try {
          //charger le pilote JDBC
          Class.forName("oracle.jdbc.driver.OracleDriver"); 
        } 
        catch (ClassNotFoundException ex) { 
          System.out.println("Cannot find DB driver, is it on your classpath?"); 
        } 
        try {
          
          //creer une connection
          BioSQLSequenceDB db = new BioSQLSequenceDB(dbURL, 
                                                     dbUser, 
                                                     dbPass, 
                                                     biodatabase, 
                                                     createIfMissing); 
          
          Sequence seq = DNATools.createDNASequence("acgtggccttagacg","test_seq1"); 
          System.out.println("Creating sequence of type "+seq.getAlphabet().getName()); 
          try { 
            System.out.println("adding a sequence"); 
            db.addSequence(seq); 
            seq = null; 
          } 
          catch (ChangeVetoException ex) { 
            System.err.println("Cannot add Sequence, is the DB locked?"); 
            System.exit(1); 
          } 

          System.out.println("retrieving test_seq1"); 
          seq = db.getSequence("test_seq1"); 
          try { 
            SeqIOTools.writeFasta(System.out, seq); 
          } 
          catch (IOException ex) { 
            ex.printStackTrace(); 
          } 

          try { 
            //eliminer l'inscription a la bd
            //impossible a moins qu' aucune reference n'existe pour cette sequence 
            seq = null;
            System.out.println("deleting test_seq1");
            db.removeSequence("test_seq1"); 
          } 
          catch (ChangeVetoException ex) { 
            System.err.println("Cannot remove test_seq1, is the DB locked?"); 
          } 
        } 
        catch (BioException ex) { 
          ex.printStackTrace(); 
          System.exit(1); 
        } 
      } 
    }
