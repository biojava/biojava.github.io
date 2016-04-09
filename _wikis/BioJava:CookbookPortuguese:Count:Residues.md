---
title: BioJava:CookbookPortuguese:Count:Residues
---

Como eu posso contar os Residuos em uma Sequence?
-------------------------------------------------

Contar os resíduos em uma Sequence é uma tarefa muito comum na
bioinformatica. Geralmente você construiria um array de inteiros e
usaria algum sistema indexador. Ou ainda, você poderia usar um
*AlphabetIndex* para impor um índice unificado, ou obteria um indice a
partir do *AlphabetManager* usando um de seus métodos
getAlphabetIndex().

Por ser uma atividade tão comum o BioJava empacotou estes recursos em
uma classe chamada *IndexedCount* que, nada mais é, uma implementação da
interface Count.

O exemplo a seguir lê algum tipo de arquivo de sequencias e conta os
resíduos, imprimindo seu resultados para STDOUT. Note que este programa
não trabalha com símbolos de ambigüidade.

### Solução 1

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.dist.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class CountResidues {

` /**`  
`  * Pega 3 argumentos, primeiro é o arquivo da sequencia o segundo é o`  
`  * formato da sequencia (case insensitive) e o terceiro é a sequencia`  
`  * do alphabet (ex DNA, também case insensitive)`  
`  */`  
` public static void main(String[] args) {`  
`   //referencia para object to manter os contadores`  
`   Count counts = null;`

`   try {`  
`     //abre o arquivo de sequencia`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`     //adquire um SequenceIterator para as sequencias no arquivo`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(args[1],args[2],br);`

`     //para cada sequence`  
`     while(iter.hasNext()){`  
`       Sequence seq = iter.nextSequence();`

`       //se necessário, inicializa o contador`  
`       if(counts == null){`  
`         counts = new IndexedCount((FiniteAlphabet)seq.getAlphabet());`  
`       }`

`       //itera através dos Symbols na seq`  
`       for (Iterator i = seq.iterator(); i.hasNext(); ) {`  
`         AtomicSymbol sym = (AtomicSymbol)i.next();`  
`         counts.increaseCount(sym,1.0);`  
`       }`  
`     }`

`     //agora imprime os resultados`  
`     for (Iterator i = ((FiniteAlphabet)counts.getAlphabet()).iterator();`  
`          i.hasNext(); ) {`  
`       AtomicSymbol sym = (AtomicSymbol)i.next();`  
`       System.out.println(sym.getName()+" : "+counts.getCount(sym));`  
`     }`  
`   }`  
`   catch (Exception ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>

### Solução 2

<java> import java.io.\*; import java.util.\*;

import org.biojava.bio.dist.\*; import org.biojava.bio.seq.\*; import
org.biojava.bio.seq.io.\*; import org.biojava.bio.symbol.\*;

public class CountResidues2 {

`  /**`  
`  * Pega 3 argumentos, primeiro é o arquivo da sequencia o segundo é o`  
`  * formato da sequencia (case insensitive) e o terceiro é a sequencia`  
`  * do alphabet (ex DNA, também case insensitive)`  
`  */`

` public static void main(String[] args) {`  
`   //referencia o objeto para guardar os contadores`  
`   Count counts = null;`

`   try {`  
`     //abre o arquivo de sequence`  
`     BufferedReader br = new BufferedReader(new FileReader(args[0]));`

`     //adquire um SequenceIterator para as sequencias no arquivo`  
`     SequenceIterator iter =`  
`         (SequenceIterator)SeqIOTools.fileToBiojava(args[1],args[2],br);`

`     //para cada sequence`  
`     while(iter.hasNext()){`  
`       Sequence seq = iter.nextSequence();`

`       //se necessário inicializa os contadores`  
`       if(counts == null){`  
`         counts = new IndexedCount((FiniteAlphabet)seq.getAlphabet());`  
`       }`

`       //iterate através dos Symbols na seq`  
`       for (Iterator i = seq.iterator(); i.hasNext(); ) {`  
`         Symbol sym = (Symbol)i.next();`

`         /*`  
`          * O Símbolo pode ser ambíguo assim soma uma conta parcial para cada Símbolo`  
`          * isso compõe o Símbolo de ambigüidade. Ex a ambigüidade de DNA que n é feito`  
`          * de um Alfabeto de quatro Símbolos, assim soma-se 0.25 ao count de cada um.`  
`          */`  
`         FiniteAlphabet subSymbols = (FiniteAlphabet)sym.getMatches();`  
`         for (Iterator i2 = subSymbols.iterator(); i2.hasNext(); ) {`  
`           AtomicSymbol sym2 = (AtomicSymbol)i2.next();`  
`           counts.increaseCount(sym2, 1.0 / (double)subSymbols.size());`  
`         }`  
`       }`  
`     }`

`     //agora imprime os resultados`  
`     for (Iterator i = ((FiniteAlphabet)counts.getAlphabet()).iterator();`  
`          i.hasNext(); ) {`  
`       AtomicSymbol sym = (AtomicSymbol)i.next();`  
`       System.out.println(sym.getName()+" : "+counts.getCount(sym));`  
`     }`  
`   }`  
`   catch (Exception ex) {`  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>
