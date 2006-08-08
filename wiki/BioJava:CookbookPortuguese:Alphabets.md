---
title: BioJava:CookbookPortuguese:Alphabets
---

Como eu pego um Alfabeto de DNA, RNA ou Proteina?
-------------------------------------------------

No BioJava uma coleção de *Symbol* nada mais é do que um objeto
*Alphabet*. Os alfabetos comuns na biologia ([DNA](wp:DNA "wikilink"),
[RNA](wp:RNA "wikilink"), [protein](wp:protein "wikilink"), etc) são
registrados com o uso da classe *AlphabetManager* do BioJava na
inicialização e podem ser acessados utilizando o seu nome. Os alfabetos
[DNA](wp:DNA "wikilink"), [RNA](wp:RNA "wikilink") e
[Proteina](wp:protein "wikilink") também podem ser acessados utilizando
métodos estáticos das Classes *DNATools*, *RNATools* e respectivamente
*ProteinTools*.

Ambas abordagens são apresentadas no exemplo abaixo:

<java> import org.biojava.bio.symbol.\*; import java.util.\*; import
org.biojava.bio.seq.\*;

public class AlphabetExample {

` public static void main(String[] args) {`  
`   Alphabet dna, rna, prot;`

`   //pega o alfabeto do DNA pelo nome`  
`   dna = AlphabetManager.alphabetForName("DNA");`

`   //pega o alfabeto do RNA pelo nome`  
`   rna = AlphabetManager.alphabetForName("RNA");`

`   //pega o alfabeto da Proteina pelo nome`  
`   prot = AlphabetManager.alphabetForName("PROTEIN");`  
`   //pega o alfabeto da proteina que inclui o terminador *     `  
`   prot = AlphabetManager.alphabetForName("PROTEIN-TERM");`

`   //obtem os mesmos Alfabetos das Ferramentas da Classe`  
`   dna = DNATools.getDNA();`  
`   rna = RNATools.getRNA();`  
`   prot = ProteinTools.getAlphabet();`  
`   //ou com um único simbolo *`  
`   prot = ProteinTools.getTAlphabet();`  
` }`

} </java>
