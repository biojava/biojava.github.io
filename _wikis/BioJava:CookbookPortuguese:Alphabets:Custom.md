---
title: BioJava:CookbookPortuguese:Alphabets:Custom
---

Como crio alfabetos customizados a partir de simbolos customizados?
-------------------------------------------------------------------

Este exemplo demonstra a criaçao de um alfabeto 'binário' que terá dois
[Simbolos](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html),
zero e um. O
[Simbolo](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Symbol.html)
customizado e o
[Alfabeto](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/Alphabet.html)
podem ser usados para criar
[SymbolList](http://www.biojava.org/docs/api14/org/biojava/bio/symbol/SymbolList.html),
[Sequences](http://www.biojava.org/docs/api14/org/biojava/bio/seq/Sequence.html),
[Distributions](http://www.biojava.org/docs/api14/org/biojava/bio/dist/Distribution.html),
etc.

<java> import org.biojava.bio.symbol.\*; import org.biojava.bio.\*;
import java.util.\*;

public class Binary {

` public static void main(String[] args) {`

`   //cria o Simbolo "zero" sem anotação ou anotação vazia`  
`   Symbol zero =`  
`       AlphabetManager.createSymbol("zero", Annotation.EMPTY_ANNOTATION);`

`   //cria o Simbolo "um"`  
`   Symbol one =`  
`       AlphabetManager.createSymbol("um", Annotation.EMPTY_ANNOTATION);`

`   //agrega os Simbolos em uma Coleção`  
`   Set symbols = new HashSet();`  
`   symbols.add(zero); symbols.add(one);`

`   //cria o Alfabeto Binário`  
`   FiniteAlphabet binary = new SimpleAlphabet(symbols, "Binary");`

`   //navega entre os simbolos para exibir todo o trabalho`  
`   for (Iterator i = binary.iterator(); i.hasNext(); ) {`  
`     Symbol sym = (Symbol)i.next();`  
`     System.out.println(sym.getName());`  
`   }`

`   //geralmente se registra os Alfabetos recem-criados com AlphabetManager`  
`   AlphabetManager.registerAlphabet(binary.getName(), binary);`

`   /*`  
`    * O Alfabeto recém-criado deverá ser registrado com o`  
`    * AlphabetManager sob o nome "Binary". Se voce recuperar uma  instancia`  
`    * dele usando seu nome deve ser canonical com a instancia anterior`  
`    */`  
`   Alphabet alpha = AlphabetManager.alphabetForName("Binary");`

`   //verifica o status canonical`  
`   System.out.println(alpha == binary);`  
` }`

} </java>
