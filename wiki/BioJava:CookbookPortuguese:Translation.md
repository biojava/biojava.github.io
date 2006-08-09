---
title: BioJava:CookbookPortuguese:Translation
---

Como eu traduzo um SymbolList ou Sequence?
------------------------------------------

Para traduzir uma sequencia de DNA você precisa fazer o seguinte

-   [Transcrever para
    RNA](Biojava:Cookbook:Sequence:Transcribe "wikilink").
-   Adquirir uma (codon) usando SymbolList.
-   Traduzir para proteína.

Quase tudo isto pode ser alcançado utilizando métodos estáticos de
classes especiais do BioJava (Classes Tools). O bloco de código a seguir
demonstra o procedimento este procedimento, obviamente se você já tem
uma sequência de RNA não há necessidade de transcreve-la.

*NOTA: se você tentar e criar uma 'triplet view' em uma SymbolList ou
Sequence que seu tamanho não é uniformemente divisível por três, será
lançado uma IllegalArgumentException. Veja 'como adquirir uma
subsequencia' para uma descrição de como adquirir uma porção de uma
Sequence para tradução.*

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.seq.\*;

public class Translate {

` public static void main(String[] args) {`  
`   try {`  
`     //cria uma DNA SymbolList`  
`     SymbolList symL = DNATools.createDNA("atggccattgaatga");`

`     //transcreve para RNA (após biojava 1.4 este método está obsoleto)`  
`     symL = RNATools.transcribe(symL);`

`     //transcreve para RNA (utilize este método após biojava 1.4)`  
`     symL = DNATools.toRNA(symL);`  
`     `  
`     //transcreve para proteina`  
`     symL = RNATools.translate(symL);`

`     //mostra que funcionou`  
`          System.out.println(symL.seqString());`  
`    }catch (IllegalAlphabetException ex) {`  
`     `  
`    `  
`     /* `  
`      * isto acontecerá se você tentar transcrever uma não sequencia de DNA ou traduzir`  
`      * uma sucessão que não é uma triplet view em uma sequencia de RNA.`  
`      */`  
`      ex.printStackTrace();`  
`    }catch (IllegalSymbolException ex) {`  
`     // this will happen if non IUB characters are used to create the DNA SymbolList`  
`      ex.printStackTrace();`  
`    }`  
`  }`

} </java>
