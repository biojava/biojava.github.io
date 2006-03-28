---
title: BioJava:CookbookFrench:Proteomics
---

Comment la masse et le pI d'une protéine?
-----------------------------------------

Si vous travaillez sur un projet de protéomique, il est important de
savoir la masse approximative et le pI de peptides provenant des gènes
d'intérêt. BioJava possède deux classes (*MassCalc* et
*IsoelectricPointCalc*), contenues dans le package
org.biojava.bio.proteomics, qui peuvent calculer ces valeurs pour vous.

Le programme qui suit montre l'usage de base de ces deux classes. Cet
exemple simple utilise des paramètres par défaut mais autant *MassCalc*
que *IsoelectricPointCalc* possèdent des options spécialisées qui ne
sont pas montré ici. Consulter
l'[API](http://www.biojava.org/docs/api14/index.html) de Biojava afin
d'en savoir plus.

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

`*  Calculer la masse et le point isoelectrique d'une collection de`  
`*  séquences  `  
`*/`

public class CalcMass {

` /**`  
`  *  Méthode définissant l'info d"utilisation, terminant le programme`  
`  *  après.`  
`  */`  
` public static void help(){`  
`   System.out.println(`  
`       "usage: java calcMass `<file>` `<format>` `<DNA|RNA|PROTEIN>` `<out file>`");`  
`   System.exit( -1);`

` }`

` public CalcMass() {`  
` }`

` /**`  
`  *  Calcule  la masse du peptide en Daltons, en utilisant la masse`  
`  *  isotopique moyenne.`  
`  *  @param protein: le peptide`  
`  *  @lance IllegalSymbolException si protein n'est pas une proteine`  
`  *  @retourne mass, la masse`  
`  */`  
` public double mass(SymbolList protein)throws IllegalSymbolException{`  
`   double mass = 0.0;`  
`   MassCalc mc = new MassCalc(SymbolPropertyTable.AVG_MASS, true);`  
`   mass = mc.getMass(protein);`  
`   return mass;`  
` }`

` /**`  
`  *  Calcule le point isoelectrique en assumant des extrémités`  
`  *  NH2 et COOH libres`  
`  *  @param protein: le peptide`  
`  *  @lance IllegalAlphabetException si protein n'est pas une proteine`  
`  *  @lance BioException`  
`  *  @return pI: le pI de type double`  
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
`     // lecture des séquences`  
`     br = new BufferedReader(new FileReader(args[0]));`  
`     SequenceIterator seqi =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(args[1], args[2], br);`

`     out = new PrintWriter(new FileOutputStream(args[3]));`

`     // écrire l'en-tête du rapport`  
`     out.println("name, mass, pI, size, sequence");`

`     // initialiser le calcul de la masse`  
`     CalcMass calcMass = new CalcMass();`

`     while (seqi.hasNext()) {`  
`       SymbolList syms = seqi.nextSequence();`  
`       String name = null;`

`       // obtenir un nom approprié pour la protéine`  
`      if(args[1].equalsIgnoreCase("fasta")){`  
`         name = ((Sequence) syms).getAnnotation().`  
`             getProperty("description_line").toString();`  
`       }else{`  
`         name = ((Sequence)syms).getName();`  
`       }`  
`       out.print(name+",");`

`       // si la séquence n'est pas une protéine, la traduire.`  
`       if(syms.getAlphabet() != ProteinTools.getAlphabet() &&`  
`          syms.getAlphabet() != ProteinTools.getTAlphabet()){`  
`         if(syms.getAlphabet() != RNATools.getRNA()){`  
`           syms = RNATools.transcribe(syms);`  
`         }`

`         // si non-divisible par 3, tronquer la protéine`  
`         if(syms.length() % 3 != 0){`  
`           syms = syms.subList(1, syms.length() - (syms.length() %3));`  
`         }`

`         syms = RNATools.translate(syms);`

`        /*`  
`         * Tranduction des codons GTG et TTG produit une Methionine si`  
`         * ils sont les codons d"initiation (toute proteine commence avec f-Met). `  
`         * Par conséquent, il faut éditer la séquence.`  
`         */      `  
`         if(syms.symbolAt(1) != ProteinTools.met()){`  
`           `  
`           // Les objets SimpleSymbolLists peuvent être `  
`           // modifiés mais d'autres pourraient ne pas l'être`  
`           syms = new SimpleSymbolList(syms);`  
`           Edit e = new Edit(1, syms.getAlphabet(), ProteinTools.met());`  
`           syms.edit(e);`  
`         }`  
`       }`

`       // si les séquences se termine avec un * (terminaison), il faut`  
`       // enlever ce caractère`  
`       if (syms.symbolAt(syms.length()) == ProteinTools.ter()) {`  
`         syms = syms.subList(1, syms.length()-1);`  
`       }`

`       // effectuer les calculs`  
`     double mass = calcMass.mass(syms);`  
`       double pI = calcMass.pI(syms);`

`       // imprimer les résultats pour cette protéine`  
`       out.println(mass+","+pI+","+syms.length()+","+syms.seqString());`  
`     }`  
`   }`  
`   finally{ // pour en finir`  
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
