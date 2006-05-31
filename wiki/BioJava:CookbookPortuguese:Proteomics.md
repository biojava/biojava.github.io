---
title: BioJava:CookbookPortuguese:Proteomics
---

Como eu posso calcular a massa e pI de um peptideo?
---------------------------------------------------

se voce está fazendo um projeto em proteômica, é importante saber o
quanto se aproxima a massa e o pI de gene colocado. BioJava contem duas
classes (MassCalc e IsoelectricPointCalc) do pacote proteomics que irá
calcular estes numeros para voce.

O programa abaixo demonstra um uso básico destas classes. Este simples
exemplo utiliza "fairly" parametros padroes mas as funções MassCalc and
IsoelectricPointCalc tem outras opções especializadas que não serão
demonstradas aqui. Consulte os documentos sobre biojava API docs para
informações sobre estas opções.

<java> import java.io.BufferedReader; import java.io.FileOutputStream;
import java.io.FileReader; import java.io.PrintWriter;

import org.biojava.bio.BioException; import
org.biojava.bio.proteomics.IsoelectricPointCalc; import
org.biojava.bio.proteomics.MassCalc; import
org.biojava.bio.seq.ProteinTools; import org.biojava.bio.seq.RNATools;
import org.biojava.bio.seq.Sequence; import
org.biojava.bio.seq.SequenceIterator; import
org.biojava.bio.seq.io.SeqIOTools; import org.biojava.bio.symbol.Edit;
import org.biojava.bio.symbol.IllegalAlphabetException; import
org.biojava.bio.symbol.IllegalSymbolException; import
org.biojava.bio.symbol.SimpleSymbolList; import
org.biojava.bio.symbol.SymbolList; import
org.biojava.bio.symbol.SymbolPropertyTable;

/\*\*

`* Calcula a massa and o ponto Isoelectric de uma coleção de`  
`* sequencias`  
`*/`

public class CalcMass {

` /**`  
`  * Chame isto para exibir informações de uso, o programa terminates após sua chamada.`  
`  */`  
` public static void help(){`  
`   System.out.println(`  
`       "uso: java calcMass `<file>` `<format>` `<DNA|RNA|PROTEIN>` `<out file>`");`  
`   System.exit( -1);`

` }`

` public CalcMass() {`  
` }`

` /**`  
`  * Calcula a Massa do peptideo em Daltons. Utilizando a massa `  
`  * média do Isótopo`  
`  * @param protein o peptideo`  
`  * @throws IllegalSymbolException se ``protein`` não for uma proteina`  
`  * @return a mass`  
`  */`  
` public double mass(SymbolList protein)throws IllegalSymbolException{`  
`   double mass = 0.0;`  
`   MassCalc mc = new MassCalc(SymbolPropertyTable.AVG_MASS, true);`  
`   mass = mc.getMass(protein);`  
`   return mass;`  
` }`

` /**`  
`  * Calculates the isoelectric point assuming a free NH and COOH`  
`  * @param protein the peptide`  
`  * @throws IllegalAlphabetException if ``protein`` is not a peptide`  
`  * @throws BioException`  
`  * @return double the PI`  
`  */`  
` public double pI(SymbolList protein)`  
`     throws IllegalAlphabetException, BioException{`

`   double pI = 0.0;`  
`   IsoelectricPointCalc ic = new IsoelectricPointCalc();`  
`   pI = ic.getPI(protein, true, true);`  
`   return pI;`  
` }`

` public static void main(String[] args) throws Exception{`  
`   if(args.length != 4)`  
`     help();`

`   BufferedReader br = null;`  
`   PrintWriter out = null;`  
`   try{`  
`     //read sequences`  
`     br = new BufferedReader(new FileReader(args[0]));`  
`     SequenceIterator seqi =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(args[1], args[2], br);`

`     out = new PrintWriter(new FileOutputStream(args[3]));`

`     //write header`  
`     out.println("name, mass, pI, size, sequence");`

`     //initialize calulator`  
`     CalcMass calcMass = new CalcMass();`

`     while (seqi.hasNext()) {`  
`       SymbolList syms = seqi.nextSequence();`  
`       String name = null;`

`       //get an appropriate name for the peptide`  
`       if(args[1].equalsIgnoreCase("fasta")){`  
`         name = ((Sequence) syms).getAnnotation().`  
`             getProperty("description_line").toString();`  
`       }else{`  
`         name = ((Sequence)syms).getName();`  
`       }`  
`       out.print(name+",");`

`       //if not protein we need to translate it.`  
`       if(syms.getAlphabet() != ProteinTools.getAlphabet() &&`  
`          syms.getAlphabet() != ProteinTools.getTAlphabet()){`  
`         if(syms.getAlphabet() != RNATools.getRNA()){`  
`           syms = RNATools.transcribe(syms);`  
`         }`

`         //if not divisible by three truncate`  
`         if(syms.length() % 3 != 0){`  
`           syms = syms.subList(1, syms.length() - (syms.length() %3));`  
`         }`

`         syms = RNATools.translate(syms);`

`        /*`  
`         * Translation of GTG or TTG actually results in a Methionine if`  
`         * it is the start codon (all proteins start with f-Met). Therefore`  
`         * we need to edit the sequence.`  
`         */      `  
`         if(syms.symbolAt(1) != ProteinTools.met()){`  
`           `  
`           //SimpleSymbolLists are editable others may not be`  
`           syms = new SimpleSymbolList(syms);`  
`           Edit e = new Edit(1, syms.getAlphabet(), ProteinTools.met());`  
`           syms.edit(e);`  
`         }`  
`       }`

`       //if the seq ends with a * (termination) we need to remove the *`  
`       if (syms.symbolAt(syms.length()) == ProteinTools.ter()) {`  
`         syms = syms.subList(1, syms.length()-1);`  
`       }`

`       //do calculations`  
`       double mass = calcMass.mass(syms);`  
`       double pI = calcMass.pI(syms);`

`       //print result for this protein`  
`       out.println(mass+","+pI+","+syms.length()+","+syms.seqString());`  
`     }`  
`   }`  
`   finally{ //tidy up`  
`     if(br != null){`  
`       br.close();`  
`     }`  
`     if(out != null){`  
`       out.flush();`  
`       out.close();`  
`     }`  
`   }`  
` }`

} </java>
