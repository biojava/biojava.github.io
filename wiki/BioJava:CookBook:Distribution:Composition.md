---
title: BioJava:CookBook:Distribution:Composition
---

Calculating the composition of a Sequence or collection of Sequences
--------------------------------------------------------------------

The following program is a full application that can determine the
composition of one or more `SymbolList`s or `RichSequence` objects. The
application can count words or any order (size) and can count them as
overlapping or non-overlapping words (eg triplets or codons).

The program uses the Jakarta CLI library for processing command line
options. It uses java 1.5 generics for type safety. It also demonstrates
the use of the BioJavaX I/O framework including customizations that
ignore things like features and comments that are not relevant to
calculating sequence composition.

    /*
     * Composition.java
     *
     * Created on October 10, 2005, 2:30 PM
     */

    package com.nitd.novartis.app;

    import java.io.BufferedReader;
    import java.io.FileOutputStream;
    import java.io.FileReader;
    import java.io.IOException;
    import java.io.PrintStream;
    import java.text.NumberFormat;
    import java.util.ArrayList;
    import java.util.Collections;
    import java.util.Iterator;
    import java.util.List;
    import java.util.NoSuchElementException;
    import java.util.Set;
    import org.apache.commons.cli.CommandLine;
    import org.apache.commons.cli.CommandLineParser;
    import org.apache.commons.cli.HelpFormatter;
    import org.apache.commons.cli.Option;
    import org.apache.commons.cli.Options;
    import org.apache.commons.cli.PosixParser;
    import org.biojava.bio.BioError;
    import org.biojava.bio.BioException;
    import org.biojava.bio.dist.Distribution;
    import org.biojava.bio.dist.DistributionFactory;
    import org.biojava.bio.dist.DistributionTools;
    import org.biojava.bio.dist.DistributionTrainerContext;
    import org.biojava.bio.dist.SimpleDistributionTrainerContext;
    import org.biojava.bio.seq.Sequence;
    import org.biojava.bio.seq.SequenceIterator;
    import org.biojava.bio.seq.io.SymbolTokenization;
    import org.biojava.bio.symbol.Alphabet;
    import org.biojava.bio.symbol.AlphabetManager;
    import org.biojava.bio.symbol.AtomicSymbol;
    import org.biojava.bio.symbol.FiniteAlphabet;
    import org.biojava.bio.symbol.IllegalAlphabetException;
    import org.biojava.bio.symbol.IllegalSymbolException;
    import org.biojava.bio.symbol.Symbol;
    import org.biojava.bio.symbol.SymbolList;
    import org.biojava.bio.symbol.SymbolListViews;
    import org.biojava.utils.ChangeVetoException;
    import org.biojavax.RichObjectFactory;
    import org.biojavax.bio.seq.RichSequenceIterator;
    import org.biojavax.bio.seq.io.EMBLFormat;
    import org.biojavax.bio.seq.io.FastaFormat;
    import org.biojavax.bio.seq.io.GenbankFormat;
    import org.biojavax.bio.seq.io.INSDseqFormat;
    import org.biojavax.bio.seq.io.RichSequenceBuilderFactory;
    import org.biojavax.bio.seq.io.RichSequenceFormat;
    import org.biojavax.bio.seq.io.RichStreamReader;
    import org.biojavax.bio.seq.io.UniProtFormat;


    /**
     * Determine the compostion of a group of sequences.
     * @author Mark Schreiber
     */
    public class Composition {
        private Alphabet alpha;
        private SequenceIterator iter;
        
        /** Creates a new instance of Composition */
        public Composition() {
        }
           
        /**
         * Determine the composition of a single <CODE>SymbolList</CODE>.
         * @param sl The <CODE>SymbolList</CODE> to determine the composition of.
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a 
         * <CODE>Distribution</CODE> cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution compostion(SymbolList sl) 
                throws IllegalAlphabetException, IllegalSymbolException, BioException{
            Set<SymbolList> set = Collections.singleton(sl);
            return averageCompostion(set.iterator(), 1, false);
        }
        
        /**
         * Determine the composition of higer order words from
         * a single <CODE>SymbolList</CODE>. Optionally windowed
         * (non-overlapping) or overlapping words can be used. Codons
         * would be an example of 3rd order windowed words.
         * @param sl The <CODE>SymbolList</CODE> to determine the composition of.
         * @param order the order of words to count (eg for triplets use 3)
         * @param windowed true to count non-overlapping words (eg codons).
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a <CODE>Distribution</CODE> 
         * cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution compostion(SymbolList sl, int order, boolean windowed) 
                throws IllegalAlphabetException, IllegalSymbolException, BioException{
            Set<SymbolList> set = Collections.singleton(sl);
            return averageCompostion(set.iterator(), order, windowed);
        }
        
        /**
         * Determine the average composition of a collection of
         * <CODE>SymbolList</CODE>s.
         * @param iter an iterator over <CODE>SymbolList</CODE>s.
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a 
         * <CODE>Distribution</CODE> cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution averageCompostion(Iterator<? extends SymbolList> iter) 
           throws IllegalAlphabetException, IllegalSymbolException, BioException
        {
            return this.averageCompostion(iter, 1, false);
        }
        
        /**
         * Determine the average composition of higer order words from
         * a collection of <CODE>SymbolList</CODE>s. Optionally windowed
         * (non-overlapping) or overlapping words can be used. Codons
         * would be an example of 3rd order windowed words.
         * @param iter an iterator over <CODE>SymbolList</CODE>s.
         * @param order the order of words to count (eg for triplets use 3)
         * @param windowed true to count non-overlapping words (eg codons).
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a <CODE>Distribution</CODE>
         * cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution averageCompostion(Iterator<? extends SymbolList> iter, int order, boolean windowed)
                    throws IllegalAlphabetException, IllegalSymbolException, BioException{
            
            DistributionTrainerContext dtc = new SimpleDistributionTrainerContext();
            Distribution d = null;
            
            if(order > 1){
                iter = this.nmerView(iter, order, windowed);
            }
                          
            while(iter.hasNext()){
                SymbolList sl = iter.next();
                d = DistributionFactory.DEFAULT.createDistribution(sl.getAlphabet());
                dtc.registerDistribution(d);    
                for(Iterator i = sl.iterator(); i.hasNext();){
                    dtc.addCount(d, (Symbol)i.next(), 1.0);
                }
            }
            try{
                dtc.train();
            }catch(ChangeVetoException ex){
                throw new Error("Cannot train distribution", ex); //impossible
            }
            return d;
        }
                
        /**
         * Determine the average composition of 
         * a collection of <CODE>RichSequence</CODE>s.
         * @param iter an iterator over <CODE>RichSequences</CODE>s.
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a 
         * <CODE>Distribution</CODE> cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution averageComposition(RichSequenceIterator iter) 
            throws IllegalAlphabetException, IllegalSymbolException, BioException{
            return averageCompostion(this.asIterator(iter), 1, false);
        }
        
        /**
         * Determine the average composition of higer order words from
         * a collection of <CODE>RichSequence</CODE>s. Optionally windowed
         * (non-overlapping) or overlapping words can be used. Codons
         * would be an example of 3rd order windowed words.
         * @param iter an iterator over <CODE>RichSequences</CODE>s.
         * @param order the order of words to count (eg for triplets use 3)
         * @param windowed true to count non-overlapping words (eg codons).
         * @throws org.biojava.bio.symbol.IllegalAlphabetException if a <CODE>Distribution</CODE>
         * cannot be made for this <CODE>Alphabet</CODE>
         * @throws org.biojava.bio.symbol.IllegalSymbolException if a <CODE>Symbol</CODE> from another 
         * <CODE>Alphabet</CODE> is presented to the
         * <CODE>DistributionTrainer</CODE>.
         * @throws org.biojava.bio.BioException unlikely to occur unless calculating windowed
         * composition on a sequence not evenly divisible
         * by the window length. Can also occur if a
         * <CODE>SymbolList</CODE> or <CODE>RichSequence</CODE>
         * is unavailable from an iterator or if
         * a <CODE>Distribution</CODE> somehow becomes
         * locked during training.
         * @return a <CODE>Distribution</CODE> representing the
         * calculated composition.
         */
        public Distribution averageComposition(RichSequenceIterator iter, int order, boolean windowed) 
            throws IllegalAlphabetException, IllegalSymbolException, BioException{
            return averageCompostion(this.asIterator(iter), order, windowed);
        }
        
        /**
         * Display help on the use of the program.
         */
        public static void help(){
            HelpFormatter helpf = new HelpFormatter();
            helpf.printHelp("java seqanalyzer.stats.Composition [options]", options());
            System.exit(0);
        }
        
        protected static Options options(){
            Options options = new Options();
            
            Option file = new Option("i", "infile", true, "A sequence file");
                   file.setRequired(true);
            Option format = new Option("f", "format", true, "infile format. "+
                    "Can be a common name, eg fasta, or a fully qualified "+
                    "class name, eg org.biojavax.bio.seq.io.FastaFormat");
                   format.setRequired(true);
            Option alpha = new Option(
                             "a", "alphabet name", true, "the name of the Alphabet eg DNA, RNA, Protein");
                   alpha.setRequired(true);
            Option order = new Option(
                             "o", "order", true, "and int value, the order of the nmers analysed, default is 1");
                   order.setRequired(false);
            Option windowed = new Option(
                                "w", "windowed", false,
                                "optional flag to use windowed nmers instead of sliding nmers");
                   windowed.setRequired(false);
            Option verbose = new Option(
                              "v", "verbose", false,
                              "print summary to screen, if x is not set then this is true by default");
                   verbose.setRequired(false);
            Option output = new Option("x", "output", true, "output xml to the named file");
                   output.setRequired(false);
            
            options.addOption(file);
            options.addOption(format);
            options.addOption(alpha);
            options.addOption(order);
            options.addOption(windowed);
            options.addOption(verbose);
            options.addOption(output);
            
            return options;
        }
        
        /**
         * Takes each <CODE>SymbolList</CODE> from the <CODE>Iterator</CODE> and applies
         * a view to it. The view can be windowed (eg codons) or
         * sliding (eg overlapping dimers)
         * @param iter The input iterator
         * @param nmerSize The size of the window eg 3 for codons. 
         * If the size is less than 2 then you get back 
         * the original <CODE>Iterator</CODE>
         * @param windowed true if you want non-overlapping nmers (eg codons),
         * false if you want them to overlap.
         * @return An <CODE>Iterator</CODE> over <CODE>SymbolLists</CODE> with the 
         * desired view applied. <B>You cannot call <code>remove()</code> on this iterator!</B>
         */
        public Iterator<SymbolList> nmerView(
                Iterator<? extends SymbolList> iter,
                int nmerSize,
                boolean windowed){
            
            if(nmerSize < 2) return (Iterator<SymbolList>)iter;
            
            final Iterator<? extends SymbolList> it = iter;
            final int size = nmerSize;
            final boolean w = windowed;
            return new Iterator<SymbolList>(){
                public boolean hasNext(){
                    return it.hasNext();
                }
                public SymbolList next() {
                    try{
                      SymbolList source = it.next();
                      if(w){
                          return SymbolListViews.windowedSymbolList(source, size);
                      }else{
                          return SymbolListViews.orderNSymbolList(source, size);
                      }
                    }catch(BioException e){
                        NoSuchElementException ex = new NoSuchElementException();
                        ex.initCause(e);
                        throw ex;
                    }
                }
                public void remove(){
                    throw new UnsupportedOperationException();
                }
            };
        }
        
        /**
         * Makes a <code>SequenceIterator</code> look like an 
         * <code>Iterator {@code <Sequence>}</code>
         * @param iter The <CODE>SequenceIterator</CODE>
         * @return An <CODE>Iterator</CODE> that returns only <CODE>Sequence</CODE>
         * objects. <B>You cannot call <code>remove()</code> on this iterator!</B>
         */
        public Iterator<Sequence> asIterator(SequenceIterator iter){
            final SequenceIterator it = iter;
            return new Iterator<Sequence>(){
                public boolean hasNext(){
                    return it.hasNext();
                }
                public Sequence next() {
                    try{
                      return it.nextSequence();
                    }catch(BioException e){
                        NoSuchElementException ex = new NoSuchElementException();
                        ex.initCause(e);
                        throw ex;
                    }
                }
                public void remove(){
                    throw new UnsupportedOperationException();
                }
            };
        }
        
        public static void writeDistributionAsText(Distribution d, 
                PrintStream out, char seperator, int decimalPlaces) throws IOException{
            
            NumberFormat format = NumberFormat.getInstance();
            format.setMaximumFractionDigits(decimalPlaces);
            FiniteAlphabet alpha = (FiniteAlphabet)d.getAlphabet();
            List<SymbolTokenization> toke = new ArrayList<SymbolTokenization>();
                    
            //for each component alphabet get the tokenization
            for(Iterator it = alpha.getAlphabets().iterator(); it.hasNext();){
                Alphabet component = (Alphabet)it.next();
                try{
                  toke.add(component.getTokenization("token"));
                }catch(Exception ex){
                    //no tokenization
                    toke.add(null);
                }
            }
                    
            for(Iterator it = alpha.iterator(); it.hasNext();){
                Symbol s = (Symbol)it.next();
                StringBuilder sname = new StringBuilder();
                
                List symbols = ((AtomicSymbol)s).getSymbols();
                for(int i = 0; i < symbols.size(); i++){
                    if(i > 0) sname.append(' ');
                    Symbol sym = (Symbol)symbols.get(i);
                    if(toke.get(i) != null){
                        try{
                            sname.append(toke.get(i).tokenizeSymbol(sym));
                        }catch(IllegalSymbolException ex){
                            throw new BioError(ex); //should never happen.
                        }
                    }else{
                        sname.append(sym.getName());
                    }
                }   
                
                try{
                  out.print(sname.toString()+seperator+
                        format.format(d.getWeight(s))+"\n");
                }catch(IllegalSymbolException e){
                    throw new BioError(e); //this should never happen in this case
                }
            }
            out.flush();
            out.close();
        }
        
        /**
         * Attempts to find a format for a name String such as "genbank" or for a
         * fully qualified string like org.biojavax.bio.seq.io.UniProtFormat
         * @return the matching <code>RichSequenceFormat</code>
         * @param name the name of the format, case insensitive except for qualified class names
         * @throws java.lang.IllegalAccessException If java cannot reflectively access the named format.
         * Only applies to fully qualified class names.
         * @throws java.lang.ClassNotFoundException If a format can not be found for the name.
         * @throws java.lang.InstantiationException If the found object cannot be created (only applies
         * to fully qualified class names).
         */
        public static RichSequenceFormat formatForName(String name) 
                throws ClassNotFoundException, InstantiationException, IllegalAccessException{
            //determine the format to use
            RichSequenceFormat format;
            if(name.equalsIgnoreCase("fasta")){
                format = new FastaFormat();
            }
            else if(name.equalsIgnoreCase("genbank")){
                format = new GenbankFormat();
            }
            else if(name.equalsIgnoreCase("uniprot")){
                format = new UniProtFormat();
            }
            else if(name.equalsIgnoreCase("embl")){
                format = new EMBLFormat();
            }
            else if(name.equalsIgnoreCase("INSDseq")){
                format = new INSDseqFormat();
            }
            else{
                Class formatClass = Class.forName(name);
                format = (RichSequenceFormat)formatClass.newInstance();
            }
            return format;
        }
        
        /**
         * Use this class as an application
         * @param args the command line arguments
         * @throws java.lang.Exception if something goes wrong
         */
        public static void main(String[] args) throws Exception{
            
            CommandLineParser cliparser = new PosixParser();
            CommandLine cmd = null;
            try{
                cmd = cliparser.parse(options(), args, true);
            }catch(Exception e){
                help();
            }
            
            BufferedReader br = new BufferedReader(
                    new FileReader(cmd.getOptionValue('i')));
            
            RichSequenceFormat format = 
                    formatForName(cmd.getOptionValue('f'));
            SymbolTokenization toke = null;
            
            try{
                toke = AlphabetManager.alphabetForName(
                    cmd.getOptionValue('a')).getTokenization("token");
            }catch(NoSuchElementException ex){
                //try it upper case
                toke = AlphabetManager.alphabetForName(
                    cmd.getOptionValue('a').toUpperCase()).getTokenization("token");
            }
            int order = Integer.parseInt(cmd.getOptionValue('o', "1"));
            boolean windowed = cmd.hasOption('w');
            
            
            format.setElideComments(true); //don't need these
            format.setElideFeatures(true);   //don't need these
            format.setElideReferences(true); //don't need these
            RichStreamReader sr = new  RichStreamReader(
                    br, format, toke, 
                    RichSequenceBuilderFactory.THRESHOLD, 
                    RichObjectFactory.getDefaultNamespace());
            
            Composition compo = new Composition();
            Distribution average = compo.averageComposition(sr, order, windowed);
            
            if(cmd.hasOption('v') || cmd.hasOption('x') == false){
               writeDistributionAsText(average, System.out, ',', 8);
            }
            
            if(cmd.hasOption('x')){
                String filename = cmd.getOptionValue('x');
                try{
                    DistributionTools.writeToXML(
                            average, new FileOutputStream(filename));
                }catch(Exception e){
                    System.err.println("Couldn't write "+filename);
                    e.printStackTrace(System.err);
                }
            }
        }
    }
