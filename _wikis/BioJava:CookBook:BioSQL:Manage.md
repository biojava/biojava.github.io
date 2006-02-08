---
title: BioJava:CookBook:BioSQL:Manage
---

How do I add, view and remove Sequence Objects from a BioSQL DB?
----------------------------------------------------------------

BioJava provides support classes that make a BioSQL compliant database
look like an instance of a SequenceDB object. The class that you will
mostly use is BioSQLSequenceDB. This class is an instance of SequenceDB
and is used in exactly the same way. The good news is that you need to
know nothing about SQL commands or the BioSQL schema. Operations that
you perform on the BioSSQLSequenceDB are automatically persisted back to
the BioSQL DB that backs the class.

The following example demonstrates how to connect to a BioSQL DB, how to
add a sequence, how to query the DB for a sequence and how to delete
that sequence from the DB.

    import org.biojava.bio.BioException; 
    import org.biojava.bio.seq.DNATools; 
    import org.biojava.bio.seq.Sequence; 
    import org.biojava.bio.seq.db.biosql.BioSQLSequenceDB; 
    import org.biojava.utils.ChangeVetoException; 
    import org.biojava.bio.seq.io.SeqIOTools; 
    import java.io.*; 


    /** 
     * <p> Tests a connection to a BioSQLSequenceDB 
     * and a simple Sequence write, read and delete</p> 
     */ 

    public class Connect { 
      public static void main(String[] args) {
        
        //url format depends on your jdbc driver
        String dbURL = "jdbc:oracle:thin:@mydbserver:1521:biosql"; 
        String dbUser = "username"; 
        String dbPass = "secret_password";
        
        //we will connect to a biodatabase called test
        String biodatabase = "test";
        //or create one if it doesn't exist
        boolean createIfMissing = true; 

        try {
          //load a JDBC driver
          Class.forName("oracle.jdbc.driver.OracleDriver"); 
        } 
        catch (ClassNotFoundException ex) { 
          System.out.println("Cannot find DB driver, is it on your classpath?"); 
        } 
        try {
          
          //create a connection
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
            //delete the record 
            //cannot remove unless there are no references to the sequence 
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
