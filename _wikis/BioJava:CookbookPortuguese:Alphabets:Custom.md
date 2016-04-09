---
title: BioJava:CookbookPortuguese:Alphabets:Custom
---

Como crio alfabetos customizados a partir de simbolos customizados?
-------------------------------------------------------------------

Este exemplo demonstra a criação de um alfabeto 'binário' que terá dois
elementos *Symbol*, zero e um. O *Symbol* customizado e o *Alphabet*
podem ser usados para criar *SymbolList*, *Sequences*, *Distributions*,
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
