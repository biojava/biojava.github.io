---
title: BioJava:CookbookPortuguese:Proteomics
---

Como eu posso calcular a massa e pI de um peptideo?
---------------------------------------------------

Se voce está fazendo um projeto em proteômica, é importante saber o
quanto a massa se aproxima do pI no gene. BioJava contém duas classes
(*MassCalc* e *IsoelectricPointCalc*) no pacote proteomics que irá
calcular estes números para você.

O código abaixo demonstra um uso básico destas classes. Este exemplo
simples utiliza parametros razoavelmente padroes, porém as funções
*MassCalc* e *IsoelectricPointCalc* tem outras opções especializadas que
não serão demonstradas aqui. Consulte a API do biojava para informações
sobre estas opções.

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

`* Calcula a massa eo ponto isoeletrico de uma coleção de`  
`* sequencias`  
`*/`

public class CalcMass {

` /**`  
`  * Chame isto para exibir informações de uso, o programa encerra após sua chamada.`  
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
`  * @param proteina`  
`  * @throws IllegalSymbolException se ``protein`` não for uma proteina`  
`  * @return uma massa`  
`  */`  
` public double mass(SymbolList protein)throws IllegalSymbolException{`  
`   double mass = 0.0;`  
`   MassCalc mc = new MassCalc(SymbolPropertyTable.AVG_MASS, true);`  
`   mass = mc.getMass(protein);`  
`   return mass;`  
` }`

` /**`  
`  * Calcula o ponto isoeletrico assumindo NH e COOH livres`  
`  * @param proteina`  
`  * @throws IllegalAlphabetException se ``protein`` não for uma proteina`  
`  * @throws BioException`  
`  * @return double o valor de pI`  
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
`     //Le as sequencias`  
`     br = new BufferedReader(new FileReader(args[0]));`  
`     SequenceIterator seqi =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(args[1], args[2], br);`

`     out = new PrintWriter(new FileOutputStream(args[3]));`

`     //Escreve o cabeçalho`  
`     out.println("name, mass, pI, size, sequence");`

`     //Inicializa o calculador`  
`     CalcMass calcMass = new CalcMass();`

`     while (seqi.hasNext()) {`  
`       SymbolList syms = seqi.nextSequence();`  
`       String name = null;`

`       //pega o nome do peptideo`  
`       if(args[1].equalsIgnoreCase("fasta")){`  
`         name = ((Sequence) syms).getAnnotation().`  
`             getProperty("description_line").toString();`  
`       }else{`  
`         name = ((Sequence)syms).getName();`  
`       }`  
`       out.print(name+",");`

`       //se nao for uma proteina é necessário traduzir.`  
`       if(syms.getAlphabet() != ProteinTools.getAlphabet() &&`  
`          syms.getAlphabet() != ProteinTools.getTAlphabet()){`  
`         if(syms.getAlphabet() != RNATools.getRNA()){`  
`           syms = RNATools.transcribe(syms);`  
`         }`

`         //se nao for divisível por 3 trunca`  
`         if(syms.length() % 3 != 0){`  
`           syms = syms.subList(1, syms.length() - (syms.length() %3));`  
`         }`

`         syms = RNATools.translate(syms);`  
`         if(syms.symbolAt(1) != ProteinTools.met()){`  
`           `  
`           //SimpleSymbolLists são editaveis outros podem não ser`  
`           syms = new SimpleSymbolList(syms);`  
`           Edit e = new Edit(1, syms.getAlphabet(), ProteinTools.met());`  
`           syms.edit(e);`  
`         }`  
`       }`

`       //se a sequencia termina com um * é necessário remove-lo`  
`       if (syms.symbolAt(syms.length()) == ProteinTools.ter()) {`  
`         syms = syms.subList(1, syms.length()-1);`  
`       }`

`       //calcula`  
`       double mass = calcMass.mass(syms);`  
`       double pI = calcMass.pI(syms);`

`       //mostra o resultado para esta proteina`  
`       out.println(mass+","+pI+","+syms.length()+","+syms.seqString());`  
`     }`  
`   }`  
`   finally{ `  
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
