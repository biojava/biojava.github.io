---
title: BioJava:CookbookPortuguese:Sequence
---

Como eu crio uma Sequence de uma String ou crio de volta uma String de um Objeto Sequence?
------------------------------------------------------------------------------------------

Há muito tempo que se utiliza uma sequencia representando-a como uma
*String* como por exemplo "atgccgtggcatcgaggcatatagc". Este é um método
bastante conveniente para vizualizar de forma simples a representação de
um polímero biológico complexo. O BioJava utiliza *SymbolLists* e
*Sequences* para representar este polímeros biológicos como Objetos. Um
objeto do tipo ''Sequence' estende *SymbolList* e provê métodos extras
para armazenar coisas, como por exemplo, o nome da sequencia ou qualquer
critério.

Dentro da *Sequence* e *SymbolList* o polímero não é armazenado como uma
String. O BioJava diferencia resíduos de polímero diferentes que usam
objetos de Symbol que vêm de Alphabets diferentes. Deste modo é fácil
dizer se uma sequencia pertence a DNA ou RNA ou qualquer outra coisa e o
'A' símbolo de DNA não é igual para o 'A' símbolo de RNA. Os detalhes de
Symbols, SymbolLists e Alphabets estão seguros aqui. A parte crucial
está na necessidade de ter um modo para um programador converter entre a
String facilmente legível e o BioJava Object e o inverso. Para fazer
isto, o BioJava tem Tokenizers que pode ler uma String de um texto e
pode analisar isto em um Sequence do BioJava ou um objeto de SymbolList.
No caso de DNA, RNA e Protein você pode fazer isto com uma única chamada
de método. A chamada é feita para um método estático de DNATools,
RNATools ou ProteinTools.

### String para SymbolList

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class StringToSymbolList {

` public static void main(String[] args) {`  
`  `  
`   try {`  
`     //cria um DNA SymbolList de uma String`  
`     SymbolList dna = DNATools.createDNA("atcggtcggctta");`

`     //cria um RNA SymbolList de uma String`  
`     SymbolList rna = RNATools.createRNA("auugccuacauaggc");`

`     //cria uma Protein SymbolList de uma String`  
`     SymbolList aa = ProteinTools.createProtein("AGFAVENDSA");`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     //isto irá acontecer se utilizar um caracter não aceito pela IUB.`  
`     ex.printStackTrace();`  
`   }`  
`  `  
` }`

} </java>

### String para Sequence

<java> import org.biojava.bio.seq.\*; import org.biojava.bio.symbol.\*;

public class StringToSequence {

` public static void main(String[] args) {`

`   try {`  
`     //cria um DNA sequence com o nome dna_1`  
`     Sequence dna = DNATools.createDNASequence("atgctg", "dna_1");`

`     //cria um RNA sequence com o nome rna_1`  
`     Sequence rna = RNATools.createRNASequence("augcug", "rna_1");`

`     //cria uma Protein sequence com o nome prot_1`  
`     Sequence prot = ProteinTools.createProteinSequence("AFHS", "prot_1");`  
`   }`  
`   catch (IllegalSymbolException ex) {`  
`     //uma exceção é lançada se voce utilizar um simbolo não IUB `  
`     ex.printStackTrace();`  
`   }`  
` }`

} </java>

### SymbolList para String

Voce pode chamar o metodo seqString() em um SymbolList ou uma Sequencia
para adquirir sua versão de Stringified.

<java> import org.biojava.bio.symbol.\*;

public class SymbolListToString {

` public static void main(String[] args) {`  
`   SymbolList sl = null;`  
`   //codigo aqui para instanciar sl`  
`  `  
`   //converte sl numa String`  
`   String s = sl.seqString();`  
` }`

} </java>
